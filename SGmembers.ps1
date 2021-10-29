$Groups = Cat C:\temp\SGmembers.txt
$output = Foreach($group in $groups)
{

Write-output "Below are the members of $group : n"

Get-ADgroupMember $group | select name,samaccountname

Write-Output "================="
}

$output | Out-File c:\temp\SGmembers.csv