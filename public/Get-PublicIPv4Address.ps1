function Get-PublicIPv4Address {
	param (
		[parameter()][string]$Uri = "http://ipconfig.me/ip"
	)
	<#
	.SYNOPSIS
		Get current public IPv4 address
	.DESCRIPTION
		Geez. Do I really need to elaborate on this one?
	.PARAMETER Uri
		URI to use for requesting reverse ping. Default is http://ipconfig.me/ip
	.EXAMPLE
		Get-PublicIPv4Address
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-PublicIPv4Address.md
	#>
	try {
		
		$response = Invoke-WebRequest -Uri $Uri -UseBasicParsing
		#$pattern = 'id="ip_address">'
		#$beginstring = $response.Content.Substring($response.Content.IndexOf($pattern)+16)
		#$result = $beginstring.Substring(0, $beginstring.IndexOf("</"))
		if ($response.StatusCode -eq 200) {
			$response.Content
		} else {
			throw "HTTP response code: $($response.StatusCode)"
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}
