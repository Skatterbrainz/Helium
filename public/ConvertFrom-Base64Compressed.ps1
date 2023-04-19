function ConvertFrom-Base64Compressed {
	<#
	.SYNOPSIS
		Convert string from Base64 compressed to ASCII
	.DESCRIPTION
		Convert a Base64 encoded string to ASCII
	.PARAMETER String
		Required. Base64 compressed text string to convert.
	.EXAMPLE
		$x = "this is a test string" | ConvertTo-Base64Compressed
		returns "H4sIAAAAAAAEACvJyCxWAKJEhZLU4hKF4pKizLx0ALXWhvwVAAAA"

		$x | ConvertFrom-Base64Compressed
		Returns "this is a test string"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-Base64Compressed.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true,ValueFromPipeline=$true)][ValidateNotNullOrEmpty()]$EncodedText
	)
	begin {}
	process {
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
	end {}
}
