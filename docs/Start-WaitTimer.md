---
external help file: helium-help.xml
Module Name: helium
online version:
schema: 2.0.0
---

# Start-WaitTimer

## SYNOPSIS
Displays a progress bar while waiting for a specified amount of time.

## SYNTAX

```
Start-WaitTimer [[-TotalTime] <Int32>] [[-Increment] <Int32>] [[-Message] <String>] [-NoProgress]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Displays a progress bar while waiting for a specified amount of time.

## EXAMPLES

### EXAMPLE 1
```
Start-WaitTimer
Displays a progress bar for 5 minutes with "Waiting..." as the message
```

### EXAMPLE 2
```
Start-WaitTimer -TotalTime 600 -Increment 10
Displays a progress bar for 10 minutes.
```

### EXAMPLE 3
```
Start-WaitTimer -TotalTime 300 -Increment 5 -NoProgress
Displays a simple message for 5 minutes.
```

### EXAMPLE 4
```
Start-WaitTimer -TotalTime 300 -Increment 5 -Message "Downloading"
Displays a progress bar with a custom message for 5 minutes.
```

## PARAMETERS

### -TotalTime
The total amount of time to wait in seconds.
Default is 300 seconds (5 minutes).

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 300
Accept pipeline input: False
Accept wildcard characters: False
```

### -Increment
The amount of time to wait between progress updates in seconds.
Default is 5 seconds.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 5
Accept pipeline input: False
Accept wildcard characters: False
```

### -Message
The message to display while waiting.
Default is "Waiting".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Waiting
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoProgress
Suppresses the progress bar and displays a simple message instead.
Useful when running in a non-interactive environment.
This parameter is ignored on Linux.

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
