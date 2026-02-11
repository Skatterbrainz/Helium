---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Excel.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: ConvertTo-Excel
---

# ConvertTo-Excel

## SYNOPSIS

Converts a CSV, JSON, or XML file to an Excel file.

## SYNTAX

### __AllParameterSets

```
ConvertTo-Excel [-FullName] <string> [[-WorksheetName] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Converts a CSV, JSON, or XML file to an Excel file.
The output file will have the same name as the source file, but with an .xlsx extension.

## EXAMPLES

### EXAMPLE 1

ConvertTo-Excel -FullName C:\temp\file.csv
Converts the CSV file C:\temp\file.csv to an Excel file C:\temp\file.xlsx.

### EXAMPLE 2

Get-Item -Path "c:\temp\file.json" | ConvertTo-Excel
Converts the JSON file C:\temp\file.json to an Excel file C:\temp\file.xlsx.

### EXAMPLE 3

ConvertTo-Excel -FullName C:\temp\file.xml -WorksheetName "Data"
Converts the XML file C:\temp\file.xml to an Excel file C:\temp\file.xlsx with a worksheet named "Data".

## PARAMETERS

### -FullName

The full path to the source file.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -WorksheetName

The name of the worksheet to create in the Excel file.
Default is "Sheet1".

```yaml
Type: System.String
DefaultValue: Sheet1
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

### System.String

{{ Fill in the Description }}

## OUTPUTS

### System.String

{{ Fill in the Description }}

## NOTES

Requires the ImportExcel module.


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Excel.md)
