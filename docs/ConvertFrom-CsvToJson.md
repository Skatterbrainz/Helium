---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-CsvToJson.md
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: ConvertFrom-CsvToJson
---

# ConvertFrom-CsvToJson

## SYNOPSIS

Convert a CSV file to JSON format

## SYNTAX

### __AllParameterSets

```
ConvertFrom-CsvToJson [-Path] <string> [[-OutputFile] <string>] [-TranslateFileName]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Convert a CSV file to JSON format file.

## EXAMPLES

### EXAMPLE 1

ConvertFrom-CsvToJson -Path "c:\temp\myfile.csv"

Exports the CSV file "c:\temp\myfile.csv"

### EXAMPLE 2

Get-ChildItem -Path "c:\temp" -Filter "*.csv" | Select FullName | ConvertFrom-CsvToJson

Exports each CSV file in the path "c:\temp" to a new JSON file with the same filename and in the same folder path

### EXAMPLE 3

ConvertFrom-CsvToJson -Path "c:\temp\myfile.csv" -OutputFile "f:\docs\newfile.json"

Exports the CSV file to a different path and JSON filename.

### EXAMPLE 4

ConvertFrom-CsvToJson -Path "c:\temp\myfile.csv" -TranslateFileName

Exports the JSON file to c:\temp\myfile.json

## PARAMETERS

### -OutputFile

Path and name of JSON output file.
The default is to use the same path and filename replacing the file extension with .json

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

### -Path

Path and name of CSV file.

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
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -TranslateFileName

Optional.
Export to file using same path and basename but use the new extension.

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

### System.String

{{ Fill in the Description }}

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-CsvToJson.md)
