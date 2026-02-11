---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Edit-ExcelWorkbookText.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Edit-ExcelWorkbookText
---

# Edit-ExcelWorkbookText

## SYNOPSIS

Find and Replace text a string pattern within XLSX files in a given location

## SYNTAX

### __AllParameterSets

```
Edit-ExcelWorkbookText [[-Path] <string>] [[-SearchPattern] <string>] [[-ReplaceWith] <string>]
 [-Apply] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Search all XLSX workbook files for matching text string and replace with a new text string.

## EXAMPLES

### EXAMPLE 1

Edit-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543" -ReplaceWith "Server9022" -Apply

Replaces instances of "Server543" with "Server9022" within any cells on any sheets of workbooks in 
the path \\server123\docs.
Saves changes back to workbooks.

### EXAMPLE 2

Edit-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543" -ReplaceWith "Server9022" -NoRecurse -Apply

Searches for instances of "Server543" within any cells on any sheets of workbooks in 
the path \\server123\docs, but no subfolders, and save to CSV file.
Saves changes back to workbooks.

### EXAMPLE 3

$results = Edit-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543" -ReplaceWith "Server9022"
$results | Group-Object Workbook | Select-Object Count,Name

Returns counts of matching instances by workbook filename

## PARAMETERS

### -Apply

Confirm saving changes to workbooks

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

### -Path

Path (folder) where .XLSX files reside

```yaml
Type: System.String
DefaultValue: $($env:HOME)\Documents
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

### -ReplaceWith

Text string to insert in place of [SearchPattern] text string

```yaml
Type: System.String
DefaultValue: ''
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

### -SearchPattern

Text string to search for

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

## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Edit-ExcelWorkbookText.md)
