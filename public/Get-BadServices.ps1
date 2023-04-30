function Get-BadServices {
	param()
	Get-Service | Where-Object {$_.StartType -eq 'Automatic' -and $_.State -ne 'Running'}
}