function Get-ScriptFunctionComments {
	<#
	.SYNOPSIS
		Extracts function comments from a script file.
	.DESCRIPTION
		Extracts function comments from a script file.
	.PARAMETER FilePath
		The path to the script file to process.
	.PARAMETER FolderPath
		The path to the folder containing script files to process.
	.NOTES
		Either FilePath or FolderPath must be specified. If FilePath is provided, FolderPath is ignored.
	.EXAMPLE
		Get-ScriptFunctionComments -FilePath "C:\GitHub\project42\runbooks\ula-support.ps1"
		Extracts function comments from the specified script file.
	.EXAMPLE
		Get-ScriptFunctionComments -FolderPath "C:\GitHub\project42\runbooks"
		Extracts function comments from all .ps1 script files in the specified folder.
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ScriptFunctionComments.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$False)][string]$FilePath,
		[parameter(Mandatory=$False)][string]$FolderPath
	)
	try {
		$oep = $ErrorActionPreference
		$opath = $PWD
		$ErrorActionPreference = 'SilentlyContinue'
		Write-Warning "Script files should NOT contain self-executing code."
		if (-not($PSBoundParameters.ContainsKey($FilePath)) -and (-not$PSBoundParameters.ContainsKey($FolderPath))) {
			throw "You must specify either a file path or a folder path"
		}
		if ($PSBoundParameters.ContainsKey($FilePath)) {
			$files = Get-ChildItem -Path $FolderPath -Filter "*.ps1" | Out-GridView -Title "Select Script Files to Process" -OutputMode Multiple
			if ($files.Count -gt 0) { Set-Location $files[0].DirectoryName }
		} else {
			$file = Get-Item -Path $FilePath
			$files = @($file)
			if ($files.Count -gt 0) { Set-Location $files.DirectoryName }
		}
		write-host "$($files.Count) files selected for processing." -ForegroundColor Cyan
		
		foreach ($file in $files) {
			$functionnames = $null
			$functionnames = Get-Content -Path $file.FullName | Where-Object {$_ -match "^function"} | ForEach-Object {$_.split(' ')[1]}
			try {
				Write-Host "Processing functions in file: $($file.FullName)" -ForegroundColor Cyan
				. $file.FullName
				$functionnames | ForEach-Object {
					$fn = $_
					$fhelp = Get-Help $fn
					$fhelp | Select-Object @{n='FileName';e={$file.Name}},Name,Synopsis,@{n='Description';e={$_.description.text}}
				}
			} catch {
				Write-Warning $_.Exception.Message
			}
		}
	} catch {
		Write-Error $_.Exception.Message
	} finally {
		$ErrorActionPreference = $oep
		Set-Location -Path $opath
	}
}