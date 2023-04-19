function Split-URL {
	<#
	.SYNOPSIS
		Split a URL string into component strings
	.DESCRIPTION
		Split a URL string into component strings, such as ("https:","www.contoso.com","sales","default.aspx")
	.PARAMETER Url
		Required. The URL string. Accepts pipeline input
	.EXAMPLE
		Split-Url "https://www.contoso.com/sales/default.aspx"

		Returns ("https:","www.contoso.com","sales","default.aspx")
	.EXAMPLE
		"https://www.contoso.com/sales/default.aspx" | Split-Url

		Returns ("https:","www.contoso.com","sales","default.aspx")
	.EXAMPLE
		("https://www.contoso.com/sales/default.aspx" | Split-Url)[1]

		Returns "www.contoso.com"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Split-Url.md
	#>
	param (
		[parameter(Mandatory=$true,ValueFromPipeline=$true)][string]$Url
	)
	begin {}
	process {
		$url.Split('/')[0..100] | Where-Object {![string]::IsNullOrWhiteSpace($_)}
	}
	end {}
}