Import-module ActiveDirectory

$Creds = Get-Credential

#Import List
$userList = Import-Csv C:\Temp\SetExpire.csv
$time = Read-Host '=> Set Expiration Date'


Write-Host " Have a seat, lets begin!  "


foreach($user in $userList) 
{

    $password = Get-RandomCharacters -length 5 -characters 'abcdefghiklmnoprstuvwxyz'
        $Password += Get-RandomCharacters -length 1 -characters 'ABCDEFGHKLMNOPRSTUVWXYZ'
        $Password += Get-RandomCharacters -length 1 -characters '1234567890'
        $Password += Get-RandomCharacters -length 1 -characters '!%&?#'
        $Password = Scramble-Password $Password
      

    #Replace the date of you want
    Set-ADAccountExpiration -DateTime $time $user.samAccountName
    Set-ADUser -Identity $user.samAccountName -CannotChangePassword $True
    Set-ADAccountPassword $Userid -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $Password -Force) -Confirm:$false

    #This remove O365 license
    Remove-ADGroupMember -Identity "SG - M365 F1" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - M365 F1 with Audio Conferencing" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - M365 F1 with Conferencing and Domestic Calling" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - M365 F1 with Domestic Calling" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - M365 F3 Census Survey Workers" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - M365 E3" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - M365 E3 with Audio Conferencing" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - M365 E3 with Conferencing and Domestic Calling" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - M365 E3 with Domestic Calling" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - M365 E5" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - M365 E5 with International and Domestic Calling" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - M365 E5 with Domestic Calling" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - O365 MS Flow Free" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - O365 Project" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - O365 Visio" -Member $user.samaccountname -Confirm:$false

    #This remove AWS SG's for NCUI & CDC
    Remove-ADGroupMember -Identity "SG - VDI - Jabber" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - VDI - CDC" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - VDI - NC UI Call Center" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center Prod5 East 2CPU - 107111.01.01.01" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center Prod5 West 2CPU - 107111.01.01.01" -Member $user.samaccountname -Confirm:$false
    
    Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center West 2CPU - 107111.01.01.01" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center East 2CPU - 107111.01.01.01" -Member $user.samaccountname -Confirm:$false 
    Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center Prod6 West 2CPU - 107111.01.01.01" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center Prod6 East 2CPU - 107111.01.01.01" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center Prod7 West 2CPU - 107111.01.01.01" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center Prod7 East 2CPU - 107111.01.01.01" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - CDC ProdCMS West 2CPU - H40001.020.02" -Member $user.samaccountname -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - CDC ProdCMS East 2CPU - H40001.020.02" -Member $user.samaccountname -Confirm:$false

    #SC UI Maxcorp
    Remove-ADGroupMember -Identity "SG - VDI - SCUI" -Member $userid -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - SCUI East 2CPU - 106493.01.02.01" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - SCUI West 2CPU - 106493.01.02.01" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - SCUI Prod5 East 2CPU - 106493.01.02.01" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - SCUI Prod5 West 2CPU - 106493.01.02.01" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - SCUI Prod6 East 2CPU - 106493.01.02.01" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - SCUI Prod6 West 2CPU - 106493.01.02.01" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - SCUI Prod7 East 2CPU - 106493.01.02.01" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - SCUI Prod7 West 2CPU - 106493.01.02.01" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - SCUI Prod8 East 2CPU - 106493.01.02.01" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - WS - SCUI Prod8 West 2CPU - 106493.01.02.01" -Member $user -Confirm:$false

    #Other SG's
    Remove-ADGroupMember -Identity "SG - OneLogin - Panviva - Pima" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - OneLogin - Genesys IRS EIP" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - OneLogin - Genesys Indiana" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - OneLogin - Genesys HR MALT" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - OneLogin - Genesys Florida" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - OneLogin - Genesys NCUI" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - OneLogin - Zoom Users" -Member $user -Confirm:$false
    Remove-ADGroupMember -Identity "SG - FEDVPN - Default" -Member $user -Confirm:$false
 
    Write-Host " Deprovisioning Account: "$user.samaccountname " Password reset to: "$password
}

     
    
  


 
 Write-Host " Done Deprovisioning " 
 $total = ($userList).count
 Write-Host "Total Amount of Accounts Checked: "$total