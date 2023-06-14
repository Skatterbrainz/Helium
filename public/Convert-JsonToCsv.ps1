function Convert-JsonToCsv {
	<#
	.SYNOPSIS
		Convert a JSON file to CSV format
	.DESCRIPTION
		Convert a JSON file to CSV format file.
	.PARAMETER Path
		Path and name of JSON file.
	.PARAMETER TranslateFileName
		Optional. Export to file using same path and basename but use the new extension.
	.PARAMETER OutputFile
		Path and name of CSV output file. The default is to use the same path and filename replacing the file extension with .csv
	.EXAMPLE
		Convert-JsonToCsv -Path "c:\temp\myfile.json"

		Exports the CSV file "c:\temp\myfile.csv"
	.EXAMPLE
		Get-ChildItem -Path "c:\temp" -Filter "*.json" | Select FullName | Convert-JsonToCsv

		Exports each JSON file in the path "c:\temp" to a new CSV file with the same filename and in the same folder path
	.EXAMPLE
		Convert-JsonToCsv -Path "c:\temp\myfile.json" -OutputFile "f:\docs\newfile.csv"

		Exports the JSON file to a different path and CSV filename.
	.EXAMPLE
		Convert-JsonToCsv -Path "c:\temp\myfile.json" -TranslateFileName

		Exports the JSON file to c:\temp\myfile.csv
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Convert-JsonToCsv.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$True,ValueFromPipeline=$True)][string]$Path,
		[parameter()][switch]$TranslateFileName,
		[parameter()][string]$OutputFile = ""
	)
	BEGIN {}
	PROCESS {
		try {
			$jsonfile = Get-Item -Path $Path -ErrorAction Stop
			if (![string]::IsNullOrWhiteSpace($OutputFile)) {
				Get-Content -Path $jsonfile.FullName | ConvertFrom-Json | Export-Csv -Path $OutputFile -NoTypeInformation -Force
				Write-Host "Exported: $OutputFile"
			} elseif ($TranslateFileName) {
				$OutputFile = Join-Path $jsonfile.Directory "$($jsonfile.BaseName).csv"
				Get-Content -Path $jsonfile.FullName | ConvertFrom-Json | Export-Csv -Path $OutputFile -NoTypeInformation -Force
				Write-Host "Exported: $OutputFile"
			} else {
				Get-Content -Path $jsonfile.FullName | ConvertFrom-Json
			}
		} catch {
			Write-Error $_.Exception.Message
		}
	}
	END {}
}