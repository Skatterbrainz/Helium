---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Test-RebootPending.md
schema: 2.0.0
---

# Test-RebootPending

## SYNOPSIS
Return true if a reboot is pending (local machine)

## SYNTAX

```
Test-RebootPending [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Return true if a reboot is pending (local machine)

## EXAMPLES

### EXAMPLE 1
```
if (Test-DsRebootPending) { ... }
```

## PARAMETERS

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

### True or False
## NOTES
Thanks to https://4sysops.com/archives/use-powershell-to-test-if-a-windows-server-is-pending-a-reboot/

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Test-RebootPending.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Test-RebootPending.md)

