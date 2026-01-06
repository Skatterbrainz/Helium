function Get-LocalGroupMembers {
	<#
	.SYNOPSIS
		Returns local group members
	.DESCRIPTION
		Returns local group members
	.PARAMETER ComputerName
		Name of computer (if remote). Default = 'localhost'
	.PARAMETER Identity
		Name of local group. Default = 'Administrators'
	.NOTES
		Adapted from https://gallery.technet.microsoft.com/scriptcenter/List-local-group-members-c25dbcc4
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-LocalGroupMembers.md
	#>
	[CmdletBinding()]
	[OutputType()]
	param (
		[parameter(Mandatory=$False,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)] [Alias("Name")] [string]$ComputerName = 'localhost',
		[parameter(Mandatory=$False)][Alias('Group')][string]$Identity = "Administrators"
	)
	begin {}
	process {
		if ($PSVersionTable.Platform -eq 'Unix') {
			$groups   = Invoke-Command -ScriptBlock { cat /etc/group }
			$computer = Invoke-Command -ScriptBlock { hostname }
			$results  = [System.Collections.ArrayList]::new()
			foreach ($group in $groups) {
				$gdata = $group.Split(":")
				$row = [pscustomobject]@{
					Name     = $gdata[0]
					ID       = $gdata[2]
					Members  = $gdata[3].Split(",")
					Computer = $computer
				}
				$null = $results.Add($row)
			}
			if (![string]::IsNullOrWhiteSpace($Identity)) {
				$results | Where-Object {$_.Name -eq $Identity}
			} else {
				$results | Sort-Object Id,Name
			}
		} else {
			$ComputerName = $ComputerName.Replace("`$", '')
			$arr = @()
			$hostname = (Get-WmiObject -ComputerName $ComputerName -Class Win32_ComputerSystem).Name
			$wmi      = Get-WmiObject -ComputerName $ComputerName -Query "SELECT * FROM Win32_GroupUser WHERE GroupComponent=`"Win32_Group.Domain='$Hostname',Name='$Identity'`""
			if ($null -ne $wmi) {
				foreach ($item in $wmi) {
					$data   = $item.PartComponent -split "\,"
					$domain = ($data[0] -split "=")[1]
					$name   = ($data[1] -split "=")[1]
					$arr += ("$domain\$name").Replace("""","")
					[Array]::Sort($arr)
				}
			}
			return $arr
		}
	}
	end {}
}
