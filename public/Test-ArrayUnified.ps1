function Test-ArrayUnified {
	<#
	.SYNOPSIS
		Tests if all elements in an array are equal to a reference value
	.DESCRIPTION
		Tests if all elements in an array are equal to a reference value
	.PARAMETER Array
		Array to test
	.PARAMETER ReferenceValue
		Reference value to test against
	.EXAMPLE
		Test-ArrayUnified -Array @('a','a','a') -ReferenceValue 'a'
		returns True
	.EXAMPLE
		Test-ArrayUnified -Array @('a','b','a') -ReferenceValue 'a'
		returns False
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Test-ArrayUnified.md
	#>
	param (
		[parameter(Mandatory)][array]$Array,
		[parameter(Mandatory)]$ReferenceValue
	)
	(($Array | Foreach-Object {$_ -eq $ReferenceValue}) -eq $True).Count -eq $Array.Count
}