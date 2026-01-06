function Import-FunctionFromGist {
	<#
	.SYNOPSIS
		Define a function by importing script from GitHub Gist URL
	.DESCRIPTION
		Import Gist raw content, wrap in function block, and invoke-expression to conver to a function
	.PARAMETER URL
		Required. URL for GitHub Gist to import as PowerShell function.
	.NOTES
		The Gist content must be a PowerShell script that can be contained as a function.
		The URL must be to the RAW view of the Gist, not the HTML wrapped view.
		The URL tail/leaf that indicates the filename is applied as the function name.
	.EXAMPLE
		$url = 'https://gist.githubusercontent.com/Skatterbrainz/c222038b4a9a178d09428e144d86a953/raw/a3ba51e55115d5c0ab31e8fa609edf2328f3a3ec/get-pcinfo.ps1'
		Import-FunctionFromGist -URL $url
		Defines function get-pcinfo using filename "get-pcinfo.ps1" from the end of the URL
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Import-FunctionFromGist.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$False)][ValidateNotNullOrEmpty()][string]$URL
	)
	try {
		$scriptCode = $(New-Object System.Net.WebClient).DownloadString($URL)
		$funcname   = $(Split-Path $URL -Leaf).Split(".")[0]
		$func       = "Function Global`:$funcname { $scriptcode }"
		Write-Host "Importing function: $funcname" -ForegroundColor Cyan
		$(Invoke-Expression $func)
	} catch {
		Write-Error $_.Exception.Message
	}
}