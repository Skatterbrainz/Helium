function ConvertFrom-Base64 {
	<#
	.SYNOPSIS
		Convert string from Base64 to ASCII
	.DESCRIPTION
		Convert string to Base64 string to ASCII string
	.PARAMETER String
		Required. Base64 encoded string value to be converted.
	.PARAMETER Compressed
		Optional. Decode from compressed source
	.EXAMPLE
		"H4sIAAAAAAAEACvJyCxWAKJEhZLU4hKF4pKizLx0ALXWhvwVAAAA" | ConvertFrom-Base64
		returns: "this is a test string"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-Base64.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true,ValueFromPipeline=$true,HelpMessage="Base64 Encoded String")][ValidateNotNullOrEmpty()]$String,
		[parameter(Mandatory=$False,HelpMessage="Convert using compressed stream")][switch]$Compressed
	)
	begin {}
	process {
		if ($Compressed) {
			$data = [System.Convert]::FromBase64String($String)
			$compressedStream = [System.IO.MemoryStream]::new($data)
			$zipStream = [System.IO.Compression.GZipStream]::new($compressedStream, [System.IO.Compression.CompressionMode]::Decompress)
			$resultStream = [System.IO.MemoryStream]::new()
			$buffer = [System.Byte[]]::CreateInstance([System.Byte],4096)
			while (($read = $zipStream.Read($buffer, 0, $buffer.Length)) -gt 0){
				$resultStream.Write($buffer, 0, $read)
			}
			$decompressed = $resultStream.ToArray()
			[System.Text.Encoding]::UTF8.GetString($decompressed, 0, $decompressed.Length)
		} else {
			[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($String))
		}
	}
	end {}
}