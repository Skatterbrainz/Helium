function Get-ModuleHelp {
	<#
	.SYNOPSIS
		Return Get-Help summary for all commands in a given module
	.DESCRIPTION
		Return Get-Help summary for all commands in a given module
	.PARAMETER ModuleName
		Name of module
	.PARAMETER Export
		Send output to a CSV or XLSX file. If module ImportExcel is installed, it 
		will default to XLSX format. The filename is pshelp_<MODULENAME>.<EXTENSION>.
		If XLSX format is used, the file is automatically opened in Excel.
	.PARAMETER OutputPath
		Path where output file is saved when using -Export
	.EXAMPLE
		Get-ModuleHelp -ModuleName PowerShellAI

		Displays help summary for all commands in the module PowerShellAI (if it is installed)
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ModuleHelp.md
	#>
	param (
		[parameter(Mandatory=$true)][string]$ModuleName,
		[parameter(Mandatory=$False)][switch]$Export,
		[parameter(Mandatory=$False)][string]$OutputPath = "$env:TEMP"
	)
	try {
		if (!(Get-Module $ModuleName -ListAvailable)) {
			throw "Module is not installed: $ModuleName"
		}
		$helpdata = Get-Command -Module $ModuleName | 
		Select-Object -ExpandProperty Name |
			Foreach {
				$desc = (Get-Help $_).Description.Text
				[pscustomobject]@{
					Function = $_
					Description = $desc
				}
			}
		if ($Export) {
			if (Get-Module ImportExcel -ListAvailable) {
				$OutputFile = Join-Path $OutputPath "pshelp_$($ModuleName).xlsx"
				$helpdata | Export-Excel -Path $OutputFile -Show -WorksheetName $ModuleName -ClearSheet -AutoSize
			} else {
				$OutputFile = Join-Path $OutputPath "pshelp_$($ModuleName).csv"
				$helpdata | Export-Csv -Path $OutputFile -NoTypeInformation -Force
			}
			Write-Host "Saved to: $OutputFile"
		} else {
			$helpdata
		}
	} catch {
		Write-Warning $_.Exception.Message
	}
}