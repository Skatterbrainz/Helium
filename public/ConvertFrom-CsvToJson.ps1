function ConvertFrom-CsvToJson {
	<#
	.SYNOPSIS
		Convert a CSV file to JSON format
	.DESCRIPTION
		Convert a CSV file to JSON format file.
	.PARAMETER Path
		Path and name of CSV file.
	.PARAMETER TranslateFileName
		Optional. Export to file using same path and basename but use the new extension.
	.PARAMETER OutputFile
		Path and name of JSON output file. The default is to use the same path and filename replacing the file extension with .json
	.EXAMPLE
		ConvertFrom-CsvToJson -Path "c:\temp\myfile.csv"

		Exports the CSV file "c:\temp\myfile.csv"
	.EXAMPLE
		Get-ChildItem -Path "c:\temp" -Filter "*.csv" | Select FullName | ConvertFrom-CsvToJson

		Exports each CSV file in the path "c:\temp" to a new JSON file with the same filename and in the same folder path
	.EXAMPLE
		ConvertFrom-CsvToJson -Path "c:\temp\myfile.csv" -OutputFile "f:\docs\newfile.json"

		Exports the CSV file to a different path and JSON filename.
	.EXAMPLE
		ConvertFrom-CsvToJson -Path "c:\temp\myfile.csv" -TranslateFileName

		Exports the JSON file to c:\temp\myfile.json
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-CsvToJson.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$True,ValueFromPipeline=$True)][string]$Path,
		[parameter(Mandatory=$False)][switch]$TranslateFileName,
		[parameter(Mandatory=$False)][string]$OutputFile = ""
	)
	BEGIN {}
	PROCESS {
		try {
			$csvfile = Get-Item -Path $Path -ErrorAction Stop
			if (![string]::IsNullOrWhiteSpace($OutputFile)) {
				Import-Csv -Path $csvfile.FullName | ConvertTo-Json | Out-File -FilePath $OutputFile -Force
				Write-Host "exported: $OutputFile"
			} elseif ($TranslateFileName) {
				$OutputFile = Join-Path $csvfile.Directory "$($csvfile.BaseName).json"
				Import-Csv -Path $csvfile.FullName | ConvertTo-Json | Out-File -FilePath $OutputFile -Force
				Write-Host "exported: $OutputFile"
			} else {
				Import-Csv -Path $csvfile.FullName | ConvertTo-Json
			}
		} catch {
			Write-Error $_.Exception.Message
		}
	}
	END {}
}