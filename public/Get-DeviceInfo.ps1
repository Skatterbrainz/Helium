function Get-DeviceInfo {
	<#
	.SYNOPSIS
		Get Machine and OS summary information
	.DESCRIPTION
		Get Machine and OS summary information
	.PARAMETER none
	.EXAMPLE
		Get-DeviceInfo
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-DeviceInfo.md
	#>
	[CmdletBinding()]
	param ()
	try {
		$cs = Get-CimInstance -ClassName Win32_ComputerSystem
		$os = Get-CimInstance -ClassName Win32_OperatingSystem
		$ut = (New-TimeSpan -Start $os.LastBootUpTime -End (Get-Date))
		[pscustomobject]@{
			Name      = $cs.Name
			Make      = $cs.Manufacturer
			Model     = $cs.Model
			SystemSKU = $cs.SystemSKUNumber
			OS        = $os.Caption
			OSVersion = $os.Version
			OSBuild   = $os.BuildNumber
			LoggedOn  = $env:USERNAME
			BootTime  = $os.LastBootUpTime
			UpTime    = "$($ut.Hours)h : $($ut.Minutes)m : $($ut.Seconds)s"
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}