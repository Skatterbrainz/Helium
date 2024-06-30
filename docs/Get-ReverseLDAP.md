---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ReverseLDAP.md
schema: 2.0.0
---

# Get-ReverseLDAP

## SYNOPSIS
Reverse LDAP path string to Domain\OU format

## SYNTAX

```
Get-ReverseLDAP [-Path] <String> [-RelativePath] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Reverse LDAP distinguishedName format order to result in a Domain\OU ordered
string value.

## EXAMPLES

### EXAMPLE 1
```
Get-ReverseLDAP -Path "CN=SmithJ,OU=Users,OU=Sales,OU=Departments,OU=CORP,DC=contoso,DC=local"
```

Returns: contoso.local\CORP\Departments\Sales\Users\SmithJ

### EXAMPLE 2
```
Get-ReverseLDAP -Path "CN=SmithJ,OU=Users,OU=Sales,OU=Departments,OU=CORP,DC=contoso,DC=local" -RelativePath
```

Returns: CORP\Departments\Sales\Users\SmithJ

## PARAMETERS

### -Path
LDAP path or DistinguishedName

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RelativePath
Optional.
If present, excludes the DC portions of the path string.
See Example 2

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ReverseLDAP.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ReverseLDAP.md)

