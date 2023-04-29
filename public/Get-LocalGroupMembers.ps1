function Get-LocalGroupMembers {
	<#
	.SYNOPSIS
		Returns local group members
	.DESCRIPTION
		I hate repeating myself
	.PARAMETER ComputerName
		Name of computer (if remote). Default = 'localhost'
	.PARAMETER GroupName
		Name of local group. Default = 'Administrators'
	.NOTES
		Adapted from https://gallery.technet.microsoft.com/scriptcenter/List-local-group-members-c25dbcc4
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-LocalGroupMembers.md
	#>
	[CmdletBinding()]
	[OutputType()]
	param (
		[parameter(ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)] [Alias("Name")] [string]$ComputerName = 'localhost',
		[parameter()][Alias('Group')][string]$GroupName = "Administrators"
	)
	begin {}
	process {
		$ComputerName = $ComputerName.Replace("`$", '')
		$arr = @()
		$hostname = (Get-WmiObject -ComputerName $ComputerName -Class Win32_ComputerSystem).Name
		$wmi = Get-WmiObject -ComputerName $ComputerName -Query "SELECT * FROM Win32_GroupUser WHERE GroupComponent=`"Win32_Group.Domain='$Hostname',Name='$GroupName'`""
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
	end {}
}
