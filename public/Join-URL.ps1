function Join-Url {
	<#
	.SYNOPSIS
		Join-Path for WEB URL strings
	.DESCRIPTION
		Same as the SYNOPSIS
	.PARAMETER Path
		Base path string
	.PARAMETER ChildPath
		Child path string to append to Path
	.EXAMPLE
		Join-Url -Path "https://www.contoso.com" -ChildPath "sales"
		returns "https://www.contoso.com/sales"
	.EXAMPLE
		Join-Url -Path "https://www.contoso.com/sales/" -ChildPath "accounts"
		returns "https://www.contoso.com/sales/accounts"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Join-Url.md
	#>
	param (
		[parameter(Mandatory,Position=0)][ValidateNotNullOrEmpty()][string] $Path, 
		[parameter(Mandatory,Position=1)][ValidateNotNullOrEmpty()][string] $ChildPath
	)
	if ($Path.EndsWith('/')) {
		Write-Output "$Path$ChildPath"
	}
	else {
		Write-Output "$Path/$ChildPath"
	}
}
