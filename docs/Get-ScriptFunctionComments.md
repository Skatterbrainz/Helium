---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ScriptFunctionComments.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Get-ScriptFunctionComments
---

# Get-ScriptFunctionComments

## SYNOPSIS

Extracts function comments from a script file.

## SYNTAX

### __AllParameterSets

```
Get-ScriptFunctionComments [[-FilePath] <string>] [[-FolderPath] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Extracts function comments from a script file.

## EXAMPLES

### EXAMPLE 1

Get-ScriptFunctionComments -FilePath "C:\GitHub\project42\runbooks\ula-support.ps1"
Extracts function comments from the specified script file.

### EXAMPLE 2

Get-ScriptFunctionComments -FolderPath "C:\GitHub\project42\runbooks"
Extracts function comments from all .ps1 script files in the specified folder.

## PARAMETERS

### -FilePath

The path to the script file to process.

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

### -FolderPath

The path to the folder containing script files to process.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

Either FilePath or FolderPath must be specified.
If FilePath is provided, FolderPath is ignored.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ScriptFunctionComments.md)
