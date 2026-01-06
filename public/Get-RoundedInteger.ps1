function Get-RoundedInteger {
	<#
	.SYNOPSIS
		Get rounded integer to nearest base or floor number
	.DESCRIPTION
		Round integer number to nearest BASE value (e.g. 10, 100, 1000)
		Note this is NOT a standard Round operation.
		A standard Round of 1055 to the nearest 100 would result in 1100
			[math]::Round(1055 / 100) * 100 = 1100
		This round uses the nearest base or floor
			Get-RoundedInteger 1055 100 = 1000
	.PARAMETER Integer
		Required. Integer value to apply rounding
	.PARAMETER Nearest
		Optional. Nearest precision to round [Integer] to. Default is 100
	.EXAMPLE
		Get-RoundedInteger -Integer 124 -Nearest 10
		Returns 120
	.EXAMPLE
		Get-RoundedInteger -Integer 1123 -Nearest 100
		Returns 1100
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-RoundedInteger.md
	#>
	param (
		[parameter(Mandatory=$true)][int]$Integer,
		[parameter(Mandatory=$False)][int]$Nearest = 100
	)
	[math]::Truncate($Integer / $Nearest) * $Nearest
}