---
external help file: helium-help.xml
Module Name: helium
online version: https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ReverseDistinguishedName.md
schema: 2.0.0
---

# Get-ReverseDistinguishedName

## SYNOPSIS
Reverse an LDAP DistinguishedName into ADSI form

## SYNTAX

```
Get-ReverseDistinguishedName [-DistinguishedName] <String> [-PathOnly] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Reverse an LDAP DistinguishedName value into ADSI form so that it 
reads left-to-right Domain,Path,Name without the prefix keys (e.g.
"OU=")

## EXAMPLES

### EXAMPLE 1
```
Get-ReverseDistinguishedName "CN=TaylorS,OU=Users,OU=Sales,OU=CORP,DC=East,DC=Contoso,DC=local"
Returns: "East.Contoso.local\CORP\Sales\UsersTaylorS"
```

### EXAMPLE 2
```
Get-ReverseDistinguishedName -PathOnly "CN=TaylorS,OU=Users,OU=Sales,OU=CORP,DC=East,DC=Contoso,DC=local"
Returns: "East.Contoso.local\CORP\Sales"
```

## PARAMETERS

### -DistinguishedName
LDAP DistinguishedName value

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

### -PathOnly
Optional.
Returns domain root and path without the object name (CN= value)

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

[https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ReverseDistinguishedName.md](https://github.com/Skatterbrainz/helium/blob/master/docs/Get-ReverseDistinguishedName.md)

