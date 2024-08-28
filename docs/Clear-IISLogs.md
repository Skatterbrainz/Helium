---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Clear-IISLogs.md
schema: 2.0.0
---

# Clear-IISLogs

## SYNOPSIS
Remove IIS log files older than a specified number of days

## SYNTAX

```
Clear-IISLogs [[-LogPath] <String>] [[-DaysToKeep] <Int32>] [[-TransactionLog] <String>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Remove IIS log files older than a specified number of days

## EXAMPLES

### EXAMPLE 1
```
Clear-IISLogs -LogPath "c:\inetpub\logs" -DaysToKeep 30 -TransactionLog "c:\windows\temp\cleanup_old_iislogs.log"
Remove IIS log files older than 30 days from c:\inetpub\logs and log the transaction to c:\windows\temp\cleanup_old_iislogs.log
```

### EXAMPLE 2
```
Clear-IISLogs
Remove IIS log files older than 30 days from c:\inetpub\logs and log the transaction to c:\windows\temp\cleanup_old_iislogs.logs
```

## PARAMETERS

### -LogPath
IIS log folder path.
Default is "c:\inetpub\logs"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: C:\inetpub\logs
Accept pipeline input: False
Accept wildcard characters: False
```

### -DaysToKeep
How many days of log files to retain.
Default is 30 days.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 30
Accept pipeline input: False
Accept wildcard characters: False
```

### -TransactionLog
Output transaction log.
Default is "c:\windows\temp\cleanup_old_iislogs.log"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: C:\windows\temp\cleanup_old_iislogs.log
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Clear-IISLogs.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Clear-IISLogs.md)

