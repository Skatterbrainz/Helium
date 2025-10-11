---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Clear-IISLogs.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Clear-IISLogs
---

# Clear-IISLogs

## SYNOPSIS

Remove IIS log files older than a specified number of days

## SYNTAX

### __AllParameterSets

```
Clear-IISLogs [[-LogPath] <string>] [[-DaysToKeep] <int>] [[-TransactionLog] <string>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Remove IIS log files older than a specified number of days

## EXAMPLES

### EXAMPLE 1

Clear-IISLogs -LogPath "c:\inetpub\logs" -DaysToKeep 30 -TransactionLog "c:\windows\temp\cleanup_old_iislogs.log"
Remove IIS log files older than 30 days from c:\inetpub\logs and log the transaction to c:\windows\temp\cleanup_old_iislogs.log

### EXAMPLE 2

Clear-IISLogs
Remove IIS log files older than 30 days from c:\inetpub\logs and log the transaction to c:\windows\temp\cleanup_old_iislogs.logs

## PARAMETERS

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases:
- cf
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DaysToKeep

How many days of log files to retain.
Default is 30 days.

```yaml
Type: System.Int32
DefaultValue: 30
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -LogPath

IIS log folder path.
Default is "c:\inetpub\logs"

```yaml
Type: System.String
DefaultValue: c:\inetpub\logs
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -TransactionLog

Output transaction log.
Default is "c:\windows\temp\cleanup_old_iislogs.log"

```yaml
Type: System.String
DefaultValue: c:\windows\temp\cleanup_old_iislogs.log
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -WhatIf

Runs the command in a mode that only reports what would happen without performing the actions.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases:
- wi
ParameterSets:
- Name: (All)
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Clear-IISLogs.md)
