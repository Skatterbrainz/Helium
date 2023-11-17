function Convert-Base64 {
	<#
	.SYNOPSIS
		Convert string to Base64 compressed, or from Base64 compressed to ASCII
	.DESCRIPTION
		Convert string to Base64 compressed, or from Base64 compressed to ASCII
	.PARAMETER String
		Required. String value to be converted.
	.PARAMETER Output
		Required. Options are Base64 or ASCII
	.EXAMPLE
		$x = "this is a test string" | Convert-Base64 -Output Base64
		returns "H4sIAAAAAAAEACvJyCxWAKJEhZLU4hKF4pKizLx0ALXWhvwVAAAA"

		$x | Convert-Base64 -Output Base64
		Returns "this is a test string"
	.EXAMPLE
		"H4sIAAAAAAAEACvJyCxWAKJEhZLU4hKF4pKizLx0ALXWhvwVAAAA" | Convert-Base64 -Output ASCII
		returns "this is a test string"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Convert-Base64.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true,ValueFromPipeline=$true)][ValidateNotNullOrEmpty()]$String,
		[parameter(Mandatory=$true)][string][ValidateSet('Base64','ASCII')]$Output
	)
	begin {}
	process {
		if ($Output -eq 'Base64') {
			[Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes($String))
		} else {
			[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($String))
		}
	}
	end {}
}