---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Find-ExcelWorkbookText.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Find-ExcelWorkbookText
---

# Find-ExcelWorkbookText

## SYNOPSIS

Find text string pattern within XLSX files in a given location

## SYNTAX

### __AllParameterSets

```
Find-ExcelWorkbookText [[-Path] <string>] [[-SearchPattern] <string>] [[-OutputFile] <string>]
 [-SaveFile] [-NoRecurse] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Search all XLSX workbook files for matching text string and return
information about the workbook, worksheet, matching value, and location

## EXAMPLES

### EXAMPLE 1

.\Find-ExcelWorkbookText.ps1 -Path "\\server123\docs" -SearchPattern "Server543" -SaveFile

Searches for instances of "Server543" within any cells on any sheets of workbooks in 
the path \\server123\docs, and save to CSV file.

### EXAMPLE 2

Find-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543" -SaveFile -NoRecurse

Searches for instances of "Server543" within any cells on any sheets of workbooks in 
the path \\server123\docs, but no subfolders, and save to CSV file.

### EXAMPLE 3

$results = Find-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543"
$results | Group-Object Workbook | Select-Object Count,Name

Returns counts of matching instances by workbook filename

## PARAMETERS

### -NoRecurse

Scan xlsx files in Path location only, do not scan into subfolders

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

### -OutputFile

CSV output path+filename

```yaml
Type: System.String
DefaultValue: "\"$($env:HOME)\\Documents\\excel_search_$(Get-Date -f 'yyyyMMddhhmm').csv\""
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

### -Path

Path (folder) where .XLSX files reside

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

### -SaveFile

Save output to CSV file

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

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Find-ExcelWorkbookText.md)
