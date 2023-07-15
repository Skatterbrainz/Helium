function Get-AsciiString {
	<#
	.SYNOPSIS
		Trim leading and trailing spaces from string, and optionally replace non-ASCII characters
	.DESCRIPTION
		Trim leading and trailing spaces from string, and optionally replace non-ASCII characters
		such as diacritic characters with corresponding ASCII characters
	.PARAMETER String
		Required. String value to be trimmed and cleaned.
	.PARAMETER Cleanup
		Optional. Replace diacritic characters with ASCII characters
	.EXAMPLE
		Get-AsciiString 'diakritikós '

		returns 'diakritikós' (trailing space removed)
	.EXAMPLE
		Get-AsciiString 'diakritikós ' -Cleanup

		returns 'diakritikos' (trailing space removed, and ó is replace with o)
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-CleanString.md
	#>
	param (
		[parameter()][string]$String,
		[parameter()][switch]$Cleanup
	)
	if ([string]::IsNullOrWhiteSpace($String)) {
		""
	} else {
		$result = $($String).Trim()
		if ($Cleanup) {
			$result = [Text.Encoding]::ASCII.GetString([Text.Encoding]::GetEncoding("Cyrillic").GetBytes($result))
			$result = ($result -replace "'","") -replace '[^a-zA-Z0-9\- \.\,\;\:]', ''
			$result
		} else {
			$result
		}
	}
}