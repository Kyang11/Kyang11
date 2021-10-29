$user = "2_282722"

Get-ADPrincipalGroupMembership $user | Select name
(Get-ADUser $user).DistinguishedName