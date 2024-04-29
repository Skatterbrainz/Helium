---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Split-File.md
schema: 2.0.0
---

# Split-File

## SYNOPSIS
Split a CSV or XLSX file based on values in a column

## SYNTAX

```
Split-File [-Path] <String> [-KeyColumn] <String> [[-KeyValues] <String[]>] [[-WorksheetName] <String>]
 [[-OutputFolder] <String>] [<CommonParameters>]
```

## DESCRIPTION
Split a CSV or XLSX file into one or more separate files based on values
in a column.
For example, if file named "Employees.xlsx" has a column named 'EmployeeType' contains values
like 'EMP', 'CWR', 'TMP', this will create 3 new files based on the rows which have those corresponding values.
In this case, the three new files would be "Employees_EMP.xlsx", "Employees_CWR.xlsx" and "Employees_TMP.xlsx".
Each file would contain only the matching rows in the source file which have the corresponding value.

## EXAMPLES

### EXAMPLE 1
```
Split-File -Path "c:\temp\employees.xlsx" -WorksheetName "EmpData" -KeyColumn "EmpType" -KeyValues ("EMP","CWR")
```

Creates c:\temp\employees_EMP.xlsx and c:\temp\employees_CWR.xlsx, if there are rows found
where the "EmpType" column contains either "EMP" or "CWR". 
Rows with other values are ignored.

### EXAMPLE 2
```
Split-File -Path "c:\temp\products.csv" -KeyColumn "category" -OutputFolder c:\temp\files
```

Creates one file for each unique value in the "category" column, and saves each new file to c:\temp\files
with prefix "products_\<value\>.csv" where \<value\> is each unique value in "category".

## PARAMETERS

### -Path
File to be parsed.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -KeyColumn
Name of column which will be analyzed.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -KeyValues
One or more values which will be used to parse out matching rows to separate files.
If this parameter is blank (default) all unique values in the KeyColumn set will be
used to determine the resulting set of output files.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WorksheetName
Optional.
For XLSX files only, identifies the tab (worksheet) to parse.
This setting has no effect when used with CSV files.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Sheet1
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutputFolder
Optional.
Path where new files are to be created.
The default is the same path as the source file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Excel XLSX files require the PowerShell module ImportExcel

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Split-File.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Split-File.md)

