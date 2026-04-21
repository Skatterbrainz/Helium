function Publish-GalleryUpdate {
	<#
	.SYNOPSIS
		Publishes updates to a PowerShell gallery.
	.DESCRIPTION
		This function copies the contents of a specified path to a temporary location,
		excludes specified directories, and optionally publishes the updates to a
		PowerShell gallery.
	.PARAMETER Path
		The path to the directory containing the updates to be published.
	.PARAMETER TempPath
		The temporary path where the updates will be copied before publishing. Defaults to a "CleanModules" folder in the user's Documents directory.
	.PARAMETER Commit
		A switch that, when specified, will commit the changes to the gallery repository.
	.PARAMETER Cleanup
		A switch that, when specified, will clean up the temporary files after publishing.
	.PARAMETER ExcludeDirs
		An array of directory names to exclude from the copy operation. Defaults to '.git' and 'retired'.
	.PARAMETER Repository
		The name of the gallery repository to which the updates will be published. Defaults to "PSGallery".
	.PARAMETER ApiKeyEnvVar
		The name of the environment variable that contains the API key for the gallery repository. Defaults to "PSAPIKey".
	.EXAMPLE
		Publish-GalleryUpdate -Path "C:\MyModuleRepo" -Commit -Cleanup
		This example copies the contents of "C:\MyModuleRepo" to a temporary location, publishes the updates to the default gallery repository, and then cleans up the temporary files.
	.EXAMPLE
		Publish-GalleryUpdate -Path "C:\MyModuleRepo" -TempPath "C:\Temp\CleanModules" -ExcludeDirs @('.git', 'docs') -Repository "MyCustomRepo" -ApiKeyEnvVar "MyRepoApiKey"
		This example copies the contents of "C:\MyModuleRepo" to "C:\Temp\CleanModules", excluding the '.git' and 'docs' directories, and prepares the updates for publishing to "MyCustomRepo" using the API key stored in the "MyRepoApiKey" environment variable. It does not commit the changes or clean up the temporary files.
	.NOTES
		Requires the PowerShellGet module to be installed and configured for the specified repository.
		Ensure that the API key environment variable is set before using the -Commit switch.
	#>
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$true)][string]$Path,
        [parameter(Mandatory=$false)][string]$TempPath = "$(Resolve-Path "~\Documents\CleanModules")",
        [parameter(Mandatory=$false)][switch]$Commit,
		[parameter(Mandatory=$false)][switch]$Cleanup,
		[parameter(Mandatory=$false)][string[]]$ExcludeDirs = @('.git', 'retired'),
		[parameter(Mandatory=$false)][string]$Repository = "PSGallery",
		[parameter(Mandatory=$false)][string]$ApiKeyEnvVar = "PSAPIKey"
    )
	if (-not (Test-Path -Path $Path)) {
		Write-Warning "The specified path does not exist: '$Path'"
		return
	}
	if (-not (Test-Path -Path $TempPath)) {
		Write-Warning "The specified temporary path '$TempPath' does not exist."
		return
	}
	# Copy repo contents to the temp path while explicitly skipping the specified directories.
	$destination = Join-Path -Path $TempPath -ChildPath (Split-Path -Path $Path -Leaf)

	if (Test-Path -Path $destination) {
		Write-Warning "Removing existing path '$destination'..."
		Remove-Item -Path $destination -Recurse -Force
	}

	New-Item -Path $destination -ItemType Directory -Force | Out-Null

	Get-ChildItem -LiteralPath $Path -Force |
		Where-Object { $_.Name -notin $ExcludeDirs } |
		ForEach-Object {
			Copy-Item -Path $_.FullName -Destination $destination -Recurse -Force
		}

	Write-Output "Copied '$Path' to '$destination' - excluding the specified directories: $($ExcludeDirs -join ', ')"
	if ($Commit.IsPresent) {
		Write-Host "Committing changes to $Repository repository..." -ForegroundColor Green
		$apiKey = [Environment]::GetEnvironmentVariable($ApiKeyEnvVar)
		Publish-PSResource -Path $destination -Repository $Repository -ApiKey $apiKey -Verbose
	} else {
		Write-Host "Skipping commit to $Repository repository. Use -Commit switch to publish." -ForegroundColor Yellow
		#Write-Host "Command: Publish-PSResource -Path $destination -Repository `$Repository` -ApiKey ([Environment]::GetEnvironmentVariable($ApiKeyEnvVar)) -Verbose"
	}
	if ($Cleanup.IsPresent) {
		Write-Host "Cleaning up temporary path '$destination'..." -ForegroundColor Green
		Remove-Item -Path $destination -Recurse -Force
		Write-Host "Cleanup completed." -ForegroundColor Green
	} else {
		Write-Host "Use -Cleanup switch to remove the copied files." -ForegroundColor Yellow
	}
}