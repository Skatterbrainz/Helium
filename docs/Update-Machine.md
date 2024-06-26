---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Update-Machine.md
schema: 2.0.0
---

# Update-Machine

## SYNOPSIS
Run Windows system maintenance tasks

## SYNTAX

```
Update-Machine [-WindowsUpdate] [-Chocolatey] [-Winget] [-Modules] [[-ModuleNames] <String>] [-Help] [-Linux]
 [-ShowConfirmation] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Run Windows system maintenance tasks suchas Windows Updates, updating
Chocolatey and Winget packages, PowerShell modules, PowerShell help files
and optionally display a confirmation toast popup.

## EXAMPLES

### EXAMPLE 1
```
Update-Machine -WindowsUpdate
```

### EXAMPLE 2
```
Update-Machine -WindowsUpdate -Chocolatey -Winget -Modules -Help -ShowConfirmation
```

## PARAMETERS

### -WindowsUpdate
Check for and install Windows updates

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

### -Chocolatey
Update Chocolatey packages.
If Chocolatey is installed.

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

### -Winget
Update Winget packages.
If Winget is installed.

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

### -Modules
Update PowerShell modules.

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

### -ModuleNames
{{ Fill ModuleNames Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: PowerShellAI,importexcel,carbon,dbatools,helium
Accept pipeline input: False
Accept wildcard characters: False
```

### -Help
Update PowerShell help files.
If invoked without administrator context, this will
only update help content under the CurrentUser scope (PS 6.1 or later)

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

### -Linux
Optional.
On Linux machines, invokes apt-get with update and full-upgrade options, as well as flatpak

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

### -ShowConfirmation
{{ Fill ShowConfirmation Description }}

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Update-Machine.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Update-Machine.md)

