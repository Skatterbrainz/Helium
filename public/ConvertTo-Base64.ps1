function ConvertTo-Base64 {
	<#
	.SYNOPSIS
		Convert ASCII or Unicode string to Base64
	.DESCRIPTION
		Convert ASCII or Unicode string to Base64 string
	.PARAMETER String
		Required. ASCII or Unicode string value to be converted.
	.PARAMETER Compressed
		Optional. Compress results, or decode from compressed source
	.EXAMPLE
		$x = "this is a test string"
		$x | ConvertTo-Base64
		Returns: "H4sIAAAAAAAEACvJyCxWAKJEhZLU4hKF4pKizLx0ALXWhvwVAAAA"
	.EXAMPLE
		"this is a compressed test string" | ConvertTo-Base64 -Compressed
		returns: "H4sIAAAAAAAACivJyCxWAKJEheT83IKi1OLi1BSFktTiEoXikqLMvHQAhzKd/iAAAAA="
	.NOTES
		Compressed may result in a longer Base64 output.
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Base64.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true,ValueFromPipeline=$true,HelpMessage="Source ASCII or Unicode String")][ValidateNotNullOrEmpty()]$String,
		[parameter(HelpMessage="Convert using compressed stream")][switch]$Compressed
	)
	begin {}
	process {
		if ($Compressed) {
			$enc = [system.Text.Encoding]::UTF8
			$data = $enc.GetBytes($string)
			$compressedStream = [System.IO.MemoryStream]::new()
			$zipStream = [System.IO.Compression.GZipStream]::new($compressedStream, [System.IO.Compression.CompressionMode]::Compress)
			$zipStream.Write($data, 0, $data.Length);
			$zipStream.Close();
			$compressedData = $compressedStream.ToArray()
			[Convert]::ToBase64String($compressedData)
		} else {
			[Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes($String))
		}
	}
	end {}
}