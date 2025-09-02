<#
.SYNOPSIS
	Search text or file content for matching string pattern
.DESCRIPTION
	Search text or file content for matching string pattern
.PARAMETER Pattern
	Text pattern to search for
.PARAMETER InputString
	String to search for matching Pattern value
.PARAMETER Path
	Path to search files for matching Pattern value. If Path is provided, InputString is ignored
.PARAMETER Recurse
	Optional. Only used with Path parameter. Default is to scan files
	in the Path location only, not sub-folders. If Recurse is used, scan
	will include sub-folders
.EXAMPLE
	Invoke-Grep -Path "C:\temp" -Pattern "Contoso Corp" -InputString "The facility is owned by Contoso Corp, who recently leased it."
.EXAMPLE
	Invoke-Grep -Path "C:\temp" -Pattern "Contoso Corp" -Path "c:\mydocs" -Recurse
.LINK
	https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-Grep.md
#>
function Invoke-Grep {
	param (
		[parameter(Mandatory)][string]$Path,
		[parameter(Mandatory)][string]$Pattern,
		[parameter()][string]$InputString = "",
		[parameter()][switch]$Recurse
	)
	if (![string]::IsNullOrWhiteSpace($Path)) {
		Get-ChildItem -Path $Path -Recurse:$Recurse | Select-String $Pattern
	} elseif (![string]::IsNullOrWhiteSpace($InputString)) {
		$InputString | Select-String $Pattern
	}
}
