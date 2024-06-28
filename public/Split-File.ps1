<#
.SYNOPSIS
Split a CSV or XLSX file based on values in a column

.DESCRIPTION
Split a CSV or XLSX file into one or more separate files based on values
in a column. For example, if file named "Employees.xlsx" has a column named 'EmployeeType' contains values
like 'EMP', 'CWR', 'TMP', this will create 3 new files based on the rows which have those corresponding values.
In this case, the three new files would be "Employees_EMP.xlsx", "Employees_CWR.xlsx" and "Employees_TMP.xlsx".
Each file would contain only the matching rows in the source file which have the corresponding value.

.PARAMETER Path
File to be parsed.

.PARAMETER KeyColumn
Name of column which will be analyzed.

.PARAMETER KeyValues
One or more values which will be used to parse out matching rows to separate files.
If this parameter is blank (default) all unique values in the KeyColumn set will be
used to determine the resulting set of output files.

.PARAMETER WorksheetName
Optional. For XLSX files only, identifies the tab (worksheet) to parse.
This setting has no effect when used with CSV files.

.PARAMETER OutputFolder
Optional. Path where new files are to be created. The default is the same path as the source file.

.EXAMPLE
Split-File -Path "c:\temp\employees.xlsx" -WorksheetName "EmpData" -KeyColumn "EmpType" -KeyValues ("EMP","CWR")

Creates c:\temp\employees_EMP.xlsx and c:\temp\employees_CWR.xlsx, if there are rows found
where the "EmpType" column contains either "EMP" or "CWR".  Rows with other values are ignored.

.EXAMPLE
Split-File -Path "c:\temp\products.csv" -KeyColumn "category" -OutputFolder c:\temp\files

Creates one file for each unique value in the "category" column, and saves each new file to c:\temp\files
with prefix "products_<value>.csv" where <value> is each unique value in "category".

.NOTES
Excel XLSX files require the PowerShell module ImportExcel
.LINK
https://github.com/Skatterbrainz/helium/blob/master/docs/Split-File.md
#>
function Split-File {
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$True)][string]$Path,
		[parameter(Mandatory=$True)][string]$KeyColumn,
		[parameter(Mandatory=$False)][string[]]$KeyValues,
		[parameter(Mandatory=$False)][string]$WorksheetName = "Sheet1",
		[parameter(Mandatory=$False)][string]$OutputFolder
	)
	try {
		if (-not(Test-Path $Path)) { throw "File not found: $Path" }
		$file = Get-Item -Path $Path -ErrorAction Stop
		$filetype = $file.Extension
		$basename = $file.BaseName
		if ($filetype -eq '.xlsx') {
			if (!(Get-Module ImportExcel -ListAvailable)) {
				throw "Parsing Excel XLSX files requires the PowerShell module: ImportExcel"
			}
		} else {
			if ($filetype -ne '.csv') {
				throw "Only CSV and XLSX files are supported"
			}
		}
		if ($PSBoundParameters.ContainsKey('OutputFolder')) {
			if (-not(Test-Path $OutputFolder)) {
				throw "Output folder not found: $OutputFolder"
			}
		} else {
			$OutputFolder = $file.Parent
		}
		if ($filetype -eq '.csv') {
			$rows = Import-Csv -Path $Path -Encoding Utf8 -ErrorAction Stop
		} else {
			$rows = Import-Excel -Path $Path -WorksheetName $WorksheetName -ErrorAction Stop
		}
		Write-Host "$($rows.Count) rows imported from: $Path"
		$trows = 0
		if ($PSBoundParameters.ContainsKey('KeyValues')) {
			if (($KeyValues.Count -eq 0) -or ([string]::IsNullOrWhiteSpace($KeyValues))) {
				$values = $rows."$KeyColumn" | Select-Object -Unique
			} else {
				$values = $KeyValues
			}
		} else {
			$values = $KeyValues
		}
		foreach ($v in $values) {
			$vrows = $rows | Where-Object {$_."$KeyColumn" -eq "$v"}
			if ($vrows.Count -gt 0) {
				$newfile = Join-Path $outputfolder "$($basename)_$($v)$($filetype)"
				if ($filetype -eq '.xlsx') {
					$vrows | Export-Excel -Path $newfile -WorksheetName $WorksheetName -ClearSheet
				} else {
					$vrows | Export-Csv -Path $newfile -Encoding Utf8 -Force
				}
				Write-Host "$($vrows.Count) rows exported to: $newfile"
				$trows += $vrows.Count
			} else {
				Write-Warning "No matching rows found: $($KeyColumn) = $($v)"
			}
		}
		Write-Host "$($rows.Count) total rows analyzed. $($trows) rows exported. $(($rows.Count) - $trows) not exported."
	} catch {
		Write-Error $_.Exception.Message
	}
}