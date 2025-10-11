---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: ''
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Import-CsvCompact
---

# Import-CsvCompact

## SYNOPSIS

Imports a CSV file and converts headers to camel case, optionally substituting spaces with a specified string.

## SYNTAX

### __AllParameterSets

```
Import-CsvCompact [-Path] <string> [-LiteralPath <string>] [-Delimiter <string>]
 [-SubstituteForSpace <string>] [-Header <string>] [-Encoding <string>] [-UseCulture]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function imports a CSV file using the Import-Csv cmdlet and processes the headers to convert them to camel case.
It also allows for an optional substitution string to replace spaces in the headers.

## EXAMPLES

### EXAMPLE 1

Import-CsvCompact -Path "data.csv" -SubstituteForSpace "_"

Imports the CSV file "data.csv" and converts headers to camel case, replacing spaces with underscores.

### EXAMPLE 2

Import-CsvCompact -Path "data.csv" -Delimiter ";"

Imports the CSV file "data.csv" using a semicolon as the delimiter and converts headers to camel case.

### EXAMPLE 3

Import-CsvCompact -LiteralPath "C:\data files\data.csv" -UseCulture

Imports the CSV file located at "C:\data files\data.csv" using the current culture settings and converts headers to camel case.

## PARAMETERS

### -Delimiter

The character that separates the values in the CSV file.
Default is a comma (,).

```yaml
Type: System.String
DefaultValue: ','
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

### -Encoding

The encoding for the CSV file.
Default is 'utf8'.

```yaml
Type: System.String
DefaultValue: utf8
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

### -Header

An array of strings that specifies the column headers for the CSV file.

```yaml
Type: System.String
DefaultValue: ''
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

### -LiteralPath

Specifies a path to the CSV file that is used exactly as it is typed.
Notation characters are interpreted.

```yaml
Type: System.String
DefaultValue: ''
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

The path to the CSV file to import.

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

### -SubstituteForSpace

A string to substitute for spaces in the headers.
Default is an empty string.

```yaml
Type: System.String
DefaultValue: ''
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

### -UseCulture

Indicates that the cmdlet uses the current culture settings to interpret the CSV file.

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

### System.Management.Automation.PSObject

{{ Fill in the Description }}

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

