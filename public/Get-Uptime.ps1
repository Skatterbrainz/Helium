function Get-UpTime {
	<#
	.SYNOPSIS
		Get system uptime
	.DESCRIPTION
		Get system uptime (time since last restart)
	.PARAMETER ComputerName
		Optional. Name of remote computer to query
	.PARAMETER Credential
		Optional. Credential to use for remote connection when using -ComputerName
	.EXAMPLE
		Get-UpTime
	.EXAMPLE
		Get-UpTime -ComputerName Server123
	.EXAMPLE
		Get-UpTime -ComputerName Server123 -Credential $myCred
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-UpTime.md
	#>
	[CmdletBinding()]
	param (
		[parameter()][string]$ComputerName,
		[parameter()][pscredential]$Credential
	)
	try {
		if (![string]::IsNullOrWhiteSpace($ComputerName)) {
			$params = @{
				ComputerName = $ComputerName
				ErrorAction = 'Stop'
			}
			if ($null -ne $Credential) {
				$params['Credential'] = $Credential
				$params['Authentication'] = 'Negotiate'
			}
			$session = New-CimSession @params
			Get-CimInstance -CimSession $session -ClassName Win32_OperatingSystem | Select-Object CSName,LastBootupTime
		} else {
			Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object CSName,LastBootupTime
		}
	} catch {
		Write-Error $_.Exception.Message
	} finally {
		if (Get-CimSession $session) { $null = Remove-CimSession $session }
	}
}