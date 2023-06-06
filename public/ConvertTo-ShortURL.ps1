function ConvertTo-ShortURL {
	param (
		[parameter(Mandatory, ValueFromPipeline=$True)]
		[ValidateNotNullOrEmpty()]
		[string] $Url
	)
	try {
		if ([string]::IsNullOrEmpty($env:BitlyAPI)) {
			throw "BitlyAPI environment variable not defined"
		}
		$token = $env:BitlyAPI
		$bitly = "https://api-ssl.bitly.com/v3/shorten?access_token=$token&longurl=$url"
		(Invoke-RestMethod -Uri $bitly).data.url
	}
	catch {
		Write-Error $_.Exception.Message
	}
}