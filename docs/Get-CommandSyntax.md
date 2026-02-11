---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Syntax.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Get-CommandSyntax
---

# Get-CommandSyntax

## SYNOPSIS

Show formatted basic syntax for a function or cmdlet

## SYNTAX

### __AllParameterSets

```
Get-CommandSyntax [-Command] <Object> [-Normalize] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Show formatted basic syntax for a function or cmdlet

## EXAMPLES

### EXAMPLE 1

Get-CommandSyntax Get-DocRef

### EXAMPLE 2

Get-CommandSyntax Get-DocRef -Normalize

## PARAMETERS

### -Command

Name of command / cmdlet / function

```yaml
Type: System.Object
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

### -Normalize

Displays output on 1-line.
Default is stacked view

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

Borrowed entirely from [Brett Miller] with very minor changes: https://github.com/brettmillerb/Toolbox


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Syntax.md)
