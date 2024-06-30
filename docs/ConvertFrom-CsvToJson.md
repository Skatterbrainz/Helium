---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-CsvToJson.md
schema: 2.0.0
---

# ConvertFrom-CsvToJson

## SYNOPSIS
Convert a CSV file to JSON format

## SYNTAX

```
ConvertFrom-CsvToJson [-Path] <String> [-TranslateFileName] [[-OutputFile] <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Convert a CSV file to JSON format file.

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-CsvToJson -Path "c:\temp\myfile.csv"
```

Exports the CSV file "c:\temp\myfile.csv"

### EXAMPLE 2
```
Get-ChildItem -Path "c:\temp" -Filter "*.csv" | Select FullName | ConvertFrom-CsvToJson
```

Exports each CSV file in the path "c:\temp" to a new JSON file with the same filename and in the same folder path

### EXAMPLE 3
```
ConvertFrom-CsvToJson -Path "c:\temp\myfile.csv" -OutputFile "f:\docs\newfile.json"
```

Exports the CSV file to a different path and JSON filename.

### EXAMPLE 4
```
ConvertFrom-CsvToJson -Path "c:\temp\myfile.csv" -TranslateFileName
```

Exports the JSON file to c:\temp\myfile.json

## PARAMETERS

### -Path
Path and name of CSV file.

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
Path and name of JSON output file.
The default is to use the same path and filename replacing the file extension with .json

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

## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-CsvToJson.md](https://github.com/Skatterbrainz/helium/blob/master/docs/ConvertFrom-CsvToJson.md)

