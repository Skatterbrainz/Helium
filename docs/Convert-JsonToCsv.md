---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Convert-JsonToCsv.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Convert-JsonToCsv
---

# Convert-JsonToCsv

## SYNOPSIS

Convert a JSON file to CSV format

## SYNTAX

### __AllParameterSets

```
Convert-JsonToCsv [-Path] <string> [[-OutputFile] <string>] [-TranslateFileName]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Convert a JSON file to CSV format file.

## EXAMPLES

### EXAMPLE 1

Convert-JsonToCsv -Path "c:\temp\myfile.json"

Exports the CSV file "c:\temp\myfile.csv"

### EXAMPLE 2

Get-ChildItem -Path "c:\temp" -Filter "*.json" | Select FullName | Convert-JsonToCsv

Exports each JSON file in the path "c:\temp" to a new CSV file with the same filename and in the same folder path

### EXAMPLE 3

Convert-JsonToCsv -Path "c:\temp\myfile.json" -OutputFile "f:\docs\newfile.csv"

Exports the JSON file to a different path and CSV filename.

### EXAMPLE 4

Convert-JsonToCsv -Path "c:\temp\myfile.json" -TranslateFileName

Exports the JSON file to c:\temp\myfile.csv

## PARAMETERS

### -OutputFile

Path and name of CSV output file.
The default is to use the same path and filename replacing the file extension with .csv

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

Path and name of JSON file.

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

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Convert-JsonToCsv.md)
