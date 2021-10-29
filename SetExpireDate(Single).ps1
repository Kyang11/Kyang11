
#So far only works for Maxcorp 
#$Server = Read-Host "=> On what domain?"
#$Creds = Get-Credential


$Userid = Read-Host '=> Enter userid' 
$time = Read-Host '=> Set Expiration Date'
$password = Get-RandomCharacters -length 5 -characters 'abcdefghiklmnoprstuvwxyz'
        $Password += Get-RandomCharacters -length 1 -characters 'ABCDEFGHKLMNOPRSTUVWXYZ'
        $Password += Get-RandomCharacters -length 1 -characters '1234567890'
        $Password += Get-RandomCharacters -length 1 -characters '!%&?#'
        $Password = Scramble-Password $Password
        Write-Host "=> Password Reset to:" $password 

#Reset Password, Set Expiration date, and user can not change password
Set-ADAccountExpiration -Identity $Userid -DateTime $time
Set-ADUser -Identity $userid -CannotChangePassword $True
Set-ADAccountPassword $Userid -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $Password -Force) -Confirm:$false 

#This remove O365 license Maxcorp
Remove-ADGroupMember -Identity "SG - M365 F1" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - M365 F1 with Audio Conferencing" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - M365 F1 with Conferencing and Domestic Calling" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - M365 F1 with Domestic Calling" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - M365 F3 Census Survey Workers" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - M365 E3" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - M365 E3 with Audio Conferencing" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - M365 E3 with Conferencing and Domestic Calling" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - M365 E3 with Domestic Calling" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - M365 E5" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - M365 E5 with International and Domestic Calling" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - M365 E5 with Domestic Calling" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - O365 MS Flow Free" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - O365 Project" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - O365 Visio" -Member $userid -Confirm:$false

#This remove AWS SG's for NCUI Maxcorp
Remove-ADGroupMember -Identity "SG - VDI - Jabber" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - VDI - CDC" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - VDI - NC UI Call Center" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center Prod5 East 2CPU - 107111.01.01.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center Prod5 West 2CPU - 107111.01.01.01" -Member $userid -Confirm:$false
      
Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center Prod6 West 2CPU - 107111.01.01.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center Prod6 East 2CPU - 107111.01.01.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center Prod7 West 2CPU - 107111.01.01.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - NC UI Call Center Prod7 East 2CPU - 107111.01.01.01" -Member $userid -Confirm:$false

#CDC Maxcorp
Remove-ADGroupMember -Identity "SG - WS - CDC ProdCMS West 2CPU - H40001.020.02" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CDC ProdCMS East 2CPU - H40001.020.02" -Member $userid -Confirm:$false

#SC UI Maxcorp
Remove-ADGroupMember -Identity "SG - VDI - SCUI" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - SCUI East 2CPU - 106493.01.02.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - SCUI West 2CPU - 106493.01.02.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - SCUI Prod5 East 2CPU - 106493.01.02.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - SCUI Prod5 West 2CPU - 106493.01.02.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - SCUI Prod6 East 2CPU - 106493.01.02.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - SCUI Prod6 West 2CPU - 106493.01.02.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - SCUI Prod7 East 2CPU - 106493.01.02.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - SCUI Prod7 West 2CPU - 106493.01.02.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - SCUI Prod8 East 2CPU - 106493.01.02.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - SCUI Prod8 West 2CPU - 106493.01.02.01" -Member $userid -Confirm:$false

#CCO
Remove-ADGroupMember -Identity "SG - VDI - CCO" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO East 2CPU - 261001.01.03.61.14" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO West 2CPU - 261001.01.03.61.14" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Ops Prod1 East 2CPU - H46601.001.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Ops Prod1 West 2CPU - H46601.001.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod1 East 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod1 West 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod2 East 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod2 West 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod3 East 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod3 West 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod4 East 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod4 West 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod6 East 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod6 West 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod8 East 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod8 West 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod9 East 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - CCO Prod9 West 2CPU - 261001.01.02.61.15" -Member $userid -Confirm:$false

#AR UI
Remove-ADGroupMember -Identity "SG - VDI - Arkansas UE" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - Arkansas UE Prod4 West 2CPU - 107119.01.01.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - Arkansas UE Prod4 East 2CPU - 107119.01.01.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - Arkansas UE East 2CPU - 107119.01.01.01" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - WS - Arkansas UE West 2CPU - 107119.01.01.01" -Member $userid -Confirm:$false


#Other SG's
Remove-ADGroupMember -Identity "SG - OneLogin - Panviva - Pima" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - OneLogin - Genesys IRS EIP" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - OneLogin - Genesys Indiana" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - OneLogin - Genesys HR MALT" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - OneLogin - Genesys Florida" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - OneLogin - Genesys NCUI" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - OneLogin - Zoom Users" -Member $userid -Confirm:$false
Remove-ADGroupMember -Identity "SG - FEDVPN - Default" -Member $userid -Confirm:$false


#Finish
Write-Host "~ Finished :)" -ForegroundColor Green