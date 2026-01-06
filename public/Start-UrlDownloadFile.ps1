function Start-UrlDownloadFile {
	<#
	.SYNOPSIS
		Download URI file to local file
	.DESCRIPTION
		Download URI file to local file
	.PARAMETER URI
		Required. URI of remote file to download. The tail end of the URI will be used for the local file name
		https://www.contoso.com/files/myfilename.cer will be downloaded to myfilename.cer in the -LocalPath folder
	.PARAMETER LocalPath
		Optional. Local folder path. Default is $env:TEMP
	.EXAMPLE
		Start-UrlDownloadFile "https://www.contoso.com/files/myfilename.cer" -LocalPath "c:\temp"

		Downloads the content from the URL to c:\temp\myfilename.cer
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Start-UrlDownloadFile.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true)][string]$URI,
		[parameter(Mandatory=$false)][string]$LocalPath = $($env:TEMP),
		[parameter(Mandatory=$false)][switch]$Force
	)
	try {
		$filename = Split-Path $URI -Leaf
		$filepath = Join-Path -Path $LocalPath -ChildPath $filename
		if (Test-Path $filepath) {
			if ($Force) {
				Write-Verbose "removing existing file: $filepath"
				$null = Remove-Item -Path $filepath -Force
			} else {
				Write-Warning "File exists: $filepath"
				break
			}
		}
		Write-Verbose "downloading from: $URI"
		$null = Invoke-WebRequest -Uri $URI -UseBasicParsing -OutFile $filepath -ErrorAction Stop
		Write-Host "Downloaded to: $filepath" -ForegroundColor Cyan
	} catch {
		Write-Warning "error: $($_.Exception.Message)"
	}
}