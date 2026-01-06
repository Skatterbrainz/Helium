function Update-Machine {
	<#
	.SYNOPSIS
		Run Windows system maintenance tasks
	.DESCRIPTION
		Run Windows system maintenance tasks suchas Windows Updates, updating
		Chocolatey and Winget packages, PowerShell modules, PowerShell help files
		and optionally display a confirmation toast popup.
	.PARAMETER WindowsUpdate
		Check for and install Windows updates
	.PARAMETER Chocolatey
		Update Chocolatey packages. If Chocolatey is installed.
	.PARAMETER Winget
		Update Winget packages. If Winget is installed.
	.PARAMETER Modules
		Update PowerShell modules.
	.PARAMETER Help
		Update PowerShell help files. If invoked without administrator context, this will
		only update help content under the CurrentUser scope (PS 6.1 or later)
	.PARAMETER ShowConfiration
		Display toast notification when complete.
	.PARAMETER Linux
		Optional. On Linux machines, invokes apt-get with update and full-upgrade options, as well as flatpak
	.EXAMPLE
		Update-Machine -WindowsUpdate
	.EXAMPLE
		Update-Machine -WindowsUpdate -Chocolatey -Winget -Modules -Help -ShowConfirmation
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Update-Machine.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$False)][switch]$WindowsUpdate,
		[parameter(Mandatory=$False)][switch]$Chocolatey,
		[parameter(Mandatory=$False)][switch]$Winget,
		[parameter(Mandatory=$False)][switch]$Modules,
		[parameter(Mandatory=$False)][string]$ModuleNames = 'PowerShellAI,importexcel,carbon,dbatools,helium',
		[parameter(Mandatory=$False)][switch]$Help,
		[parameter(Mandatory=$False)][switch]$Linux,
		[parameter(Mandatory=$False)][switch]$ShowConfirmation
	)
	if ($PSVersionTable.Platform -ne 'Unix') {
		[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
		if ($Chocolatey) {
			if ($env:ChocolateyInstall) {
				Write-Host "Updating: Chocolatey packages" -ForegroundColor Cyan
				choco upgrade all -y
			} else {
				Write-Warning "Chocolatey is not installed"
			}
		}
		if ($Winget) {
			$wpath = "$env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe"
			if (Test-Path $wpath) {
				Write-Host "Updating: Winget packages" -ForegroundColor Cyan
				winget.exe upgrade --all --silent
			} else {
				Write-Warning "Winget is not installed"
			}
		}
		if ($WindowsUpdate) {
			if (Get-Module psWindowsUpdate -ListAvailable) {
				Write-Host "Checking for Windows updates..." -ForegroundColor Cyan
				Get-WindowsUpdate -AcceptAll -Install -WindowsUpdate -IgnoreReboot
				Get-WindowsUpdate -AcceptAll -Install -MicrosoftUpdate
			} else {
				Write-Warning "Module not installed: psWindowsUpdate"
			}
		}
		if ($Modules) {
			#Set-PSRepository -Name PGallery -InstallationPolicy Trusted
			if ((Get-PackageProvider -Name NuGet).Version -lt [version]::new("2.8.5.201")) {
				Write-Host "Updating package: NuGet" -ForegroundColor Cyan
				Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
			}
			if ((Get-Module powershellget -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1).Version -lt [version]::new("2.2.5")) {
				Write-Host "Updating module: PowerShellGet" -ForegroundColor Cyan
				Update-Module PowerShellGet -Force
			}
			if ($ModuleNames -ne "All") {
				$ModuleNames.Split(',') | Foreach-Object {
					if (Get-Module $_ -ListAvailable) {
						Write-Host "Updating module: $($_)" -ForegroundColor Cyan
						Update-Module $_
					} else {
						Write-Host "Module not installed: $($_)" -ForegroundColor Magenta
					}
				}
			} else {
				Get-Module -ListAvailable | Select-Object -ExpandProperty Name |
					Foreach-Object {
						Write-Host "Updating module: $($_)" -ForegroundColor Cyan
						$res = Update-Module $_ -ErrorAction SilentlyContinue -PassThru
						$res | Select-Object Name,Version
					}
			}
		}
		if ($Help) {
			if (Test-IsAdmin) {
				if ($PSVersionTable.PSVersion -ge 6.1) {
					Write-Host "Updating PS Help: All Users scope"
					Update-Help -Scope AllUsers -ErrorAction SilentlyContinue
				} else {
					Write-Host "Updating PS Help"
					Update-Help -ErrorAction SilentlyContinue
				}
			} else {
				if ($PSVersionTable.PSVersion -ge 6.1) {
					Write-Host "Updating PS Help: Current User scope only"
					Update-Help -Scope CurrentUser -ErrorAction SilentlyContinue
				} else {
					Write-Host "Updating PS Help"
					Update-Help -ErrorAction SilentlyContinue
				}
			}
		}
		if ($ShowConfirmation) {
			$params = @{
				Text = "Computer maintenance completed!"
				Sound = "Mail"
				SnoozeAndDismiss = $True
			}
			if (Test-Path "c:\temp\customimage.png") {
				$params['AppLogo'] = "c:\temp\customimage.png"
			}
			New-BurntToastNotification @params
		}
	} else {
		sudo apt-get update
		sudo apt-get full-upgrade -y # or safe-upgrade -y
		flatpak update
		if ($Modules) {
			#Set-PSRepository -Name PGallery -InstallationPolicy Trusted
			if ((Get-PackageProvider -Name NuGet).Version -lt [version]::new("2.8.5.201")) {
				Write-Host "Updating package: NuGet" -ForegroundColor Cyan
				Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
			}
			if ((Get-Module powershellget -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1).Version -lt [version]::new("2.2.5")) {
				Write-Host "Updating module: PowerShellGet" -ForegroundColor Cyan
				Update-Module PowerShellGet -Force
			}
			if ($ModuleNames -ne "All") {
				$ModuleNames.Split(',') | Foreach-Object {
					if (Get-Module $_ -ListAvailable) {
						Write-Host "Updating module: $($_)" -ForegroundColor Cyan
						Update-Module $_
					} else {
						Write-Host "Module not installed: $($_)" -ForegroundColor Magenta
					}
				}
			} else {
				Get-Module -ListAvailable | Select-Object -ExpandProperty Name |
					Foreach-Object {
						Write-Host "Updating module: $($_)" -ForegroundColor Cyan
						$res = Update-Module $_ -ErrorAction SilentlyContinue -PassThru
						$res | Select-Object Name,Version
					}
			}
		}
		if ($Help) {
			if (Test-IsAdmin) {
				if ($PSVersionTable.PSVersion -ge 6.1) {
					Write-Host "Updating PS Help: All Users scope"
					Update-Help -Scope AllUsers -ErrorAction SilentlyContinue
				} else {
					Write-Host "Updating PS Help"
					Update-Help -ErrorAction SilentlyContinue
				}
			} else {
				if ($PSVersionTable.PSVersion -ge 6.1) {
					Write-Host "Updating PS Help: Current User scope only"
					Update-Help -Scope CurrentUser -ErrorAction SilentlyContinue
				} else {
					Write-Host "Updating PS Help"
					Update-Help -ErrorAction SilentlyContinue
				}
			}
		}
	}
	Write-Output 0
}