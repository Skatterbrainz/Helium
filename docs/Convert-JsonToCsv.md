---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Convert-JsonToCsv.md
schema: 2.0.0
---

# Convert-JsonToCsv

## SYNOPSIS
Convert a JSON file to CSV format

## SYNTAX

```
Convert-JsonToCsv [-Path] <String> [-TranslateFileName] [[-OutputFile] <String>] [<CommonParameters>]
```

## DESCRIPTION
Convert a JSON file to CSV format file.

## EXAMPLES

### EXAMPLE 1
```
Convert-JsonToCsv -Path "c:\temp\myfile.json"
```

Exports the CSV file "c:\temp\myfile.csv"

### EXAMPLE 2
```
Get-ChildItem -Path "c:\temp" -Filter "*.json" | Select FullName | Convert-JsonToCsv
```

Exports each JSON file in the path "c:\temp" to a new CSV file with the same filename and in the same folder path

### EXAMPLE 3
```
Convert-JsonToCsv -Path "c:\temp\myfile.json" -OutputFile "f:\docs\newfile.csv"
```

Exports the JSON file to a different path and CSV filename.

### EXAMPLE 4
```
Convert-JsonToCsv -Path "c:\temp\myfile.json" -TranslateFileName
```

Exports the JSON file to c:\temp\myfile.csv

## PARAMETERS

### -Path
Path and name of JSON file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -TranslateFileName
Optional.
Export to file using same path and basename but use the new extension.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutputFile
Path and name of CSV output file.
The default is to use the same path and filename replacing the file extension with .csv

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Convert-JsonToCsv.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Convert-JsonToCsv.md)

