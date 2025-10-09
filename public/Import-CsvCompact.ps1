function Import-CsvCompact {
	<#
	.SYNOPSIS
		Imports a CSV file and converts headers to camel case, optionally substituting spaces with a specified string.
	.DESCRIPTION
		This function imports a CSV file using the Import-Csv cmdlet and processes the headers to convert them to camel case. It also allows for an optional substitution string to replace spaces in the headers.
	.PARAMETER Path
		The path to the CSV file to import.
	.PARAMETER LiteralPath
		Specifies a path to the CSV file that is used exactly as it is typed. Notation characters are interpreted.
	.PARAMETER Delimiter
		The character that separates the values in the CSV file. Default is a comma (,).
	.PARAMETER SubstituteForSpace
		A string to substitute for spaces in the headers. Default is an empty string.
	.PARAMETER Header
		An array of strings that specifies the column headers for the CSV file.
	.PARAMETER Encoding
		The encoding for the CSV file. Default is 'utf8'.
	.PARAMETER UseCulture
		Indicates that the cmdlet uses the current culture settings to interpret the CSV file.
	.EXAMPLE
		Import-CsvCompact -Path "data.csv" -SubstituteForSpace "_"

		Imports the CSV file "data.csv" and converts headers to camel case, replacing spaces with underscores.
	.EXAMPLE
		Import-CsvCompact -Path "data.csv" -Delimiter ";"

		Imports the CSV file "data.csv" using a semicolon as the delimiter and converts headers to camel case.
	
	.EXAMPLE
		Import-CsvCompact -LiteralPath "C:\data files\data.csv" -UseCulture

		Imports the CSV file located at "C:\data files\data.csv" using the current culture settings and converts headers to camel case.

	.NOTES
	#>
	[CmdletBinding()]
	[OutputType([PSCustomObject[]])]
	param (
		[Parameter(Mandatory = $true, Position = 0)]
		[string]$Path,
		[Parameter(Mandatory = $false)]
		[string]$LiteralPath,
		[Parameter(Mandatory = $false)]
		[string]$Delimiter = ',',
		[Parameter(Mandatory = $false)]
		[string]$SubstituteForSpace = "",
		[Parameter(Mandatory = $false)]
		[string]$Header,
		[Parameter(Mandatory = $false)]
		[string]$Encoding = 'utf8',
		[Parameter(Mandatory = $false)]
		[switch]$UseCulture
	)
	$params = @{}
	if ($PSBoundParameters.ContainsKey('Path')) { $params['Path'] = $Path }
	if ($PSBoundParameters.ContainsKey('LiteralPath')) { $params['LiteralPath'] = $LiteralPath }
	if ($PSBoundParameters.ContainsKey('Delimiter')) { $params['Delimiter'] = $Delimiter }
	if ($PSBoundParameters.ContainsKey('Header')) { $params['Header'] = $Header }
	if ($PSBoundParameters.ContainsKey('Encoding')) { $params['Encoding'] = $Encoding }
	if ($PSBoundParameters.ContainsKey('UseCulture')) { $params['UseCulture'] = $UseCulture }
	$data = Import-Csv @params
	$newData = @()

	foreach ($row in $data) {
		$newRow = [PSCustomObject]@{}
		foreach ($prop in $row.PSObject.Properties) {
			$camelName = ($prop.Name -split '\s+' | ForEach-Object { 
				$_.Substring(0,1).ToUpper() + $_.Substring(1).ToLower() 
			}) -join $SubstituteForSpace
			$newRow | Add-Member -MemberType NoteProperty -Name $camelName -Value $prop.Value
		}
		$newData += $newRow
	}
	$newData
}