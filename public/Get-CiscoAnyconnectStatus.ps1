function Get-CiscoAnyconnectStatus {
	<#
	.SYNOPSIS
		Get current AnyConnect state/status
	.DESCRIPTION
		Gets the current Cisco AnyConnect VPN state
	.PARAMETER (none)
	.EXAMPLE
		Get-CiscoAnyConnectStatus
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-CiscoAnyConnectStatus.md
	#>
	[CmdletBinding()]
	param()
	try {
		if ($PSVersionTable.Platform -eq 'Unix') { throw "No supported on Linux systems" }
		$VPNExe = "$(${env:ProgramFiles(x86)})\Cisco\Cisco AnyConnect Secure Mobility Client\vpncli.exe"
		if (Test-Path $VPNExe) {
			$fileinfo = (Get-Item -Path $VPNExe).VersionInfo | Select-Object -ExpandProperty FileVersion
			$filever = $fileinfo.replace(' ','').replace(',','.')
			$DiagComm = New-Object System.Diagnostics.ProcessStartInfo
			$DiagComm.FileName = $VPNExe
			$DiagComm.Arguments = 'state'
			$DiagComm.UseShellExecute = $false
			$DiagComm.RedirectStandardOutput = $true
			$ProcComm = New-Object System.Diagnostics.Process
			$ProcComm.StartInfo = $DiagComm
			[Void]$ProcComm.Start()
			While (!$bDone) {
				$outputComm = $ProcComm.StandardOutput.Read()
				if ($outputComm -eq -1) {
					if ($ProcComm.HasExited) {
						$bDone = $true
					} else {
						Wait-Event 1
					}
				} else {
					$ReadLine += "".PadLeft(1, $outputComm)
					if ($ReadLine -like "*state: Connected*") {
						$vpnstate = 'Connected'
					} elseif ($ReadLine -like "*state: Disconnected*") {
						$vpnstate = 'Disconnected'
					}
				}
			}
		} else {
			$vpnstate = 'NotFound'
		}
		[pscustomobject]@{
			ComputerName = $env:COMPUTERNAME
			UserName     = $env:USERNAME
			VpnPath      = $VPNExe
			VpnVersion   = $filever
			VpnState     = $vpnstate
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}