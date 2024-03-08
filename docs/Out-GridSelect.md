---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Out-GridSelect.md
schema: 2.0.0
---

# Out-GridSelect

## SYNOPSIS
Use GridView or ConsoleGridView to provide a selection menu

## SYNTAX

```
Out-GridSelect [-InputObject] <Object> [[-Title] <String>] [[-OutputMode] <String>] [-ForceConsole]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Use a GridView or ConsoleGridView to provide a selection menu interface for selecting either
single or multiple items.
On Linux this will only invoke a ConsoleGridView.
For Windows, it 
will default to a GridView unless -ForceConsole is used.

## EXAMPLES

### EXAMPLE 1
```
Get-Process | Out-GridSelect
```

### EXAMPLE 2
```
Get-Process | Out-GridSelect -Title "Select Processes" -OutputMode Multiple
```

## PARAMETERS

### -InputObject
An array of objects.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
Title to display on the gridview heading (caption).
If not provided will display "Select Item"
or "Select Items"

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

### -OutputMode
Optional.
Single (Default) or Multiple.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Single
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceConsole
Optional.
On Windows machines, forces ConsoleGridView

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
The Microsoft.PowerShell.ConsoleGuiTools module is required on Linux, or when using -ForceConsole.
I had some challenges with getting this function to accept pipeline input, mostly because I'm too
stupid to figure it out and I need to cut down my coffee consumption.
If you want to show me how to
make that work please submit a pull request and I'll gladly plaster your name all over it for credit.

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Out-GridSelect.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Out-GridSelect.md)

