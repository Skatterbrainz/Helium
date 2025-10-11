---
document type: cmdlet
external help file: helium-Help.xml
HelpUri: https://github.com/Skatterbrainz/helium/blob/master/docs/Write-WindowsEvent.md
Locale: en-US
Module Name: helium
ms.date: 10/09/2025
PlatyPS schema version: 2024-05-01
title: Write-WindowsEvent
---

# Write-WindowsEvent

## SYNOPSIS

Workaround for Write-EventLog where -Source often pisses me off

## SYNTAX

### __AllParameterSets

```
Write-WindowsEvent [[-LogName] <string>] [[-EventID] <int>] [[-Category] <int>]
 [[-Severity] <string>] [-Source] <string> [-Message] <string> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Workaround for Write-EventLog where -Source often pisses me off

## EXAMPLES

### EXAMPLE 1

Write-WindowsEvent -EventID 101 -Source "SCORCH" -Message "Runbook FUBAR-TARFU state: Stopped" -Severity "Warning"

## PARAMETERS

### -Category

I really don't care about Category, but it's whatever you want (within allowances)

```yaml
Type: System.Int32
DefaultValue: 1
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

### -EventID

You guessed it: The event ID number.
The default is 1.
The value must be within the
range of 1 to 16,384.

```yaml
Type: System.Int32
DefaultValue: 1
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

### -LogName

For now: System or Application.
That's it.
I'm cheap.

```yaml
Type: System.String
DefaultValue: Application
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

### -Message

Say something.
I don't care.
You can say 'Hello world!' if it makes you happy.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 5
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Severity

For now: Information,Warning or Error.
The default is Information

```yaml
Type: System.String
DefaultValue: Information
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 3
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Source

And now, for the main event: The event source name.
The docs (as of 3/27/2023) show examples that
clearly imply you can provide any custom name you desire.
They show "MyApp".
But if you try that
you'll get punched in the face with an annoying message something like:

```Write-EventLog : The source name "MyApp" does not exist on computer "localhost"```

* So I inserted my bite guard and strapped on the head gear and took the face hit for you.
* Source: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/write-eventlog?view=powershell-5.1

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 4
  IsRequired: true
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

I mean,seriously, are they too busy? More things to rename to Defender something something? Stuffing ChatGPT into something?


## RELATED LINKS

- [](https://github.com/Skatterbrainz/helium/blob/master/docs/Write-WindowsEvent.md)
