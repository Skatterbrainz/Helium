# Helium

PowerShell Utilities for Windows System Administration

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue)
![Platform](https://img.shields.io/badge/platform-Windows-blue)
![Platform](https://img.shields.io/badge/platform-MacOS-green)
![Platform](https://img.shields.io/badge/platform-Linux-orange)
![License](https://img.shields.io/badge/license-MIT-green)

Assorted Utilities to make your day happier than inhaling a party balloon. Seriously, this is kind of a bug-out toolkit for a variety of sysadmin tasks. You may need to Google "bug-out".

## 🎯 Overview

This module provides a comprehensive collection of PowerShell cmdlets designed to make Windows system administration easier and more efficient. If there's more you want/need or anything you find lacking, annoying, aggravating, infuriating, discombobulating, or outright unsatisfying, drop a new [Issue](https://github.com/Skatterbrainz/Helium/issues) here. Thank you!

## ✨ Features

- 🔍 **System Information** - Get detailed information about Windows builds, device info, disk usage, and uptime
- 📊 **Data Conversion** - Convert between CSV, JSON, Excel, HTML tables, and Base64 formats
- 🌐 **Network Tools** - Check public IP addresses, manage WLAN profiles, and test SMTP addresses
- 🔐 **Security & Secrets** - Export/import secret stores and manage credentials
- 📁 **File Operations** - Split files, rename with patterns, and download from URLs
- 🖥️ **Windows Management** - Customize Windows 11, manage services, check reboot status, and update machines
- 📝 **Text Processing** - Search and replace in Excel workbooks, format phone numbers, and work with abbreviations
- 🔧 **Browser Tools** - Get browser profiles, check default browsers, and export bookmarks
- 📦 **Module Management** - Maintain PS resources, import functions from Gists, and get module help
- 🎨 **UI Tools** - Display message boxes, input boxes, and grid selection dialogs
- 🐙 **GitHub Tools** - Search Repositories and Gists for items containing matching strings

## 🚨 Security Notice

Version 1.2.11 incorporates changes for Invoke-WebRequest to address vulnerabilities as reported by [CVE-2025-54100](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2025-54100)

## Requirements

- PowerShell 5.1 or higher (PowerShell 7+ recommended)
- Windows operating system for all commands
- Linux or MacOS operating system for some commands
- Appropriate system permissions for certain operations

## Installation

### From PowerShell Gallery (Recommended)

```powershell
Install-Module -Name Helium -Scope CurrentUser
```

Or using PSResourceGet:

```powershell
Install-PSResource Helium
```

### From GitHub

1. **Clone the repository**
   ```bash
   git clone https://github.com/Skatterbrainz/Helium.git
   cd Helium
   ```

2. **Import the module**
   ```powershell
   Import-Module ./helium.psd1
   ```

## Usage

Import the module and explore available cmdlets:

```powershell
# Import the module
Import-Module Helium

# Get all available cmdlets
Get-Command -Module Helium

# Get help for a specific cmdlet
Get-Help Import-CsvCompact -Full

# Example: Get Windows build information
Get-WindowsBuild

# Example: Convert CSV to JSON
ConvertFrom-CsvToJson -Path data.csv

# Example: Check for pending reboot
Test-RebootPending
```

## 📖 Documentation

Full documentation for each cmdlet is available in the [docs](./docs) directory:

- [Get-WindowsBuild](./docs/Get-WindowsBuild.md) - Get Windows build information
- [Convert-CsvToJson](./docs/Convert-CsvToJson.md) - Convert CSV files to JSON
- [Test-RebootPending](./docs/Test-RebootPending.md) - Check if system reboot is pending
- [Get-BrowserProfile](./docs/Get-BrowserProfile.md) - Get browser profile information
- And [many more](./docs)...

## Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features or cmdlets
- Improve documentation
- Submit pull requests

Please open an [issue](https://github.com/Skatterbrainz/Helium/issues) or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**Skatterbrainz**
- GitHub: [@Skatterbrainz](https://github.com/Skatterbrainz)

## Acknowledgments

- Built for PowerShell on Windows
- Thanks to all contributors and users who have provided feedback and suggestions
- Special thanks to Rich Preston for the Get-CMLog function

---

For complete version history, see [revisions.md](revisions.md).