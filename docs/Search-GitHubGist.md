---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: ''
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Search-GitHubGist
---

# Search-GitHubGist

## SYNOPSIS

Search GitHub gists for a specific string.

## SYNTAX

### __AllParameterSets

```
Search-GitHubGist [-SearchValue] <string> [[-Limit] <int>] [-IncludeContent] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Search GitHub gists for a specific string using the GitHub CLI.

## EXAMPLES

### EXAMPLE 1

Search-GitHubGist -SearchValue "PowerShell" -IncludeContent -Limit 50
Searches the gists for the string "PowerShell", includes matching content, and limits the search to 50 gists.

### EXAMPLE 2

Search-GitHubGist -SearchValue "PowerShell"
Searches the gists for the string "PowerShell" without including matching content and uses the default limit of 100 gists.

## PARAMETERS

### -IncludeContent

If specified, includes the matching content in the results.

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

### -Limit

The maximum number of gists to search.
Default is 100.

```yaml
Type: System.Int32
DefaultValue: 100
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

The string to search for in the gists.

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

