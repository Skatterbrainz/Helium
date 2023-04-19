function Set-NetConnectionPrivate {
	<#
	.SYNOPSIS
	.DESCRIPTION
	.EXAMPLE
	.LINK
	#>
	[CmdletBinding()]
	param (
		[parameter()][switch]$Show
	)
	if (!$Show) {
		$connections = @(Get-NetConnectionProfile | where {$_.IPv4Connectivity -ne "NoTraffic" -and $_.NetworkCategory -ne "Private"})
		if ($connections.Count -gt 0) {
			$conns = @($connections | Out-GridView -Title "Select Profiles to Set as Private" -OutputMode Multiple)
			if ($conns.Count -gt 0) {
				foreach ($conn in $conns) {
					try {
						Write-Host "Setting profile to private: $($conn.Name)"
						Set-NetConnectionProfile -InterfaceIndex $conn.InterfaceIndex -NetworkCategory Private -ErrorAction Stop
					} catch {
						Write-Error $_.Exception.Message
					}
				}
			}
		} else {
			Write-Host "No connection profiles are active which are not already private"
		}
	} else {
		Get-NetConnectionProfile
	}
}