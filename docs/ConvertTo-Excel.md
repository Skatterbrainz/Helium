---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Excel.md
schema: 2.0.0
---

# ConvertTo-Excel

## SYNOPSIS
Converts a CSV, JSON, or XML file to an Excel file.

## SYNTAX

```
ConvertTo-Excel [-FullName] <String> [[-WorksheetName] <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Converts a CSV, JSON, or XML file to an Excel file.
The output file will have the same name as the source file, but with an .xlsx extension.

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-Excel -FullName C:\temp\file.csv
Converts the CSV file C:\temp\file.csv to an Excel file C:\temp\file.xlsx.
```

### EXAMPLE 2
```
Get-Item -Path "c:\temp\file.json" | ConvertTo-Excel
Converts the JSON file C:\temp\file.json to an Excel file C:\temp\file.xlsx.
```

### EXAMPLE 3
```
ConvertTo-Excel -FullName C:\temp\file.xml -WorksheetName "Data"
Converts the XML file C:\temp\file.xml to an Excel file C:\temp\file.xlsx with a worksheet named "Data".
```

## PARAMETERS

### -FullName
The full path to the source file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -WorksheetName
The name of the worksheet to create in the Excel file.
Default is "Sheet1".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Sheet1
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String
## NOTES
Requires the ImportExcel module.

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Excel.md](https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertTo-Excel.md)

