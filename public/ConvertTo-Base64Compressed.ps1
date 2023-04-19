function ConvertTo-Base64Compressed {
	<#
	.SYNOPSIS
		Convert string to Base64 compressed
	.DESCRIPTION
		Convert an ASCII string to Base64 compressed format
	.PARAMETER String
		Required. Text string to convert.
	.EXAMPLE
		"this is a test string" | ConvertTo-Base64Compressed
		returns "H4sIAAAAAAAEACvJyCxWAKJEhZLU4hKF4pKizLx0ALXWhvwVAAAA"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Base64Compressed.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true,ValueFromPipeline=$true)][ValidateNotNullOrEmpty()]$string
	)
	begin {}
	process {
		$enc = [system.Text.Encoding]::UTF8
		$data = $enc.GetBytes($string)
		$compressedStream = [System.IO.MemoryStream]::new()
		$zipStream = [System.IO.Compression.GZipStream]::new($compressedStream, [System.IO.Compression.CompressionMode]::Compress)
		$zipStream.Write($data, 0, $data.Length);
		$zipStream.Close();
		$compressedData = $compressedStream.ToArray()
		[Convert]::ToBase64String($compressedData)
	}
	end {}
}
#New-Alias -Name "ConvertTo-Base64" -Value ConvertTo-Base64Compressed