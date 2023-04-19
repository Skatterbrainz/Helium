function Invoke-Maintenance {
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
		Update PowerShell help files.
	.PARAMETER ShowConfiration
		Display toast notification when complete.
	.EXAMPLE
		Invoke-Maintenance -WindowsUpdate
	.EXAMPLE
		Invoke-Maintenance -WindowsUpdate -Chocolatey -Winget -Modules -Help -ShowConfirmation
	.LINK
	#>
	[CmdletBinding()]
	param (
		[parameter()][switch]$WindowsUpdate,
		[parameter()][switch]$Chocolatey,
		[parameter()][switch]$Winget,
		[parameter()][switch]$Modules,
		[parameter()][string]$ModuleNames = 'PowerShellAI,importexcel,carbon,dbatools,helium',
		[parameter()][switch]$Help,
		[parameter()][switch]$ShowConfirmation
	)
	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
	if ($Chocolatey) {
		if ($env:ChocolateyInstall) {
			Write-Host "Updating: chocoolatey packages" -ForegroundColor Cyan
			cup all -y # choco upgrade all -y
		} else {
			Write-Warning "Chocolatey is not installed"
		}
	}
	if ($Winget) {
		if (Test-Path 'C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_1.19.10173.0_x64__8wekyb3d8bbwe\winget.exe') {
			Write-Host "Updating: winget packages" -ForegroundColor Cyan
			winget upgrade --all --silent
		} else {
			Write-Warning "WinGet is not installed"
		}
	}
	if ($WindowsUpdate) {
		if (Get-Module pswindowsupdate -ListAvailable) {
			Write-Host "Checking for Windows updates..." -ForegroundColor Cyan
			#Update-Module pswindowsupdate
			get-windowsupdate -AcceptAll -Install -WindowsUpdate -IgnoreReboot
			get-windowsupdate -AcceptAll -Install -MicrosoftUpdate
		} else {
			Write-Warning "Module not installed: psWindowsUpdate"
		}
	}
	if ($Modules) {
		#Set-PSRepository -Name PGallery -InstallationPolicy Trusted
		#Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
		#update-module PowerShellGet
		$ModuleNames.Split(',') | Foreach-Object {
			if (Get-Module $_ -ListAvailable) {
				Write-Host "Updating module: $($_)" -ForegroundColor Cyan
				Update-Module $_
			} else {
				Write-Host "Module not installed: $($_)" -ForegroundColor Magenta
			}
		}
	}
	if ($Help) {
		update-help -ErrorAction SilentlyContinue
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
}