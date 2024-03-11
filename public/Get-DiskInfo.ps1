function Get-DiskInfo {
	param()
	<#
	.SYNOPSIS
	Get local disk information

	.DESCRIPTION
	Get local disk information

	.PARAMETER (none)

	.EXAMPLE
	Get-LxDiskInfo

	.LINK
	https://github.com/Skatterbrainz/Helium/blob/master/docs/Get-DiskInfo.md
	#>
	if ($PSVersionTable.Platform -ne 'Unix') {
		Get-CimInstance Win32_LogicalDisk -Filter "DriveType = 3" |
			Select-Object DeviceID, VolumeName, @{l='Size'; e={[math]::Round($_.Size/1GB,2)}}, @{l='Free'; e={[math]::Round($_.FreeSpace/1GB,2)}}
	} else {
		$items = Invoke-Command -ScriptBlock { lsblk -o KNAME,UUID,MODEL,FSTYPE,SIZE,FSUSED,SERIAL,PTTYPE,MOUNTPOINT -P }
		$items # more work to do here
		# KNAME="sda" UUID="" MODEL="SAMSUNG SSD PM871b M.2 2280 512GB" FSTYPE="" SIZE="476.9G" FSUSED="" SERIAL="S3TZNB0K206736" PTTYPE="gpt" MOUNTPOINT=""
	}
}