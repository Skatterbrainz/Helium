# Helium

Assorted Utilities to make your day happier than inhaling a party balloon.

```powershell
Install-Module helium
```

## List all Functions and Descriptions

```powershell
Get-ModuleHelp helium
```

or 

```powershell
Get-Command -Module helium
```

## Get Detailed help on specific commands

```powershell
Get-Help Invoke-Maintenance -Full
```

Documentation is also [Online Here](https://github.com/Skatterbrainz/Helium/tree/main/docs)

Bugs? Feature requests? Please [Submit them Here](https://github.com/Skatterbrainz/Helium/issues)

# Version History

* 1.2.2
  * Get-BrowserProfile
	* Added Firefox and Brave and support 
	* Added Flatpak detection on Linux
	* Added Edge reporting for Windows 11
* I have no idea what happened from 1.1.17 to 1.2 or 1.2.1. It must have been interesting.
* 1.1.16
  * Added Get-Calendar, Clear-IISLogs, and Get-HoHoHo
  * Renamed Replace-ExcelWorkbookText to Edit-ExcelWorkbookText
  * Fixed module-loading bugs in Edit-ExcelWorkbookText, and Find-ExcelWorkbookText
* 1.1.15
  * Added Find-ExcelWorkbookText, Replace-ExcelWorkbookText
* 1.1.13
  * Renamed Invoke-Maintenance to Update-Machine
* 1.1.12
  * Added Get-ScriptFunctionComments
* 1.1.11
  * tbd