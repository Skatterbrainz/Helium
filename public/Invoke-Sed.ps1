function Invoke-Sed {
	<#
	.SYNOPSIS
		Invoke-Sed
	.DESCRIPTION
		Search/Replace matching text pattern within specified files
	.PARAMETER FilePath
		Path where files reside
	.PARAMETER Find
		Text pattern to search for
	.PARAMETER ReplaceWith
		Text to replace the matching pattern instances
	.PARAMETER Filter
		File name/extension pattern. Default is *.* (all files)
	.EXAMPLE
		Invoke-Sed -FilePath "c:\mydocs" -Filter "*.txt" -Find "Contoso" -ReplaceWith "Fabrikam"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-Sed.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory)][string]$FilePath,
		[parameter(Mandatory)][string]$Find,
		[parameter()][string]$Filter = "*.*",
		[parameter()][string]$ReplaceWith = ""
	)
	if (Test-Path $FilePath) {
		(Get-Content -Path $FilePath).Replace($Find, $ReplaceWith) | Set-Content -Path $FilePath
	} else {
		Write-Warning "File not found: $FilePath"
	}
}
