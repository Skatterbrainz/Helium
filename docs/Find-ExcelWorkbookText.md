---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Find-ExcelWorkbookText.md
schema: 2.0.0
---

# Find-ExcelWorkbookText

## SYNOPSIS
Find text string pattern within XLSX files in a given location

## SYNTAX

```
Find-ExcelWorkbookText [[-Path] <String>] [[-SearchPattern] <String>] [-SaveFile] [-NoRecurse]
 [[-OutputFile] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Search all XLSX workbook files for matching text string and return
information about the workbook, worksheet, matching value, and location

## EXAMPLES

### EXAMPLE 1
```
.\Find-ExcelWorkbookText.ps1 -Path "\\server123\docs" -SearchPattern "Server543" -SaveFile
```

Searches for instances of "Server543" within any cells on any sheets of workbooks in 
the path \\\\server123\docs, and save to CSV file.

### EXAMPLE 2
```
Find-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543" -SaveFile -NoRecurse
```

Searches for instances of "Server543" within any cells on any sheets of workbooks in 
the path \\\\server123\docs, but no subfolders, and save to CSV file.

### EXAMPLE 3
```
$results = Find-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543"
$results | Group-Object Workbook | Select-Object Count,Name
```

Returns counts of matching instances by workbook filename

## PARAMETERS

### -Path
Path (folder) where .XLSX files reside

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchPattern
Text string to search for

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

### -SaveFile
Save output to CSV file

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

### -NoRecurse
Scan xlsx files in Path location only, do not scan into subfolders

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
CSV output path+filename

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: "$($env:HOME)\Documents\excel_search_$(Get-Date -f 'yyyyMMddhhmm').csv"
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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Find-ExcelWorkbookText.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Find-ExcelWorkbookText.md)

