function Get-FunctionParams {
	<#
	.SYNOPSIS
		Returns summary of function parameters
	.DESCRIPTION
		Returns summary of function parameters including name and parameter type
	.PARAMETER Name
		Name of function or command
	.EXAMPLE
		Get-FunctionParams Invoke-Grep
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Get-FunctionParams.md
	#>
	param (
		[parameter(Mandatory=$True)][string]$Name
	)
	try {
		if (!(Get-Command $Name -ErrorAction SilentlyContinue)) {
			throw "Command not defined or loaded: $Name"
		}
		(Get-Command $Name).Parameters.Values | Select-Object Name,ParameterType
	} catch {
		Write-Error $_.Exception.Message
	}
}