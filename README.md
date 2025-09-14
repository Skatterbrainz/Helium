# Helium

Assorted Utilities to make your day happier than inhaling a party balloon.
Seriously, this is kind of a bug-out toolkit for a variety of sysadmin tasks.
You may need to Google "bug-out".

```powershell
Install-Module helium
```

## List all Functions and Descriptions

Using the Get-ModuleHelp function from this module...

```powershell
Get-ModuleHelp helium
```

Using the built-in PowerShell Get-Command cmdlet...

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

* 1.2.7
  * Added Rename-FilePrefix and Rename-FileParse
* 1.2.6
  * Added Export-SecretStore, and Import-SecretStore
  * Retired Invoke-Grep
* 1.2.5
  * Added Invoke-PsResourceMaintenance
* 1.2.4
  * Added Get-CMLog (forked from Rich Preston just for convenience)
* 1.2.3
  * Updated Get-BrowserProfile to include InstallType (mainly for Linux)
  * Added Get-Browsers
* 1.2.2
  * Get-BrowserProfile
	* Added Firefox and Brave and support on Linux and Windows 11
	* Added Flatpak detection on Linux
	* Added Edge reporting for Windows 11
* 1.2.1
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