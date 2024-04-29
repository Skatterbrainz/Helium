---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Write-WindowsEvent.md
schema: 2.0.0
---

# Write-WindowsEvent

## SYNOPSIS
Workaround for Write-EventLog where -Source often pisses me off

## SYNTAX

```
Write-WindowsEvent [[-LogName] <String>] [[-EventID] <Int32>] [[-Category] <Int32>] [[-Severity] <String>]
 [-Source] <String> [-Message] <String> [<CommonParameters>]
```

## DESCRIPTION
Workaround for Write-EventLog where -Source often pisses me off

## EXAMPLES

### EXAMPLE 1
```
Write-WindowsEvent -EventID 101 -Source "SCORCH" -Message "Runbook FUBAR-TARFU state: Stopped" -Severity "Warning"
```

## PARAMETERS

### -LogName
For now: System or Application.
That's it.
I'm cheap.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Application
Accept pipeline input: False
Accept wildcard characters: False
```

### -EventID
You guessed it: The event ID number.
The default is 1.
The value must be within the
range of 1 to 16,384.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category
I really don't care about Category, but it's whatever you want (within allowances)

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -Severity
For now: Information,Warning or Error.
The default is Information

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Information
Accept pipeline input: False
Accept wildcard characters: False
```

### -Source
And now, for the main event: The event source name.
The docs (as of 3/27/2023) show examples that
clearly imply you can provide any custom name you desire.
They show "MyApp".
But if you try that
you'll get punched in the face with an annoying message something like:

\`\`\`Write-EventLog : The source name "MyApp" does not exist on computer "localhost"\`\`\`

* So I inserted my bite guard and strapped on the head gear and took the face hit for you.
* Source: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/write-eventlog?view=powershell-5.1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Message
Say something.
I don't care.
You can say 'Hello world!' if it makes you happy.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
I mean,seriously, are they too busy?
More things to rename to Defender something something?
Stuffing ChatGPT into something?

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Write-WindowsEvent.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Write-WindowsEvent.md)

