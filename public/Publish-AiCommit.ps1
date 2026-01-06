function Publish-AiCommit {
	<#
	.SYNOPSIS
		Use PowerShellAI to handle your Git commits
	.DESCRIPTION
		Invoke git stage, commit, push from a local repo path, where the commit
		message is produced by submitting a request from the git status through openAI
	.PARAMETER Path
		Path to the local git repository
	.PARAMETER Send
		Commit the changes and issue a push command
	.EXAMPLE
		Publish-AiCommit

		Shows the staging message returned from the OpenAI request
	.EXAMPLE
		Publish-AiCommit -Send

		Shows the staging message from OpenAI for the repo in the current directory, and commits the changes, then issues a push command
	.EXAMPLE
		Publish-AiCommit -Path ".\repo42\" -Send

		Shows the staging message from OpenAI for the repo in the specified path, and commits the changes, then issues a push command
	.NOTES
		Requires PowerShellAI module and having the OpenAI API key defined as environment variable "OpenAIKey"
	.LINK
		https://github.com/Skatterbrainz/helium/blob/master/docs/Publish-AiCommit.md
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$false)][string]$Path = "",
		[parameter(Mandatory=$false)][string]$CustomComment,
		[parameter(Mandatory=$false)][switch]$Send
	)
	try {
		if (!(Get-Module PowerShellAIAssistant -ListAvailable)) {
			throw "Requires PowerShell module to be installed: PowerShellAIAssistant"
		}
		if ([string]::IsNullOrWhiteSpace($env:OPENAIKEY)) {
			throw "Environment variable OpenAIKey is not defined"
		}
		if ($IsLinux) {
			if (!(Test-Path '/lib/git-core/git')) {
				throw "Missing required application: git"
			}
		} else {
			if (!(Test-Path 'HKLM:\SOFTWARE\GitForWindows')) {
				throw "Missing required application: git"
			}
		}
		if (![string]::IsNullOrWhiteSpace($Path)) {
			if (Test-Path $Path) {
				$loc = (Get-Location).Path
				Write-Verbose "-- moving to path: $Path"
				Set-Location -Path $Path
			} else {
				throw "Any AI could tell you that path doesn't exist: $Path"
			}
		}
		Write-Verbose "-- requesting git status for repo"
		$status = git status
		if ($status -notlike "*Your branch is up to date*") {
			Write-Verbose "-- staging git repo changes"
			git stage --all
			if ([string]::IsNullOrWhiteSpace($CustomComment)) {
				Write-Verbose "-- requesting commit message from OpenAI prompt"
				$msg = git status | ai "write a commit message for the staged changes in this repo"
			} else {
				Write-Host "Bypassing OpenAI prompt and using custom comment: $CustomComment" -ForegroundColor Cyan
				$msg = $CustomComment
			}
			if ($Send) {
				Write-Host "commit: $msg"
				git commit -m "$($msg)"
				Write-Verbose "-- issuing a git push"
				git push
			} else {
				Write-Host "proposed: $msg"
			}
		} else {
			throw "Path does not contain a git repo configuration: $($pwd)"
		}
	} catch {
		Write-Warning "Message: $($_.Exception.Message)"
	} finally {
		if ($loc) {
			Write-Verbose "-- returning to path: $loc"
			Set-Location $loc
		}
	}
}
