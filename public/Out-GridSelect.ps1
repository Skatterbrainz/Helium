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
$choice = Get-Process | Out-GridSelect

Display a selection menu for choosing processes.

.EXAMPLE
$choices = Get-Process | Out-GridSelect -Title "Select Processes" -OutputMode Multiple

Display a selection menu for choosing multiple processes.

.NOTES
The Microsoft.PowerShell.ConsoleGuiTools module is required on Linux, or when using -ForceConsole.

.LINK
https://github.com/Skatterbrainz/helium/blob/master/docs/Out-GridSelect.md
#>
function Out-GridSelect {
	param (
		[parameter(Mandatory=$True, ValueFromPipeline=$True)] $InputObject,
		[parameter(Mandatory=$False)][string] $Title,
		[parameter(Mandatory=$False)][string][ValidateSet('Single','Multiple')] $OutputMode = 'Single',
		[parameter(Mandatory=$False)][switch] $ForceConsole
	)
	begin {
		$items = @()
	}
	process {
		$items += $InputObject
	}
	end {
		if (-not($PSBoundParameters.ContainsKey('Title'))) {
			if ($OutputMode -eq 'Single') {
				$Title = "Select Item"
			} else {
				$Title = "Select Items"
			}
		}
		if ($IsLinux -or $IsMacOS) {
			if (Get-Module microsoft.powershell.consoleguitools -ListAvailable) {
				$items | Out-ConsoleGridView -Title $Title -OutputMode $OutputMode
			} else {
				Write-Warning "Linux platforms require module: microsoft.powershell.consoleguitools"
			}
		} else {
			if ($ForceConsole.IsPresent) {
				if (Get-Module Microsoft.PowerShell.ConsoleGuiTools -ListAvailable) {
					$items | Out-ConsoleGridView -Title $Title -OutputMode $OutputMode
				} else {
					Write-Warning "Module Microsoft.PowerShell.ConsoleGuiTools is required for ConsoleGridView"
				}
			} else {
				$items | Out-GridView -Title $Title -OutputMode $OutputMode
			}
		}
	}
}
