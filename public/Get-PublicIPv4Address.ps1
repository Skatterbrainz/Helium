function Get-PublicIPv4Address {
	<#
	.SYNOPSIS
		Get current public IPv4 address
	.DESCRIPTION
		Geez. Do I really need to elaborate on this one?
	.PARAMETER (none)
	.EXAMPLE
		Get-PublicIPv4Address
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-PublicIPv4Address.md
	#>
	$response = Invoke-WebRequest "http://ipconfig.me/ip"
	$pattern = 'id="ip_address">'
	$beginstring = $response.Content.Substring($response.Content.IndexOf($pattern)+16)
	$result = $beginstring.Substring(0, $beginstring.IndexOf("</"))
	$result
}
