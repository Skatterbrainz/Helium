---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-PsResourceMaintenance.md
schema: 2.0.0
---

# Invoke-PsResourceMaintenance

## SYNOPSIS
Checks for updates to installed PowerShell modules and optionally updates them.

## SYNTAX

```
Invoke-PsResourceMaintenance [-UpdateAll] [-Quiet] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function checks all installed PowerShell modules for updates and can optionally update them.

## EXAMPLES

### EXAMPLE 1
```
Invoke-PsResourceMaintenance -UpdateAll
Updates all installed PowerShell modules to their latest versions.
```

### EXAMPLE 2
```
Invoke-PsResourceMaintenance -Quiet
Checks for updates to installed PowerShell modules without displaying output messages.
```

## PARAMETERS

### -UpdateAll
Updates all installed modules without prompting for confirmation.

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

### -Quiet
Suppresses output messages.

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-PsResourceMaintenance.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-PsResourceMaintenance.md)

