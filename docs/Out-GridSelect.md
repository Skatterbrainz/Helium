---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Out-GridSelect.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Out-GridSelect
---

# Out-GridSelect

## SYNOPSIS

Use GridView or ConsoleGridView to provide a selection menu

## SYNTAX

### __AllParameterSets

```
Out-GridSelect [-InputObject] <Object> [[-Title] <string>] [[-OutputMode] <string>] [-ForceConsole]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Use a GridView or ConsoleGridView to provide a selection menu interface for selecting either
single or multiple items.
On Linux this will only invoke a ConsoleGridView.
For Windows, it 
will default to a GridView unless -ForceConsole is used.

## EXAMPLES

### EXAMPLE 1

Get-Process | Out-GridSelect

### EXAMPLE 2

Get-Process | Out-GridSelect -Title "Select Processes" -OutputMode Multiple

## PARAMETERS

### -ForceConsole

Optional.
On Windows machines, forces ConsoleGridView

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

### -InputObject

An array of objects.

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

### -OutputMode

Optional.
Single (Default) or Multiple.

```yaml
Type: System.String
DefaultValue: Single
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Title

Title to display on the gridview heading (caption).
If not provided will display "Select Item"
or "Select Items"

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

The Microsoft.PowerShell.ConsoleGuiTools module is required on Linux, or when using -ForceConsole.
I had some challenges with getting this function to accept pipeline input, mostly because I'm too
stupid to figure it out and I need to cut down my coffee consumption.
If you want to show me how to
make that work please submit a pull request and I'll gladly plaster your name all over it for credit.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Out-GridSelect.md)
