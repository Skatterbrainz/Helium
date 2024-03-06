<#
.SYNOPSIS
Use GridView or ConsoleGridView to provide a selection menu

.DESCRIPTION
Use a GridView or ConsoleGridView to provide a selection menu interface for selecting either
single or multiple items. On Linux this will only invoke a ConsoleGridView. For Windows, it 
will default to a GridView unless -ForceConsole is used.

.PARAMETER InputObject
An array of objects.

.PARAMETER Title
Title to display on the gridview heading (caption). If not provided will display "Select Item"
or "Select Items"

.PARAMETER OutputMode
Optional. Single (Default) or Multiple.

.PARAMETER ForceConsole
Optional. On Windows machines, forces ConsoleGridView

.EXAMPLE
Get-Process | Out-GridSelect

.EXAMPLE
Get-Process | Out-GridSelect -Title "Select Processes" -OutputMode Multiple

.NOTES
The Microsoft.PowerShell.ConsoleGuiTools module is required on Linux, or when using -ForceConsole.

.LINK
#>
function Out-GridSelect {
	param (
		[parameter(ValueFromPipeline=$True, Mandatory=$True)] $InputObject,
		[parameter(Mandatory=$False)][string] $Title,
		[parameter(Mandatory=$False)][string][ValidateSet('Single','Multiple')] $OutputMode = 'Single',
		[parameter(Mandatory=$False)][switch] $ForceConsole
	)
	if ([string]::IsNullOrWhiteSpace($Title)) {
		if ($OutputMode -eq 'Single') {
			$Title = "Select Item"
		} else {
			$Title = "Select Items"
		}
	}
	if ($IsLinux -eq $True) {
		if (Get-Module microsoft.powershell.consoleguitools -ListAvailable) {
			$InputObject | Out-ConsoleGridView -Title $Title -OutputMode $OutputMode
		} else {
			Write-Warning "Linux platforms require module: microsoft.powershell.consoleguitools"
		}
	} else {
		if ($ForceConsole.IsPresent -and (Get-Module Microsoft.PowerShell.ConsoleGuiTools -ListAvailable)) {
			$InputObject | Out-ConsoleGridView -Title $Title -OutputMode $OutputMode
		} else {
			$InputObject | Out-GridView -Title $Title -OutputMode $OutputMode
		}
	}
}
