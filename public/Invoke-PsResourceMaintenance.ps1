function Invoke-PsResourceMaintenance {
	<#
	.SYNOPSIS
		Checks for updates to installed PowerShell modules and optionally updates them.

	.DESCRIPTION
		This function checks all installed PowerShell modules for updates and can optionally update them.

	.PARAMETER UpdateAll
		Updates all installed modules without prompting for confirmation.

	.PARAMETER Quiet
		Suppresses output messages.
	.EXAMPLE
		Invoke-PsResourceMaintenance -UpdateAll
		Updates all installed PowerShell modules to their latest versions.
	.EXAMPLE
		Invoke-PsResourceMaintenance -Quiet
		Checks for updates to installed PowerShell modules without displaying output messages.
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-PsResourceMaintenance.md
	#>
	[CmdletBinding()]
	param(
		[parameter(Mandatory = $False)][switch]$UpdateAll,
		[parameter(Mandatory = $False)][switch]$Quiet
	)

	# get all installed modules and latest version of each
	$modules = Get-InstalledModule | Sort-Object Name
	if (!$Quiet.IsPresent) { Write-Host "$($modules.Count) modules found." }

	# check each module for newer versions available
	$updates = $modules | ForEach-Object {
		$module = $_
		if (!$Quiet.IsPresent) { Write-Host "Checking module: $($module.Name)" }
		$available = Find-PSResource -Name $module.Name -ErrorAction SilentlyContinue
		if ($available -and $available.Version -gt $module.Version) {
			if ($UpdateAll.IsPresent) {
				if (!$Quiet.IsPresent) { Write-Host "Updating module: $($module.Name) to $($available.Version.ToString())" -ForegroundColor Yellow }
				Update-PSResource -Name $module.Name -Force -ErrorAction SilentlyContinue
			} else {
				# return the module with its current and latest version
				[PSCustomObject]@{
					Name      = $module.Name
					Current   = $module.Version
					Latest    = $available.Version
					Compliant = $False
				}
			}
		} else {
			[PSCustomobject]@{
				Name      = $module.Name
				Current   = $module.Version
				Latest    = $module.Version
				Compliant = $True
			}
		}
	}
	$updates
}