# Revision History

## 1.3.2
- Added: Export-BrowserProfile
- Removed: ConvertTo-CamelCase

## 1.3.1
- Added: Search-GitHubRepostory
- Added: Search-GitHubGist
- Added: ConvertTo-CamelCase
- Fixed: Export-SecretStore bug with exporting SecureString secrets
- Fixed: Import-SecretStore bug with importing SecureString secrets
- Removed: Get-Uptime (redundant with built-in cmdlet in PowerShell 7+)
- Removed: Convert-JsonToCsv (simple wrapper around native cmdlets)
- Removed: Get-BadServices (simple filter of Get-Service)
- Removed: Start-WaitTimer (wrapper around Start-Sleep)
- Removed: Import-CsvCompact (wrapper around Import-Csv)
- Removed: ConvertFrom-DecimalErrorCode (simple hex conversion)
- Renamed: Test-ArrayUnified to Test-ArrayUniform

## 1.3.0
- Added: Export-Bookmarks

## 1.2.11
- Updated: Functions that rely on Invoke-WebRequest updated to add -UseBasicParsing
- Updated: Get-PublicIPv4Address to address [CVE-2025-54100](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2025-54100)
- Updated: Start-UrlDownloadFile to address [CVE-2025-54100](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2025-54100)

## 1.2.10
- Updated: Start-WaitTimer
- Removed: psIni as a module prerequisite during import

## 1.2.9
- Updated: Export-SecretStore, Import-SecretStore
- Added: Export-SecretStore
- Added: Import-SecretStore
- Updated: All Help document files to latest markdown format

## 1.2.8
- Added: Import-CsvCompact

## 1.2.7
- Added: Rename-FileParse, Rename-FilePrefix

## 1.2.6
- Added: Export-SecretStore, and Import-SecretStore
- Retired: Invoke-Grep

## 1.2.5
- Added: Invoke-PsResourceMaintenance

## 1.2.4
- Added: Get-CMLog (forked from Rich Preston just for convenience)

## 1.2.3
- Added: Get-Browsers
- Updated: Get-BrowserProfile to include InstallType (mainly for Linux)

## 1.2.2
- Updated: Get-BrowserProfile
  - Added Firefox and Brave and support on Linux and Windows 11
  - Added Flatpak detection on Linux
  - Added Edge reporting for Windows 11

## 1.2.1
- Updated: Get-PublicIPv4Address
- I have no idea what happened from 1.1.17 to 1.2 or 1.2.1. It must have been interesting.

## 1.2.0
- Omg: I don't know what happened here

## 1.1.16
- Added: Get-Calendar, Clear-IISLogs, and Get-HoHoHo
- Renamed: Replace-ExcelWorkbookText to Edit-ExcelWorkbookText
- Fixed: Module-loading bugs in Edit-ExcelWorkbookText, and Find-ExcelWorkbookText

## 1.1.15
- Added: Find-ExcelWorkbookText, Replace-ExcelWorkbookText

## 1.1.13
- Renamed: Invoke-Maintenance to Update-Machine

## 1.1.12
- Added: Get-ScriptFunctionComments

## 1.1.11
- TBD

## Earlier Versions
- Who knows. I can't remember my kids names sometimes
