---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Syntax.md
schema: 2.0.0
---

# Get-CommandSyntax

## SYNOPSIS
Show formatted basic syntax for a function or cmdlet

## SYNTAX

```
Get-CommandSyntax [-Command] <Object> [-Normalize] [<CommonParameters>]
```

## DESCRIPTION
Show formatted basic syntax for a function or cmdlet

## EXAMPLES

### EXAMPLE 1
```
Get-CommandSyntax Get-DocRef
```

### EXAMPLE 2
```
Get-CommandSyntax Get-DocRef -Normalize
```

## PARAMETERS

### -Command
Name of command / cmdlet / function

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

### -Normalize
Displays output on 1-line.
Default is stacked view

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
Borrowed entirely from \[Brett Miller\] with very minor changes: https://github.com/brettmillerb/Toolbox

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Syntax.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-Syntax.md)

