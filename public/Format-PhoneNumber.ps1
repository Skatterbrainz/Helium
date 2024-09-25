function Format-USPhoneNumber {
	<#
	.SYNOPSIS
		Formats a phone number to the standard format (XXX) XXX-XXXX or +1 (XXX) XXX-XXXX.
	.DESCRIPTION
		Formats a phone number to a standard format. The function accepts a phone number in various formats and returns the phone number in the format (XXX) XXX-XXXX. The function also accepts a switch parameter to include the country code.
	.PARAMETER PhoneNumber
		The phone number to format. The phone number can be in the following formats:
		- 1234567890
		- 123 456 7890
		- 123-456-7890
		- (123) 456-7890
		- (123)-456-7890
		- 123-456-7890
		- 123.456.7890
	.PARAMETER includeCountryCode
		A switch parameter to include the country code in the formatted phone number.
	.PARAMETER CountryCode
		The country code to include in the formatted phone number. The default value is 1.
	.EXAMPLE
		Format-USPhoneNumber -PhoneNumber "1234567890" -includeCountryCode
		Formats the phone number 1234567890 to (123) 456-7890 with the country code +1.
	.EXAMPLE
		Format-USPhoneNumber -PhoneNumber "123 456 7890" -includeCountryCode
		Formats the phone number 123 456 7890 to (123) 456-7890 with the country code +1.
	.EXAMPLE
		Format-USPhoneNumber -PhoneNumber "123-456-7890" -includeCountryCode
		Formats the phone number 123-456-7890 to (123) 456-7890 with the country code +1.
	.EXAMPLE
		Format-USPhoneNumber -PhoneNumber "(123) 456-7890" -includeCountryCode
		Formats the phone number (123) 456-7890 to (123) 456-7890 with the country code +1.
	.EXAMPLE
		Format-USPhoneNumber -PhoneNumber "(123)-456-7890" -includeCountryCode
		Formats the phone number (123)-456-7890 to (123) 456-7890 with the country code +1.
	.EXAMPLE
		Format-USPhoneNumber -PhoneNumber "123-456-7890" -includeCountryCode
		Formats the phone number 123-456-7890 to (123) 456-7890 with the country code +1.
	.EXAMPLE
		Format-USPhoneNumber -PhoneNumber "123.456.7890" -includeCountryCode
		Formats the phone number 123.456.7890 to (123) 456-7890 with the country code +1.	
	.LINK
	#>
	param (
		[parameter(Mandatory=$True)][string]$PhoneNumber,
		[parameter(Mandatory=$False)][switch]$includeCountryCode,
		[parameter(Mandatory=$False)][int]$CountrCode = 1
	)
	
	if ($PhoneNumber -match "^\d{10}$") {
		$formattedPhoneNumber = $PhoneNumber -replace '(\d{3})(\d{3})(\d{4})', '($1) $2-$3'
		if ($includeCountryCode) {
			$formattedPhoneNumber = "+$countrCode $formattedPhoneNumber"
		}
		Write-Output $formattedPhoneNumber
	} elseif ($PhoneNumber -match "^\d{3} \d{3} \d{4}$") {
		$formattedPhoneNumber = $PhoneNumber -replace '(\d{3}) (\d{3}) (\d{4})', '($1) $2-$3'
		if ($includeCountryCode) {
			$formattedPhoneNumber = "+$countrCode $formattedPhoneNumber"
		}
		Write-Output $formattedPhoneNumber
	} elseif ($PhoneNumber -match "^\d{3}-\d{3}-\d{4}$") {
		$formattedPhoneNumber = $PhoneNumber -replace '(\d{3})-(\d{3})-(\d{4})', '($1) $2-$3'
		if ($includeCountryCode) {
			$formattedPhoneNumber = "+$countrCode $formattedPhoneNumber"
		}
		Write-Output $formattedPhoneNumber
	} elseif ($PhoneNumber -match "^\(\d{3}\) \d{3}-\d{4}$") {
		$formattedPhoneNumber = $PhoneNumber -replace '\((\d{3})\) (\d{3})-(\d{4})', '($1) $2-$3'
		if ($includeCountryCode) {
			$formattedPhoneNumber = "+$countrCode $formattedPhoneNumber"
		}
		Write-Output $formattedPhoneNumber
	} elseif ($PhoneNumber -match "^\(\d{3}\)-\d{3}-\d{4}$") {
		$formattedPhoneNumber = $PhoneNumber -replace '\((\d{3})\)-(\d{3})-(\d{4})', '($1) $2-$3'
		if ($includeCountryCode) {
			$formattedPhoneNumber = "+$countrCode $formattedPhoneNumber"
		}
		Write-Output $formattedPhoneNumber
	} elseif ($PhoneNumber -match "^\d{3}-\d{3}-\d{4}$") {
		$formattedPhoneNumber = $PhoneNumber -replace '(\d{3})-(\d{3})-(\d{4})', '($1) $2-$3'
		if ($includeCountryCode) {
			$formattedPhoneNumber = "+$countrCode $formattedPhoneNumber"
		}
		Write-Output $formattedPhoneNumber
	} elseif ($PhoneNumber -match "^\d{3} \d{3} \d{4}$") {
		$formattedPhoneNumber = $PhoneNumber -replace '(\d{3}) (\d{3}) (\d{4})', '($1) $2-$3'
		if ($includeCountryCode) {
			$formattedPhoneNumber = "+$countrCode $formattedPhoneNumber"
		}
		Write-Output $formattedPhoneNumber
	} elseif ($PhoneNumber -match "^\d{3}\.\d{3}\.\d{4}$") {
		$formattedPhoneNumber = $PhoneNumber -replace '(\d{3})\.(\d{3})\.(\d{4})', '($1) $2-$3'
		if ($includeCountryCode) {
			$formattedPhoneNumber = "+$countrCode $formattedPhoneNumber"
		}
		Write-Output $formattedPhoneNumber
	} elseif ($PhoneNumber -match "^\d{3}\s\d{3}\s\d{4}$") {
		$formattedPhoneNumber = $PhoneNumber -replace '(\d{3})\s(\d{3})\s(\d{4})', '($1) $2-$3'
	} else {
		Write-Output "Invalid phone number format"
	}
}