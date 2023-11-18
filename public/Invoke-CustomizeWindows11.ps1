function Invoke-CustomizeWindows11 {
	<#
	.SYNOPSIS
		View or Toggle Windows 11 Customization Settings
	.DESCRIPTION
		View or Toggle Windows 11 Customization Settings using the PowerShell module CustomizeWindows11 by Jaap Brasser
	.PARAMETER Toggle
		Toggle the current value (if Enabled, set to Disabled)
		Note that if a setting is not yet defined in the Registry, it shows as ----
	.EXAMPLE
		Invoke-CustomizeWindows11

		Displays current settings
	.EXAMPLE
		Invoke-CustomizeWindows11 -Toggle

		Displays current settings in a GridView. When a setting is selected and the OK button
		is clicked,the setting is toggled to the opposite value.
	.NOTES
		Requires module CustomizeWindows11 by Jaap Brasser, which also indicates this function
		has only been tested on Windows 11.
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-CustomizeWindows11.md
	#>
	[CmdletBinding()]
	param(
		[parameter()][switch]$Toggle
	)
	try {
		$unset = '----'
		if (!(Get-Module CustomizeWindows11 -ListAvailable)) {
			throw "Required Module not installed: CustomizeWindows"
		}
		$results = @()
		$cmdlist = Get-Command -Module CustomizeWindows11 get* | Select-Object -ExpandProperty Name
		foreach ($cn in $cmdlist) {
			$label = $cn.Split("-")[1]
			try {
				$results += & $cn
			} catch {
				$results += [pscustomobject]@{Setting = $label; Enabled = $unset}
			}
		}
		if ($Toggle) {
			$choice = $results | Out-GridView -Title "Select Configuration Item to Toggle" -OutputMode Single
			if ($choice) {
				$cmdsuffix = $choice.Setting
				$cmdname = "Set-$($cmdsuffix)"
				switch ($choice.Enabled) {
					$True {
						Write-Host "enabled: $($choice.Enabled)"
						Write-Host "Applying: $cmdname -Disable"
						& $cmdname -Disable
					}
					Default {
						Write-Host "enabled: $($choice.Enabled)"
						Write-Host "Applying: $cmdname -Enable"
						& $cmdname -Enable
					}
				}
			}
		} else {
			$results
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}