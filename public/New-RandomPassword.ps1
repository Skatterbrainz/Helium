function New-RandomPassword {
	<#
	.SYNOPSIS
		Creates a new random password.
	.DESCRIPTION
		This function generates a random password using the DinoPass API.
	.PARAMETER pwdLength
		The length of the password. Must be between 7 and 20. Default is 16.
	.PARAMETER Strong
		If specified, generates a strong password.
	.PARAMETER useCapitals
		If specified, includes capital letters in the password.
	.PARAMETER useNumbers
		If specified, includes numbers in the password.
	.PARAMETER useSymbols
		If specified, includes symbols in the password.
	.PARAMETER BaseURL
		The base URL of the DinoPass API. Default is 'http://www.dinopass.com/password'.
	.EXAMPLE
		New-RandomPassword -pwdLength 12 -useCapitals -useNumbers

		This command generates a random password of length 12 that includes capital letters and numbers.
	.EXAMPLE
		New-RandomPassword -Strong

		This command generates a strong random password.
	.EXAMPLE
		New-RandomPassword -pwdCount 5 -OutputFormat json

		This command generates 5 random passwords and outputs them in JSON format.
	.EXAMPLE
		New-RandomPassword -pwdLength 20 -useCapitals -useNumbers -useSymbols

		This command generates a random password of length 20 that includes capital letters, numbers, and symbols.
	.NOTES
		See API reference at https://www.dinopass.com/api for more information.
	#>
	[CmdletBinding()]
	param(
		[parameter(Mandatory=$false)][int][ValidateRange(7,20)]$pwdLength = 16,
		[parameter(Mandatory=$false)][switch]$Strong,
		[parameter(Mandatory=$false)][switch]$useCapitals,
		[parameter(Mandatory=$false)][switch]$useNumbers,
		[parameter(Mandatory=$false)][switch]$useSymbols,
		[parameter(Mandatory=$false)][int]$pwdCount = 1,
		[parameter(Mandatory=$false)][string][ValidateSet('text','json')]$OutputFormat = 'text',
		[parameter(Mandatory=$false)][string]$BaseURL = 'http://www.dinopass.com/password'
	)
	$params = @()
	if ($Strong.IsPresent) {
		$params += "/strong"
	} else {
		$BaseURL += "/custom"
		$params += "length=$pwdLength"
		if ($useNumbers.IsPresent) {
			$params += "useNumbers=true"
		}
		if ($useCapitals.IsPresent) {
			$params += "useCapitals=true"
		}
		if ($useSymbols.IsPresent) {
			$params += "useSymbols=true"
		}
	}
	if ($pwdCount -gt 1) {
		$params += "n=$pwdCount"
	}
	if ($OutputFormat -eq 'json') {
		$params += "format=json"
	}
	$url = "$BaseURL`?" + ($params -join "&")
	Write-Verbose "URL: $url"
	$newPassword = $(Invoke-WebRequest -Uri $url -UseBasicParsing).Content
	Write-Output $newPassword
}