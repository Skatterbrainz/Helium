---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Edit-ExcelWorkbookText.md
schema: 2.0.0
---

# Edit-ExcelWorkbookText

## SYNOPSIS
Find and Replace text a string pattern within XLSX files in a given location

## SYNTAX

```
Edit-ExcelWorkbookText [[-Path] <String>] [[-SearchPattern] <String>] [[-ReplaceWith] <String>] [-Apply]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Search all XLSX workbook files for matching text string and replace with a new text string.

## EXAMPLES

### EXAMPLE 1
```
Edit-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543" -ReplaceWith "Server9022" -Apply
```

Replaces instances of "Server543" with "Server9022" within any cells on any sheets of workbooks in 
the path \\\\server123\docs.
Saves changes back to workbooks.

### EXAMPLE 2
```
Edit-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543" -ReplaceWith "Server9022" -NoRecurse -Apply
```

Searches for instances of "Server543" within any cells on any sheets of workbooks in 
the path \\\\server123\docs, but no subfolders, and save to CSV file.
Saves changes back to workbooks.

### EXAMPLE 3
```
$results = Edit-ExcelWorkbookText -Path "\\server123\docs" -SearchPattern "Server543" -ReplaceWith "Server9022"
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
Default value: $($env:HOME)\Documents
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

### -ReplaceWith
Text string to insert in place of \[SearchPattern\] text string

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Apply
Confirm saving changes to workbooks

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Edit-ExcelWorkbookText.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Edit-ExcelWorkbookText.md)

