function Export-BrowserProfile {
	<#
	.SYNOPSIS
		Exports browser profiles to a destination path.
	
	.DESCRIPTION
		This function exports user profiles from supported browsers (Chrome, Edge, Firefox, Brave) to a specified destination path. 
		It supports exporting from multiple browsers in parallel and can utilize rsync on non-Windows platforms for efficient copying.
	.PARAMETER Browser
		The browser to export profiles from. Valid values: Chrome, Edge, Firefox, Brave
	
	.PARAMETER DestinationPath
		The target directory where profile backups will be created.
	
	.PARAMETER All
		Export profiles from all supported browsers.
	
	.PARAMETER MaxParallelJobs
		Maximum number of parallel backup operations. Default: 4
	
	.PARAMETER Quiet
		Suppress verbose output.
	
	.EXAMPLE
		Export-BrowserProfile -Browser Brave -DestinationPath "/backup/browsers"
	
		Exports Brave browser profiles to the specified destination.
	.EXAMPLE
		Export-BrowserProfile -Browser Chrome -DestinationPath "C:\Backup\Chrome"
		
		Exports Chrome browser profiles to the specified destination.
	.EXAMPLE
		Export-BrowserProfile -All -DestinationPath "/backup/browsers" -MaxParallelJobs 8
		
		Exports profiles from all supported browsers to the specified destination using up to 8 parallel jobs.
	.EXAMPLE
		Export-BrowserProfile -All -DestinationPath "D:\BrowserBackups" -Quiet

		Exports profiles from all supported browsers to the specified destination with minimal output.
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Export-BrowserProfile.md
	#>
	[CmdletBinding(DefaultParameterSetName = 'Single')]
	param(
		[Parameter(Mandatory = $true, ParameterSetName = 'Single')]
		[ValidateSet('Chrome', 'Edge', 'Firefox', 'Brave')]
		[string]$Browser,
		
		[Parameter(Mandatory = $true, ParameterSetName = 'All')]
		[switch]$All,
		
		[Parameter(Mandatory = $true)]
		[string]$DestinationPath,
		
		[Parameter(Mandatory = $false)]
		[ValidateRange(1, 16)]
		[int]$MaxParallelJobs = 4,

		[parameter(Mandatory = $false)]
		[switch]$Quiet
	)
	
	try {
		# Detect OS for cross-platform compatibility
		$isWindowsOS = if ($PSVersionTable.PSVersion.Major -ge 6) { $IsWindows } else { $true }
		$useRsync = -not $isWindowsOS -and (Get-Command rsync -ErrorAction SilentlyContinue)
		
		# Determine which browsers to process
		$browsersToProcess = if ($All) {
			@('Chrome', 'Edge', 'Firefox', 'Brave')
		} else {
			@($Browser)
		}
		
		# Ensure destination path exists
		if (-not (Test-Path -Path $DestinationPath)) {
			New-Item -Path $DestinationPath -ItemType Directory -Force | Out-Null
			Write-Verbose "Created destination directory: $DestinationPath"
		}
		
		if (-not $Quiet) {
			Write-Host "Copy method: $(if ($useRsync) {'rsync'} else {'Copy-Item'})" -ForegroundColor Cyan
			Write-Host "Max parallel jobs: $MaxParallelJobs`n" -ForegroundColor Cyan
		}
		
		# Collect all profile tasks
		$allTasks = @()
		
		foreach ($browserName in $browsersToProcess) {
			if (-not $Quiet) {
				Write-Host "=== Querying $browserName profiles ===" -ForegroundColor Yellow
			}
			
			try {
				$browserProfiles = Get-BrowserProfile -Browser $browserName
				
				if (-not $browserProfiles) {
					Write-Warning "No $browserName profiles found."
					continue
				}
				
				# Create browser-specific subdirectory
				$browserDestination = Join-Path -Path $DestinationPath -ChildPath $browserName
				if (-not (Test-Path -Path $browserDestination)) {
					New-Item -Path $browserDestination -ItemType Directory -Force | Out-Null
				}
				
				foreach ($browserProfile in $browserProfiles) {
					$allTasks += [PSCustomObject]@{
						Browser      = $browserName
						ProfileName  = $browserProfile.Name
						ProfilePath  = $browserProfile.Path
						TargetFolder = Join-Path -Path $browserDestination -ChildPath $browserProfile.Name
					}
				}
			} catch {
				if (-not $Quiet) {
					Write-Warning "Failed to get profiles for $($browserName): $($_.Exception.Message)"
				}
			}
		}
		
		if ($allTasks.Count -eq 0) {
			if (-not $Quiet) {
				Write-Warning "No profiles found to export."
			}
			return
		}
		
		if (-not $Quiet) {
			Write-Host "`n=== Starting parallel export of $($allTasks.Count) profile(s) ===`n" -ForegroundColor Green
		}
		
		# Execute backups in parallel
		$results = $allTasks | ForEach-Object -ThrottleLimit $MaxParallelJobs -Parallel {
			$task = $_
			$useRsyncLocal = $using:useRsync
			
			$result = [PSCustomObject]@{
				Browser     = $task.Browser
				ProfileName = $task.ProfileName
				Success     = $false
				Message     = ""
			}
			
			try {
				# Resolve any tilde or relative paths to absolute paths
				$resolvedSourcePath = [System.IO.Path]::GetFullPath($task.ProfilePath.Replace('~', $HOME))
				$resolvedTargetPath = [System.IO.Path]::GetFullPath($task.TargetFolder.Replace('~', $HOME))
				
				if (-not (Test-Path -Path $resolvedSourcePath)) {
					$result.Message = "Source path not found: $resolvedSourcePath"
					return $result
				}
				
				if ($useRsyncLocal) {
					# Use rsync on Linux/macOS (no -z for local operations)
					$rsyncArgs = @(
						'-av',
						'--delete',
						'--exclude=.DS_Store',
						"$resolvedSourcePath/",
						"$resolvedTargetPath/"
					)
					
					$rsyncResult = & rsync @rsyncArgs 2>&1
					
					if ($LASTEXITCODE -eq 0) {
						$result.Success = $true
						$result.Message = "Exported via rsync"
					} else {
						$result.Message = "rsync failed: $rsyncResult"
					}
				} else {
					# Use Copy-Item on Windows
					# Detect if destination is on a network drive
					$targetDrive = Split-Path -Qualifier $resolvedTargetPath
					$isNetworkDrive = $false
					
					if ($targetDrive) {
						try {
							$driveInfo = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='$targetDrive'" -ErrorAction SilentlyContinue
							$isNetworkDrive = $driveInfo -and $driveInfo.DriveType -eq 4  # DriveType 4 = Network Drive
						} catch {
							# Fallback to UNC path detection if CIM query fails
							$isNetworkDrive = $resolvedTargetPath -match '^\\\\'
						}
					} else {
						# Handle UNC paths that don't have drive letters
						$isNetworkDrive = $resolvedTargetPath -match '^\\\\'
					}
					
					if ($isNetworkDrive) {
						# For network destinations, create archive in temp and copy
						$tempDir = Join-Path -Path $env:TEMP -ChildPath "BrowserBackup-$(Get-Date -Format 'yyyyMMdd-HHmmss')-$([System.Guid]::NewGuid().ToString('N')[0..7] -join '')"
						$tempProfileDir = Join-Path -Path $tempDir -ChildPath (Split-Path -Leaf $resolvedSourcePath)
						$archivePath = Join-Path -Path $tempDir -ChildPath "$($task.ProfileName).zip"
						$finalArchivePath = Join-Path -Path (Split-Path -Parent $resolvedTargetPath) -ChildPath "$($task.ProfileName).zip"
						
						try {
							# Create temp directory and copy profile
							New-Item -Path $tempDir -ItemType Directory -Force | Out-Null
							Copy-Item -Path $resolvedSourcePath -Destination $tempProfileDir -Recurse -Force -ErrorAction Stop
							
							# Create zip archive
							Compress-Archive -Path $tempProfileDir -DestinationPath $archivePath -CompressionLevel Optimal -Force
							
							# Copy archive to network location
							Copy-Item -Path $archivePath -Destination $finalArchivePath -Force -ErrorAction Stop
							
							$result.Success = $true
							$result.Message = "Archived and copied to network location"
						} finally {
							# Clean up temp directory
							if (Test-Path -Path $tempDir) {
								Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
							}
						}
					} else {
						# Local destination - direct copy
						Copy-Item -Path $resolvedSourcePath -Destination $resolvedTargetPath -Recurse -Force -ErrorAction Stop
						$result.Success = $true
						$result.Message = "Exported via Copy-Item"
					}
				}
			} catch {
				$result.Message = "Error: $($_.Exception.Message)"
			}
			
			return $result
		}
		
		# Display results
		if (-not $Quiet) {
			Write-Host "`n=== Export Results ===`n" -ForegroundColor Yellow
		}
		
		$successCount = 0
		$failureCount = 0
		
		foreach ($result in $results) {
			if ($result.Success) {
				if (-not $Quiet) {
					Write-Host "✓ " -ForegroundColor Green -NoNewline
				}
				$successCount++
			} else {
				if (-not $Quiet) {
					Write-Host "✗ " -ForegroundColor Red -NoNewline
				}
				$failureCount++
			}
			if (-not $Quiet) {
				Write-Host "[$($result.Browser)] Profile '$($result.ProfileName)': $($result.Message)"
			}
		}
		
		if (-not $Quiet) {
			Write-Host "`n=== Summary ===" -ForegroundColor Yellow
			Write-Host "Total profiles: $($results.Count)" -ForegroundColor Cyan
			Write-Host "Successful: $successCount" -ForegroundColor Green
			Write-Host "Failed: $failureCount" -ForegroundColor $(if ($failureCount -gt 0) { 'Red' } else { 'Green' })
		}
	} catch {
		Write-Error "Error during export operation: $($_.Exception.Message)"
	}
}
