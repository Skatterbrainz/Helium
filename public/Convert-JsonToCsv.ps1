function Convert-JsonToCsv {
	<#
	.SYNOPSIS
		Copy a JSON file to CSV format
	.DESCRIPTION
		Copy a JSON file to CSV format file.
	.PARAMETER Path
		Path and name of JSON file.
	.PARAMETER OutputFile
		Path and name of CSV output file. The default is to use the same path and filename 
		replacing the file extension with .csv
	.EXAMPLE
		Convert-JsonToCsv -Path "c:\temp\myfile.json"

		Exports the CSV file "c:\temp\myfile.csv"
	.EXAMPLE
		Get-ChildItem -Path "c:\temp" -Filter "*.json" | Select FullName | Convert-JsonToCsv

		Exports each JSON file in the path "c:\temp" to a new CSV file with the same
		filename and in the same folder path
	.EXAMPLE
		Convert-JsonToCsv -Path "c:\temp\myfile.json" -OutputFile "f:\docs\newfile.csv"

		Exports the CSV file to a different path and filename.
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Convert-JsonToCsv.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$True,ValueFromPipeline=$True)][string]$Path,
		[parameter()][string]$OutputFile = ""
	)
	BEGIN {}
	PROCESS {
		try {
			$infile = Get-Item -Path $Path -ErrorAction Stop
			if ([string]::IsNullOrWhiteSpace($OutputFile)) {
				$OutputFile = Join-Path $infile.Directory "$($infile.BaseName).csv"
			}
			Get-Content -Path $infile.FullName | ConvertFrom-Json | Export-Csv -Path $OutputFile -NoTypeInformation -Force
		} catch {
			Write-Error $_.Exception.Message
		}
	}
	END {}
}