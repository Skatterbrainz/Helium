---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: ''
Locale: en-US
Module Name: helium
ms.date: 01/16/2026
PlatyPS schema version: 2024-05-01
title: Search-GitHubRepository
---

# Search-GitHubRepository

## SYNOPSIS

Search GitHub repositories for a specific string.

## SYNTAX

### __AllParameterSets

```
Search-GitHubRepository [-SearchValue] <string> [[-Owner] <string>] [-Summary] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Search GitHub repositories for a specific string using the GitHub CLI.

## EXAMPLES

### EXAMPLE 1

Search-GitHubRepository -SearchValue "PowerShell" -Owner "skatterbrainz"
Searches the repositories owned by "skatterbrainz" for the string "PowerShell".

### EXAMPLE 2

Search-GitHubRepository -SearchValue "PowerShell" -Summary
Searches all accessible repositories for the string "PowerShell" and returns a summary of repositories containing matches.

## PARAMETERS

### -Owner

The owner of the repositories to search.
If not provided, searches all accessible repositories.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -SearchValue

The string to search for in the repositories.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Summary

If specified, returns a summary of repositories containing matches instead of detailed match information.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

Requires GitHub CLI (gh) to be installed and authenticated.


## RELATED LINKS

{{ Fill in the related links here }}

