Import-module ActiveDirectory

$Creds = Get-Credential

#Import List
$userList = Import-Csv C:\Temp\RemoveSg.csv


Write-Host " Have a seat, lets begin!  "


foreach($user in $userList) 

{
    
    #Other SG's
    Remove-ADGroupMember -Identity "SG - WSC - CDC-info BYOL West" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WSC - CDC-info BYOL East" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WSC - CDC-Info East" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - VDI - CDC-Info" -Member $user -Confirm:$false
    
  
 
    Write-Host " Deprovisioning Account: "$user.samaccountname "
}

     
    
  


 
 Write-Host " Done Deprovisioning " 
 $total = ($userList).count
 Write-Host "Total Amount of Accounts Checked: "$total"}