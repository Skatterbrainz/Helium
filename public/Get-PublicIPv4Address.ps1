function Get-PublicIPv4Address {
	param ()
	<#
	.SYNOPSIS
		Get current public IPv4 address
	.DESCRIPTION
		Geez. Do I really need to elaborate on this one?
	.EXAMPLE
		Get-PublicIPv4Address
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-PublicIPv4Address.md
	#>
	try {
		$response1 = (Invoke-WebRequest -Uri ('http://ipinfo.io/'+(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content)).Content
		$response2 = (Invoke-WebRequest -Uri "api.ipify.org").Content
		if ($response1 -and $response2) {
			$result = $response1 | ConvertFrom-Json
			$result | select-object -Property @{n='ipv4';e={$response2}},@{n='ipv6';e={$_.ip}},@{n='city';e={$_.city}},@{n='region';e={$_.region}},@{n='country';e={$_.country}},@{n='loc';e={$_.loc}},@{n='org';e={$_.org}},@{n='postal';e={$_.postal}},@{n='timezone';e={$_.timezone}}
		} else {
			throw "HTTP response code: $($response.StatusCode)"
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}
