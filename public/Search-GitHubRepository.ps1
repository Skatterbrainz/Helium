function Search-GitHubRepository {
	<#
	.SYNOPSIS
		Search GitHub repositories for a specific string.
	
	.DESCRIPTION
		Search GitHub repositories for a specific string using the GitHub CLI.
	
	.PARAMETER SearchValue
		The string to search for in the repositories.
	
	.PARAMETER Owner
		The owner of the repositories to search. If not provided, searches all accessible repositories.

	.PARAMETER Summary
		If specified, returns a summary of repositories containing matches instead of detailed match information.
	
	.EXAMPLE
		Search-GitHubRepository -SearchValue "PowerShell" -Owner "skatterbrainz"
		Searches the repositories owned by "skatterbrainz" for the string "PowerShell".
	
	.EXAMPLE
		Search-GitHubRepository -SearchValue "PowerShell" -Summary
		Searches all accessible repositories for the string "PowerShell" and returns a summary of repositories containing matches.
	
	.NOTES
		Requires GitHub CLI (gh) to be installed and authenticated.
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory = $true)][string]$SearchValue,
		[parameter(Mandatory = $false)][string]$Owner,
		[parameter(Mandatory = $false)][switch]$Summary
	)
	try {
		if ([string]::IsNullOrEmpty($SearchValue)) {
			throw "No SearchValue was provided"
		}
		if ($IsLinux -or $IsMacOS) {
			$cmd = "gh"
		} else {
			$cmd = "gh.exe"
		}
		if (-not (Get-Command $cmd)) {
			throw "Install GitHub CLI first."
		}
		$arglist = "search code `"$SearchValue`""
		if (![string]::IsNullOrEmpty($Owner)) {
			$arglist += " --owner=$Owner"
		}
		$arglist += " --json repository,path,url,textMatches"

		# Build arguments array for direct execution
		$ghArgs = @('search', 'code', $SearchValue)
		if (![string]::IsNullOrEmpty($Owner)) {
			$ghArgs += "--owner=$Owner"
		}
		$ghArgs += @('--json', 'repository,path,url,textMatches')

		Write-Verbose "Command: $cmd $($arglist -join ' ')"
		$textmatches = & $cmd $ghArgs | ConvertFrom-Json
		Write-Host "$($textmatches.count) matches found" -ForegroundColor Cyan
		if ($Summary.IsPresent) {
			$textmatches | Select-Object -Property @{l = 'Repository'; e = { $_.repository.nameWithOwner } } |
				Select-Object -Property Repository | Sort-Object -Unique -Property Repository
		} else {
			$textmatches |
				Select-Object -Property path,url,@{l = 'Repository'; e = { $_.repository.nameWithOwner } },
					@{l = 'Text'; e = { $_.textMatches.fragment } } |
				Sort-Object -Property Repository
		}
	} catch {
		[pscustomobject]@{
			Status   = "Error"
			Message  = $_.Exception.Message
			Trace    = $_.Exception.ScriptStackTrace
			Category = $_.Exception.CategoryInfo.Activity
		}
	}
}