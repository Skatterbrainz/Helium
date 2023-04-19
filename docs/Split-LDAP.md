---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Split-LDAP.md
schema: 2.0.0
---

# Split-LDAP

## SYNOPSIS
Split LDAP path string

## SYNTAX

```
Split-LDAP [-Path] <String> [[-Delimiter] <String>] [[-Part] <String>] [<CommonParameters>]
```

## DESCRIPTION
Split LDAP path string like Split-Path, to return the root path of
and LDAP object DistinguishedName, or the Domain suffix portion.

## EXAMPLES

### EXAMPLE 1
```
$p1 = "CN=JSmith,CN=Users,DC=east,DC=contoso,DC=local"
Split-LDAP $p1
Returns "CN-Users,DC=east,DC=contoso,DC=local"
```

### EXAMPLE 2
```
$p1 = "CN=JSmith,CN=Users,DC=east,DC=contoso,DC=local"
Split-LDAP $p1 -Part Domain
Returns "DC=east,DC=contoso,DC=local"
```

### EXAMPLE 3
```
"CN=JSmith,CN=Users,DC=east,DC=contoso,DC=local" | Split-LDAP
Applies the split using pipeline input to return:
"CN=Users,DC=east,DC=contoso,DC=local"
```

## PARAMETERS

### -Path
The LDAP object DistinguishedName

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Delimiter
The character to apply the split upon.
The defaul is a comma (,)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: ,
Accept pipeline input: False
Accept wildcard characters: False
```

### -Part
* Parent = return the root path portion
* Domain = return the domain suffix portion

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Parent
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/Skatterbrainz/helium/blob/master/docs/Split-LDAP.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Split-LDAP.md)

