<#
.SYNOPSIS
	Validate SMTP address
.DESCRIPTION
	Test a string to confirm it is a valid SMTP address
.PARAMETER Address
	Required. String to be validated as an SMTP e-mail address.
.EXAMPLE
	Test-SmtpAddress "jsmith@contoso.com"
.LINK
#>
function Test-SmtpAddress {
	[parameter(Mandatory=$True)][string]$Address
	return ($Address -match '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
}
