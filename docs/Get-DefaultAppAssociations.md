---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-DefaultAppAssociations.md
schema: 2.0.0
---

# Get-DefaultAppAssociations

## SYNOPSIS
Get Windows default app associations table

## SYNTAX

```
Get-DefaultAppAssociations [[-FilePath] <String>] [[-RefreshDays] <Int32>] [-Force]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Returns default app associations for the current user, saves to a file, and reuses the file for a specified number of days.

## EXAMPLES

### EXAMPLE 1
```
Get-DefaultAppAssociations
```

### EXAMPLE 2
```
Get-DefaultAppAssociations -Force
```

## PARAMETERS

### -FilePath
Path where export file is saved/maintained.
Default path is user Documents path.
Default filename is defaultapps.xml.
For example: $($env:USERPROFILE)\Documents\defaultapps.xml

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: "$($env:HOME)\documents\defaultapps.xml"
Accept pipeline input: False
Accept wildcard characters: False
```

### -RefreshDays
Number of days to reuse export file until forcing a refresh.
The default value is 7 (days)

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 7
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Force a refresh of the export file

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-DefaultAppAssociations.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-DefaultAppAssociations.md)

