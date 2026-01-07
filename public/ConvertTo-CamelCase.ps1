function ConvertTo-CamelCase {
	<#
	.SYNOPSIS
		Converts a string to CamelCase.
	.DESCRIPTION
		This function takes a string input and converts it to CamelCase format.
	.PARAMETER InputString
		The string to be converted to CamelCase.
	.EXAMPLE
		ConvertTo-CamelCase -InputString "hello world"
		Returns "HelloWorld"
	.LINK
		...
	#>
	param (
		[parameter(Mandatory=$True)][string]$InputString
	)
	$words = $InputString -split '\s+'
	$camelCaseWords = $words | ForEach-Object {
		if ($_.Length -gt 0) {
			$firstChar = $_.Substring(0,1).ToUpper()
			$restChars = $_.Substring(1).ToLower()
			"$firstChar$restChars"
		} else {
			""
		}
	}
	return ($camelCaseWords -join "")
}