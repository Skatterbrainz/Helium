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
		[parameter(Mandatory=$False)][string]$ComputerName,
		[parameter(Mandatory=$False)][pscredential]$Credential
	)
	try {
		if ($PSVersionTable.Platform -eq 'Unix') {
			Write-Verbose "Running on Linux"
			if (![string]::IsNullOrWhiteSpace($ComputerName)) {
				Write-Warning "Remote computer queries not supported on Linux"
			}
			Invoke-Command -ScriptBlock { uptime --pretty } -ErrorAction Stop
		} else {
			Write-Verbose "Running on Windows"
			if ($PSBoundParameters.ContainsKey($ComputerName)) {
				$params = @{
					ComputerName = $ComputerName
					ErrorAction = 'Stop'
				}
				if ($null -ne $Credential) {
					$params['Credential'] = $Credential
					$params['Authentication'] = 'Negotiate'
				}
				$session = New-CimSession @params
				Get-CimInstance -CimSession $session -ClassName Win32_OperatingSystem -ErrorAction Stop | Select-Object CSName,LastBootupTime
			} else {
				Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction Stop | Select-Object CSName,LastBootupTime
			}
		}
	} catch {
		Write-Error $_.Exception.Message
	} finally {
		if ((!$IsLinux) -and (Get-CimSession $session)) { $null = Remove-CimSession $session }
	}
}