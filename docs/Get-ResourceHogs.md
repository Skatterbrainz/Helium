---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ResourceHogs.md
schema: 2.0.0
---

# Get-ResourceHogs

## SYNOPSIS
Show Windows processes using the most resources

## SYNTAX

```
Get-ResourceHogs [[-Metric] <String>] [[-Top] <Int32>] [-ShowPath] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Show Windows processes using the most resources by selected properties/metrics

## EXAMPLES

### EXAMPLE 1
```
Get-ResourceHog
```

### EXAMPLE 2
```
Get-ResourceHog -Metric WorkingSet
```

### EXAMPLE 3
```
Get-ResourceHog -Metric HandleCount -Top 5 ShowPath
```

## PARAMETERS

### -Metric
The process property to sort by.
Default is CPU

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: CPU
Accept pipeline input: False
Accept wildcard characters: False
```

### -Top
Limit the output to the first \[Top\] items, sorted in descending order (most to least)

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowPath
Include process Path property in output.

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ResourceHogs.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ResourceHogs.md)

