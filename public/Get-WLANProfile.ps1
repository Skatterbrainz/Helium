function Get-WLANProfile {
	<#
	.SYNOPSIS
		Get Wireless profile names and passwords.
	.DESCRIPTION
		Get Wireless connection profile names and passwords.
		Same as using: netsh wlan show profiles
	.PARAMETER Name
		Optional. Name of WLAN profile to query.
		Default (blank) returns all WLAN profiles.
	.PARAMETER ClearText
		Optional. Return passwords in clear text.
		Default is to return as secure string values.
	.EXAMPLE
		Get-WLANProfile

		Returns all WLAN profiles with encrypted passwords.
	.EXAMPLE
		Get-WLANProfile -Name Home123

		Returns WLAN profile Home123 and its encrypted password.
	.EXAMPLE
		Get-WLANProfile -Name Home123 -ClearText
		
		Returns WLAN profile Home123 and its password in clear text.
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WLANProfile.md
	#>
	[CmdletBinding()]
	param (
		[parameter()][string]$Name,
		[parameter()][switch]$ClearText
	)
	try {
		if ($PSVersionTable.Platform -eq 'Unix') { throw "Not supported on Linux systems" }
		$names = @()
		$profiles = (netsh.exe wlan show profiles) -match ':'
		foreach ($item in $profiles[1..1000]) {
			$names += $item.Substring(27)
		}
		if ($PSBoundParameters.ContainsKey('Name') -and (![string]::IsNullOrWhiteSpace($Name))) {
			$names = @($names | Where-Object {$_ -eq $Name})
		}
		foreach ($name in $names) {
			$content = (netsh.exe wlan show profile name="$name" key=clear | findstr.exe Key)
			if ($content -match "Key Content") {
				if ($ClearText) {
					$ppwd = $content.Substring(28).Trim()
				} else {
					$ppwd = $content.Substring(28).Trim() | ConvertTo-SecureString -AsPlainText -Force
				}
			} else {
				$ppwd = ""
			}
			[pscustomobject]@{
				Name = $name
				Password = $ppwd
			}
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}