function Invoke-MsgBox {
	<#
	.SYNOPSIS
		Display Windows message box
	.DESCRIPTION
		Display a Windows message box
	.PARAMETER Message
		Text to display in the message box
	.PARAMETER Title
		Message box caption / title
	.PARAMETER ButtonType
		Ok, OkCancel, YesNo, YesNoCancel. Default is Ok
	.PARAMETER Icon
		Error, Exclamation, Information, Question, Warning, None. Default is Information
	.EXAMPLE
		$choice = Invoke-MsgBox -Message "Proceed?" -Title "Update Records" -ButtonType YesNo -Icon Question
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-MsgBox.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory)][string]$Message,
		[parameter(Mandatory)][string]$Title,
		[parameter()][string][ValidateSet('Ok','OkCancel','YesNo','YesNoCancel')]$ButtonType = 'Ok',
		[parameter()][string]
			[ValidateSet('Asterisk','Error','Exclamation','Hand','Information','Question','Stop','Warning','None')]$Icon = 'Information'
	)
	Add-Type -AssemblyName PresentationCore, PresentationFramework
	$result = [System.Windows.MessageBox]::Show($Message, $Title, $ButtonType, $Icon)
	$result
}