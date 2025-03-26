function Get-FileMimeType {
	<#
	.SYNOPSIS
		Get the MIME type of a file.
	.DESCRIPTION
		Get the MIME type of a file.
	.PARAMETER FilePath
		The path to the file
	.EXAMPLE
		Get-FileMimeType -FilePath "C:\Users\user\Downloads\file.txt"
		PS C:\> Get-FileMimeType -FilePath "C:\Users\user\Downloads\file.txt"
		PS C:\> text/plain
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-FileMimeType.md
	#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0)]
		[string]$FilePath
	)
	try {
		$fpath = Resolve-Path -Path $FilePath
		if (Test-Path -Path $fpath) {
			$reader = [System.IO.StreamReader]::new($fpath, $true)
			if ($reader.Peek() -ge 0) {
				$reader.Read()
			}
			$reader.CurrentEncoding
		} else {
			throw "File not found: $fpath"
		}
	} catch {
		Write-Error -Message $_.Exception.Message
	} finally {
		$reader.Close()
	}
}