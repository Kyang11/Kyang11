Import-Module ActiveDirectory

# Import users from csv file

Import-Csv C:\temp\SpecialPasswords.csv |

ForEach-Object {

$samAccountName = $_."samAccountName"

$newPassword = $_."Password"

# Reset user Password.

Set-ADAccountPassword -Identity $samAccountName -Reset -NewPassword ((ConvertTo-SecureString -AsPlainText "$newPassword" -Force))

# force user to reset passwod at next logon

Set-ADUser -Identity $samAccountName -ChangePasswordAtLogon $true

Write-Host " Active Directory account Password has been reset for: " $samAccountName

}