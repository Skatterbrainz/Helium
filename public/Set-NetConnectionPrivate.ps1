function Set-NetConnectionPrivate {
	<#
	.SYNOPSIS
		Set IPv4 network connections to "private"
	.DESCRIPTION
		Set IPv4 network connections to private profile state, or list
		current IPv4 network connections and their current profile states
	.EXAMPLE
		Set-NetConnectionPrivate
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Set-NetConnectionPrivate.md
	#>
	[CmdletBinding()]
	param (
		[parameter()][switch]$Show
	)
	try {
		if ($PSVersionTable.Platform -eq 'Unix') { throw "This command only works on Windows" }
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
	} catch {
		Write-Error $_.Exception.Message
	}
}