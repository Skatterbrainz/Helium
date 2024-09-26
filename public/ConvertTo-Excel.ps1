function ConvertTo-Excel {
	<#
	.SYNOPSIS
		Converts a CSV, JSON, or XML file to an Excel file.
	.DESCRIPTION
		Converts a CSV, JSON, or XML file to an Excel file. The output file will have the same name as the source file, but with an .xlsx extension.
	.PARAMETER FullName
		The full path to the source file.
	.PARAMETER WorksheetName
		The name of the worksheet to create in the Excel file. Default is "Sheet1".
	.EXAMPLE
		ConvertTo-Excel -FullName C:\temp\file.csv
		Converts the CSV file C:\temp\file.csv to an Excel file C:\temp\file.xlsx.
	.EXAMPLE
		Get-Item -Path "c:\temp\file.json" | ConvertTo-Excel
		Converts the JSON file C:\temp\file.json to an Excel file C:\temp\file.xlsx.
	.EXAMPLE
		ConvertTo-Excel -FullName C:\temp\file.xml -WorksheetName "Data"
		Converts the XML file C:\temp\file.xml to an Excel file C:\temp\file.xlsx with a worksheet named "Data".
	.NOTES
		Requires the ImportExcel module.
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Excel.md
	#>
	[OutputType([string])]
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$True)][string]$FullName,
		[parameter(Mandatory=$false)][string]$WorksheetName = "Sheet1"
	)
	begin {
		#$FullName = Resolve-Path $FullName -ErrorAction Stop
	}
	process {
		$xlFile = $FullName.Replace(".csv", ".xlsx").Replace(".json", ".xlsx").Replace(".xml", ".xlsx")
		Write-Verbose "Excel filepath: $xlFile"
		if ($FullName -like "*.csv") {
			$srcData = Import-Csv -Path $FullName
		} elseif ($FullName -like "*.json") {
			$srcData = Get-Content -Path $FullName | ConvertFrom-Json
		} elseif ($FullName -like "*.xml") {
			$srcData = Get-Content -Path $FullName | ConvertTo-Xml
		} else {
			Write-Warning "Error: Unsupported file type."
		}
		if ($srcData) {
			$srcData | Export-Excel -Path $xlFile -WorksheetName $WorksheetName -ClearSheet
			Write-Output $xlFile
		} else {
			Write-Warning "Error: No data found in source file."
		}
	}
}