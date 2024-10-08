function Test-Guid {
	param (
		[parameter(Mandatory=$False)][string] $Guid
	)
	([guid]::TryParse($Guid, $([ref][guid]::Empty))) -eq $True
}