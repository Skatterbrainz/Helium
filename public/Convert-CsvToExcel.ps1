function Convert-CsvToExcel {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline=$True, ValueFromPipelineByPropertyName=$True)][string]$FullName,
		[Parameter(Mandatory = $False)][string]$ExcelPath = $FullName.Replace(".csv", ".xlsx"),
		[Parameter(Mandatory = $False)][string]$SheetName = "Sheet1",
		[Parameter(Mandatory = $False)][string]$Delimiter = ",",
		[Parameter(Mandatory = $False)][switch]$Force
	)
	begin {
		$FullName  = Resolve-Path $FullName -ErrorAction Stop
		$ExcelPath = Resolve-Path $ExcelPath
	}
	process {
		Write-Host "Reading CSV file: $FullName"
		if (Test-Path $ExcelPath -and !$Force) {
			Write-Output "Error: File already exists. Use -Force to overwrite."
			break
		}
		$csvData = Import-Csv -Path $FullName -Delimiter $Delimiter
		if (!$csvData) {
			Write-Output "Error: No data found in CSV file."
			break
		}
		Write-Host "Converting CSV data to Excel file: $ExcelPath"
		$csvData | Export-Excel -Path $ExcelPath -WorksheetName $SheetName -AutoSize
		Write-Host "Saved Excel file to $ExcelPath"
	}
	end {
		$csvData = $null
	}
}