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
			$enc = [system.Text.Encoding]::UTF8
			$data = $enc.GetBytes($string)
			$compressedStream = [System.IO.MemoryStream]::new()
			$zipStream = [System.IO.Compression.GZipStream]::new($compressedStream, [System.IO.Compression.CompressionMode]::Compress)
			$zipStream.Write($data, 0, $data.Length);
			$zipStream.Close();
			$compressedData = $compressedStream.ToArray()
			[Convert]::ToBase64String($compressedData)
		} else {
			$data = [System.Convert]::FromBase64String($EncodedText)
			$compressedStream = [System.IO.MemoryStream]::new($data)
			$zipStream = [System.IO.Compression.GZipStream]::new($compressedStream, [System.IO.Compression.CompressionMode]::Decompress)
			$resultStream = [System.IO.MemoryStream]::new()
			$buffer = [System.Byte[]]::CreateInstance([System.Byte],4096)
			while (($read = $zipStream.Read($buffer, 0, $buffer.Length)) -gt 0){
				$resultStream.Write($buffer, 0, $read)
			}
			$decompressed = $resultStream.ToArray()
			[System.Text.Encoding]::UTF8.GetString($decompressed, 0, $decompressed.Length)
		}
	}
	end {}
}