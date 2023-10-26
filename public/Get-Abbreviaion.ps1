function Get-Abbreviation {
	<#
	.SYNOPSIS
		Get abbreviation from string of words
	.DESCRIPTION
		Derive an abbreviation from a string of words
	.PARAMETER String
		Required. Input string value.
	.EXAMPLE
		Get-Abbreviation "Eastern Standard Time"
		
		Returns "EST"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Abbreviation.md
	#>
	param (
		[parameter(Mandatory)][ValidateNotNullOrEmpty()][string]$String
	)
	$($String -split " " | Foreach-Object {$_.Substring(0,1).ToUpper()}) -join ""
}
