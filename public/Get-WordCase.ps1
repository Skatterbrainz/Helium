function Get-WordCase {
	<#
	.SYNOPSIS
		Convert a string of words to word case
	.DESCRIPTION
		Convert a string of words to word case, where each word has the 
		first letter UPPER case and the rest of the letters lower case
	.PARAMETER String
		Required. Input string value
	.EXAMPLE
		Get-WordCase "THE DOG RAN FAST."

		Returns "The Dog Ran Fast."
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-WordCase.md
	#>
	param (
		[parameter(Mandatory)][ValidateNotNullOrEmpty()][string]$String
	)
	$words = $String -split " " | Foreach-Object {
		if ($_.Length -gt 1) {
			"$($_.Substring(0,1).ToUpper())$($_.Substring(1).ToLower())"
		} else {
			$_.Substring(0,1).ToUpper()
		}
	}
	$words -join " "
}