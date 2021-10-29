# Written by Steven Billig

Import-Module ActiveDirectory

$CSV = Import-Csv -Path 'C:\Temp\Remove_Users_SGs.csv'
$Credentials = Get-Credential

Write-Host "Updating CSV File..."
foreach ($User in $CSV) {
    Write-Host "Removing $User.Username from $User.SecurityGroup..."
    Remove-ADGroupMember -Identity $User.SecurityGroup -Members $User.Username -Confirm:$false -Credential $Credentials
}