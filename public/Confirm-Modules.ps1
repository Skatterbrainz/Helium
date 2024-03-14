<#
.SYNOPSIS
Check if installed modules are up to date
.DESCRIPTION
Check installed modules against PowerShell Gallery to confirm they
are current version. If not, optionally, update them to current.
.PARAMETER Update
Update modules which are not the latest version.
.PARAMETER Exclude
Names of modules to ignore. Note that local-only modules (not installed from, or available
within the PowerShell Gallery) are ignored as well.
.PARAMETER ExcludePattern
One or more wildcard patterns to filter out module names to exclude them from validation.
Example: Microsoft.Graph.* or Az.*, Microsoft.Graph.*
.EXAMPLE
Confirm-Modules

Checks modules to report current version status: Current, OutOfDate or LocalOnly.
.EXAMPLE
Confirm-Modules -Update

Checks module versions and updates those which report status OutOfDate.
.EXAMPLE
Confirm-Modules -Exclude MyModule,OtherModule -Update

Checks all modules except for MyModule and OtherModule and updates the rest if they
report status OutOfDate.
.EXAMPLE
Confirm-Modules -Exclude MyModule,OtherModule -ExcludePattern Microsoft.Graph.* -Update

Checks all modules except for MyModule and OtherModule and any with names that start
with "Microsoft.Graph." and updates the rest if they report status OutOfDate.
.EXAMPLE
Confirm-Modules -Exclude Az -ExcludePattern Az.*,Microsoft.Graph.* -Update

Checks all modules except for Az and any with names that start
with "Az." or "Microsoft.Graph." and updates the rest if they report status OutOfDate.
.LINK
https://github.com/Skatterbrainz/helium/blob/master/docs/Confirm-Modules.md
#>
function Confirm-Modules {
	[CmdletBinding()]
	param (
		[parameter()][switch]$Update,
		[parameter()][string[]]$Exclude,
		[parameter()][string[]]$ExcludePattern
	)
	try {
		$count1  = 0
		$count2  = 0
		$count3  = 0
		$padnum  = 12
		$updated = 0
		$modules = [System.Collections.ArrayList]::new()
		Write-Host "Checking for all installed modules"
		Get-Module -ListAvailable | Sort-Object Name -Unique | Foreach-Object {
			$moduleVersion = (Get-Module $_.Name -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1 -ExpandProperty Version)
			$modulePath = (Get-Module $_.Name -ListAvailable | Where-Object {$_.Version -eq $moduleVersion} | Select-Object -ExpandProperty Path)
			if ($modulePath -match $env:HOME) {
				$mscope = 'User'
			} else {
				$mscope = 'Machine'
			}
			$null = $modules.Add(
				[pscustomobject]@{Name = $_.Name; Version = $moduleVersion; Path = $modulePath; Scope = $mscope}
			)
		}
		$total = $modules.Count
		Write-Host "$($total) modules were found. Applying filters..." -NoNewline
		if (![string]::IsNullOrEmpty($Exclude)) {
			$modules = $modules | Where-Object {$_.Name -notin $Exclude}
		}
		foreach ($excluded in $ExcludePattern) {
			$modules = $modules | Where-Object {$_.Name -notlike "$excluded"}
		}
		foreach ($module in $modules) {
			Write-Verbose "Checking: $($module.Name)"
			$gmodule = $null
			$lversion = $module.Version.ToString()
			$gmodule = Find-Module -Name $module.Name -ErrorAction SilentlyContinue
			if ($gmodule) {
				if ($gmodule.Version -ne $module.Version) {
					$status = 'OutOfDate'
					$gversion = $gmodule.Version.ToString()
					$count1++
				} else {
					$status = 'Current'
					$gversion = $gmodule.Version.ToString()
					$count2++
				}
			} else {
				$status = 'LocalOnly'
				$gversion = $null
				$count3++
			}
			[pscustomobject]@{
				Name             = $module.Name
				Scope            = $module.Scope
				InstalledVersion = $lversion
				AvailableVersion = $gversion
				Status           = $status
			}
			if ($Update.IsPresent) {
				if ($status -eq 'OutOfDate') {
					if ($module.Scope -eq 'User') {
						Write-Host "Updating module: $($module.Name)" -ForegroundColor Yellow
						Update-Module -Name $module.Name
						$updated++
					} else {
						if (Test-IsAdmin -eq $True) {
							Write-Host "Updating module: $($module.Name)" -ForegroundColor Yellow
							Update-Module -Name $module.Name
							$updated++
						} else {
							Write-Warning "Not running administrator context - Update deferred"
						}
					}
				}
			}
		}
		Write-Host "$(($total).ToString().PadRight($padnum,'.')) modules are installed" -ForegroundColor Yellow
		Write-Host "$(($modules.Count).ToString().PadRight($padnum,'.')) modules are not excluded" -ForegroundColor Cyan
		Write-Host "$(($count2).ToString().PadRight($padnum,'.')) modules are current" -ForegroundColor Green
		Write-Host "$(($count1).ToString().PadRight($padnum,'.')) modules are out of date" -ForegroundColor Red
		Write-Host "$(($updated).ToString().PadRight($padnum,'.')) modules were updated" -ForegroundColor Green
		Write-Host "$(($count3).ToString().PadRight($padnum,'.')) modules are local-only (ignored)" -ForegroundColor DarkGreen
		if (![string]::IsNullOrEmpty($Exclude) -or ![string]::IsNullOrWhiteSpace($ExcludePattern)) {
			Write-Host "$(($total - $($modules.Count)).ToString().PadRight($padnum,'.')) modules were excluded" -ForegroundColor Magenta
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}