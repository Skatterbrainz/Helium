---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-CustomizeWindows11.md
schema: 2.0.0
---

# Invoke-CustomizeWindows11

## SYNOPSIS
View or Toggle Windows 11 Customization Settings

## SYNTAX

```
Invoke-CustomizeWindows11 [-Toggle] [<CommonParameters>]
```

## DESCRIPTION
View or Toggle Windows 11 Customization Settings using the PowerShell module CustomizeWindows11 by Jaap Brasser

## EXAMPLES

### EXAMPLE 1
```
Invoke-CustomizeWindows11
```

Displays current settings

### EXAMPLE 2
```
Invoke-CustomizeWindows11 -Toggle
```

Displays current settings in a GridView.
When a setting is selected and the OK button
is clicked,the setting is toggled to the opposite value.

## PARAMETERS

### -Toggle
Toggle the current value (if Enabled, set to Disabled)
Note that if a setting is not yet defined in the Registry, it shows as ----

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires module CustomizeWindows11 by Jaap Brasser, which also indicates this function
has only been tested on Windows 11.

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-CustomizeWindows11.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Invoke-CustomizeWindows11.md)

