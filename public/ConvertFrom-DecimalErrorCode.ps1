function ConvertFrom-DecimalErrorCode {
	<#
	.SYNOPSIS
		Convert Decimal error code
	.DESCRIPTION
		Convert Decimal error code
	.PARAMETER DecimalErrorCode
		Error code in Decimal format
	.EXAMPLE
		-2147206582 | ConvertFrom-DecimalErrorCode
		Returns: 0xffffffff80043a4a
	.NOTES
		By Trevor Jones - https://smsagent.blog/2015/06/25/translating-error-codes-for-windows-and-configuration-manager/
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-DecimalErrorCode.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$True,ValueFromPipeline=$True)][int64]$DecimalErrorCode
	)
	begin {}
	process {
		$hex = '{0:x}' -f $DecimalErrorCode
		$hex = "0x" + $hex
		$hex
	}
	end {}
}
