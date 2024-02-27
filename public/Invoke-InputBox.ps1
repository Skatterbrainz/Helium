function Invoke-InputBox {
	<#
	.SYNOPSIS
		Provide InputBox() clone for PowerShell
	.DESCRIPTION
		Provide InputBox() clone for PowerShell
	.PARAMETER Title
		Form Title / caption
	.PARAMETER Message
		Form prompt or message text
	.PARAMETER DefaultResponse
		Default value to offer to user.
	.EXAMPLE
		$zip = Invoke-InputBox -Title "Mail Delivery" -Message "Enter ZIP code"
	.EXAMPLE
		$zip = Invoke-InputBox -Title "Mail Delivery" -Message "Enter ZIP code" -DefaultResponse "12345-0987"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-InputBox.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory)][string]$Title,
		[parameter(Mandatory)][string]$Message,
		[parameter()][string]$DefaultResponse = ""
	)
	try {
		if ($PSVersionTable.Platform -eq 'Unix') { throw "This command only works on Windows" }
		[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
		$text = [Microsoft.VisualBasic.Interaction]::InputBox($Message, $Title, $DefaultResponse)
		return $text
	} catch {
		Write-Error $_.Exception.Message
	}
}