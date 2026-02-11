---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Import-FunctionFromGist.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Import-FunctionFromGist
---

# Import-FunctionFromGist

## SYNOPSIS

Define a function by importing script from GitHub Gist URL

## SYNTAX

### __AllParameterSets

```
Import-FunctionFromGist [[-URL] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Import Gist raw content, wrap in function block, and invoke-expression to conver to a function

## EXAMPLES

### EXAMPLE 1

$url = 'https://gist.githubusercontent.com/Skatterbrainz/c222038b4a9a178d09428e144d86a953/raw/a3ba51e55115d5c0ab31e8fa609edf2328f3a3ec/get-pcinfo.ps1'
Import-FunctionFromGist -URL $url
Defines function get-pcinfo using filename "get-pcinfo.ps1" from the end of the URL

## PARAMETERS

### -URL

Required.
URL for GitHub Gist to import as PowerShell function.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
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

The Gist content must be a PowerShell script that can be contained as a function.
The URL must be to the RAW view of the Gist, not the HTML wrapped view.
The URL tail/leaf that indicates the filename is applied as the function name.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Import-FunctionFromGist.md)
