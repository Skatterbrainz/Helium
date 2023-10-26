function Get-CleanText {
	<#
	.SYNOPSIS
		Remove non-ASCII alphanumeric characters from text string
	.DESCRIPTION
		Remove non-ASCII alphanumeric characters from test string, such as diactritics and
		optionally remove spaces.
	.PARAMETER String
		Required. Input string value
	.PARAMETER NoSpaces
		Optional. Remove spaces
	.EXAMPLE
		Get-CleanText "Entrepôt Jalapeño"

		Returns "Entrepot Jalapeno"
	.EXAMPLE
		Get-CleanText "Entrepôt Jalapeño" -NoSpaces

		Returns "EntrepotJalapeno"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-CleanText.md
	#>
	param (
		[parameter()][string]$String,
		[parameter()][switch]$NoSpaces
	)
	if ([string]::IsNullOrWhiteSpace($String)) {
		""
	} else {
		$result = $($String).Trim()
		if ($NoSpaces) {
			$result = $result -replace " ",""
		}
		$result = [Text.Encoding]::ASCII.GetString([Text.Encoding]::GetEncoding("Cyrillic").GetBytes($result))
		$result = ($result -replace "'", "") -replace '[^a-zA-Z0-9\- \.\,\;\:]', ''
		$result
	}
}