function Test-Guid {
	<#
	.SYNOPSIS
		Tests if a string is a valid GUID
	.DESCRIPTION
		Tests if a string is a valid GUID
	.PARAMETER Guid
		Required. The string to test
	.EXAMPLE
		Test-Guid -Guid '1234abcd-4321-6789-defg-abcdef123456'
		Returns True
	.EXAMPLE
		Test-Guid -Guid '1234abcd-4321-6789-defg-abcdef1234567'
		Returns False
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Test-Guid.md
	#>
	param (
		[parameter(Mandatory=$False)][string] $Guid
	)
	([guid]::TryParse($Guid, $([ref][guid]::Empty))) -eq $True
}