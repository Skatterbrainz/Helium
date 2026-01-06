function Get-CommandSyntax {
	<#
	.SYNOPSIS
		Show formatted basic syntax for a function or cmdlet
	.DESCRIPTION
		Show formatted basic syntax for a function or cmdlet
	.PARAMETER Command
		Name of command / cmdlet / function
	.PARAMETER Normalize
		Displays output on 1-line. Default is stacked view
	.EXAMPLE
		Get-CommandSyntax Get-DocRef
	.EXAMPLE
		Get-CommandSyntax Get-DocRef -Normalize
	.NOTES
		Borrowed entirely from [Brett Miller] with very minor changes: https://github.com/brettmillerb/Toolbox
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Syntax.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true)] $Command,
		[parameter(Mandatory=$False)][switch] $Normalize
	)
	$check = Get-Command -Name $Command
	$params = @{
		Name =  if ($check.CommandType -eq 'Alias') {
					Get-Command -Name $check.Definition
				} else {
					$Command
				}
		Syntax = $true
	}
	if ($Normalize) {
		Get-Command @params
	} else {
		(Get-Command @params) -replace '(\s(?=\[)|\s(?=-))', "`r`n   "
	}
}
