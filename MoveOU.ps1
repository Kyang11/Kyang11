# Import AD Module
import-module ActiveDirectory

# Import CSV 
$MoveList = Import-Csv -Path "C:\Temp\MoveADUsersOU.csv"
# Specify target OU.This is where users will be moved.
$TargetOU =  "OU=SOA 03 - LARA, OU=Users,OU=Hampton - VAN034,OU=VA,OU=Sites,DC=MAXCORP,DC=MAXIMUS"
# Import the data from CSV file and assign it to variable 
$Imported_csv = Import-Csv -Path "C:\temp\MoveADUsersOU.csv" 

$Imported_csv | ForEach-Object {
     # Retrieve DN of User.
     $UserDN  = (Get-ADUser -Identity $_.samAccountName).distinguishedName
     Write-Host " Moving Accounts: "$samAccountName
     # Move user to target OU.
     Move-ADObject  -Identity $UserDN  -TargetPath $TargetOU
     
 }
 Write-Host " Completed Move " 
 $total = ($MoveList).count
 Write-Host "Total Amount of Users Moved: "$total
 Write-Host "Accounts have been moved succesfully..."
 
 