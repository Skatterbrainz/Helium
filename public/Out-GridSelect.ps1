function Out-GridSelect {
	param (
		[parameter(Mandatory=$True)] $DataSet,
		[parameter(Mandatory=$True)][string] $Title,
		[parameter()][string][ValidateSet('Single','Multiple')]$OutputMode = 'Single'
	)
	if ($IsLinux) {
		if (Get-Module microsoft.powershell.consoleguitools -listavailable) {
			@($DataSet | Out-ConsoleGridView -Title $Title -OutputMode $OutputMode)
		} else {
			Write-Warning "Linux platforms require module: microsoft.powershell.consoleguitools"
		}
	} else {
		if (Get-Module microsoft.powershell.consoleguitools -listavailable) {
			@($DataSet | Out-ConsoleGridView -Title $Title -OutputMode $OutputMode)
		} else {
			@($DataSet | Out-GridView -Title $Title -OutputMode $OutputMode)
		}
	}
}
