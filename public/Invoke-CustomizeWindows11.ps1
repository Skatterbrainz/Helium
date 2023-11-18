function Invoke-CustomizeWindows11 {
	[CmdletBinding()]
	param()
	try {
		if (!(Get-Module CustomizeWindows11 -ListAvailable)) {
			throw "Required Module not installed: CustomizeWindows"
		}
		$cmdlist = Get-Command -Module CustomizeWindows11 get* | Select-Object -ExpandProperty Name
		foreach ($cn in $cmdlist) {
			$label = $cn.Split("-")[1]
			try {
				& $cn
			} catch {
				[pscustomobject]@{Setting = $label; Enabled = '----'}
			}
		}
	} catch {
		Write-Error $_.Exception.Message
	}
}