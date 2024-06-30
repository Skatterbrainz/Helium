---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Confirm-Modules.md
schema: 2.0.0
---

# Confirm-Modules

## SYNOPSIS
Check if installed modules are up to date

## SYNTAX

```
Confirm-Modules [-Update] [[-Exclude] <String[]>] [[-ExcludePattern] <String[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Check installed modules against PowerShell Gallery to confirm they
are current version.
If not, optionally, update them to current.

## EXAMPLES

### EXAMPLE 1
```
Confirm-Modules
```

Checks modules to report current version status: Current, OutOfDate or LocalOnly.

### EXAMPLE 2
```
Confirm-Modules -Update
```

Checks module versions and updates those which report status OutOfDate.

### EXAMPLE 3
```
Confirm-Modules -Exclude MyModule,OtherModule -Update
```

Checks all modules except for MyModule and OtherModule and updates the rest if they
report status OutOfDate.

### EXAMPLE 4
```
Confirm-Modules -Exclude MyModule,OtherModule -ExcludePattern Microsoft.Graph.* -Update
```

Checks all modules except for MyModule and OtherModule and any with names that start
with "Microsoft.Graph." and updates the rest if they report status OutOfDate.

### EXAMPLE 5
```
Confirm-Modules -Exclude Az -ExcludePattern Az.*,Microsoft.Graph.* -Update
```

Checks all modules except for Az and any with names that start
with "Az." or "Microsoft.Graph." and updates the rest if they report status OutOfDate.

## PARAMETERS

### -Update
Update modules which are not the latest version.

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

### -Exclude
Names of modules to ignore.
Note that local-only modules (not installed from, or available
within the PowerShell Gallery) are ignored as well.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludePattern
One or more wildcard patterns to filter out module names to exclude them from validation.
Example: Microsoft.Graph.* or Az.*, Microsoft.Graph.*

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Confirm-Modules.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Confirm-Modules.md)

