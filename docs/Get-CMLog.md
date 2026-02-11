---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: http://blog.richprescott.com
Locale: en-US
Module Name: helium
ms.date: 02/11/2026
PlatyPS schema version: 2024-05-01
title: Get-CMLog
---

# Get-CMLog

## SYNOPSIS

Parses logs for System Center Configuration Manager.

## SYNTAX

### __AllParameterSets

```
Get-CMLog [-Path] <Object> [-tail <Object>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Accepts a single log file or array of log files and parses them into objects.
Shows both UTC and local time for troubleshooting across time zones.

## EXAMPLES

### EXAMPLE 1

Get-CMLog -Path Sample.log
Converts each log line in Sample.log into objects
	UTCTime   : 7/15/2013 3:28:08 PM
	LocalTime : 7/15/2013 2:28:08 PM
	FileName  : sample.log
	Component : TSPxe
	Context   : 
	Type      : 3
	TID       : 1040
	Reference : libsmsmessaging.cpp:9281
	Message   : content location request failed

### EXAMPLE 2

Get-ChildItem -Path C:\Windows\CCM\Logs | Select-String -Pattern 'failed' | Select -Unique Path | Get-CMLog
Find all log files in folder, create a unique list of files containing the phrase 'failed, and convert the logs into objects
	UTCTime   : 7/15/2013 3:28:08 PM
	LocalTime : 7/15/2013 2:28:08 PM
	FileName  : sample.log
	Component : TSPxe
	Context   : 
	Type      : 3
	TID       : 1040
	Reference : libsmsmessaging.cpp:9281
	Message   : content location request failed

## PARAMETERS

### -Path

Specifies the path to a log file or files.

```yaml
Type: System.Object
DefaultValue: ''
SupportsWildcards: false
Aliases:
- FullName
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -tail

{{ Fill tail Description }}

```yaml
Type: System.Object
DefaultValue: 10
SupportsWildcards: false
Aliases: []
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

### Path/FullName.

{{ Fill in the Description }}

### System.Object

{{ Fill in the Description }}

## OUTPUTS

### PSCustomObject.

{{ Fill in the Description }}

## NOTES

## RELATED LINKS

- [](http://blog.richprescott.com)
