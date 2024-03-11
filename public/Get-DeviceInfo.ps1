function Get-DeviceInfo {
	<#
	.SYNOPSIS
		Get Machine and OS summary information
	.DESCRIPTION
		Get Machine and OS summary information
	.PARAMETER none
	.EXAMPLE
		Get-DeviceInfo
	.NOTES
		Tested on Windows 10, 11, Windows Server 2012 R2 to 2025
		Tested on Ubuntu Linux 22.04, Linux Mint 21.3
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-DeviceInfo.md
	#>
	[CmdletBinding()]
	param ()
	try {
		if ($PSVersionTable.Platform -ne 'Unix') {
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
		} else {
			$result = $null
			$result = [ordered]@{}
			$categories = ('bios','chassis','processor','memory')
			foreach ($category in $categories) {
				Write-Verbose "category: $category"
				$items = Invoke-Command -ScriptBlock { sudo dmidecode -t $category } |
					Where-Object {($_.length -gt 1) -and ([int]($_[0] ) -eq 9) -and ([int]($_[1]) -ne 9)} |
						Foreach-Object { $_.Trim() }
				foreach ($item in $items) {
					$parts = $item.Split(":")
					if (![string]::IsNullOrWhiteSpace($parts[1])) {
						$keyname = "$($category)_$($parts[0].Trim())"
						$keyval  = $parts[1].Trim()
						$result[$keyname] = $keyval
					}
				}
			}
			Write-Host "For more details, use: dmidecode -t <category>. Categories: bios,system,baseboard,chassis,processor,memory,cache,connector,slot" -ForegroundColor Cyan
			[pscustomobject]$result
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}