---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Split-File.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Split-File
---

# Split-File

## SYNOPSIS

Split a CSV or XLSX file based on values in a column

## SYNTAX

### __AllParameterSets

```
Split-File [-Path] <string> [-KeyColumn] <string> [[-KeyValues] <string[]>]
 [[-WorksheetName] <string>] [[-OutputFolder] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Split a CSV or XLSX file into one or more separate files based on values
in a column.
For example, if file named "Employees.xlsx" has a column named 'EmployeeType' contains values
like 'EMP', 'CWR', 'TMP', this will create 3 new files based on the rows which have those corresponding values.
In this case, the three new files would be "Employees_EMP.xlsx", "Employees_CWR.xlsx" and "Employees_TMP.xlsx".
Each file would contain only the matching rows in the source file which have the corresponding value.

## EXAMPLES

### EXAMPLE 1

Split-File -Path "c:\temp\employees.xlsx" -WorksheetName "EmpData" -KeyColumn "EmpType" -KeyValues ("EMP","CWR")

Creates c:\temp\employees_EMP.xlsx and c:\temp\employees_CWR.xlsx, if there are rows found
where the "EmpType" column contains either "EMP" or "CWR".
 Rows with other values are ignored.

### EXAMPLE 2

Split-File -Path "c:\temp\products.csv" -KeyColumn "category" -OutputFolder c:\temp\files

Creates one file for each unique value in the "category" column, and saves each new file to c:\temp\files
with prefix "products_<value>.csv" where <value> is each unique value in "category".

## PARAMETERS

### -KeyColumn

Name of column which will be analyzed.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -KeyValues

One or more values which will be used to parse out matching rows to separate files.
If this parameter is blank (default) all unique values in the KeyColumn set will be
used to determine the resulting set of output files.

```yaml
Type: System.String[]
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

### -OutputFolder

Optional.
Path where new files are to be created.
The default is the same path as the source file.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 4
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Path

File to be parsed.

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

### -WorksheetName

Optional.
For XLSX files only, identifies the tab (worksheet) to parse.
This setting has no effect when used with CSV files.

```yaml
Type: System.String
DefaultValue: Sheet1
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 3
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

Excel XLSX files require the PowerShell module ImportExcel


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Split-File.md)
