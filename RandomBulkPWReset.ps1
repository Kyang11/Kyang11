#Random Bulk Password Reset

$TargetDomain="maxcorp.maximus"

function Get-RandomCharacters($length, $characters) {
    #This function is for generating random Password
    $Pwd = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs=""
    return [String]$characters[$Pwd]
}
function Scramble-Password([string]$inputString){   
    #This function is to scramble Password  
    $characterArray = $inputString.ToCharArray()   
    $scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length     
    $outputString = -join $scrambledStringArray
    return $outputString 
}
function Update-Password
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Insert SamAccountName
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $SamAccount,
        # Domian help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=1)]
        $Domain
        #Change the length to the numbers of characters you want (currenty set to 8)
    )
     $password = Get-RandomCharacters -length 2 -characters 'abcdefghiklmnoprstuvwxyz'
        $Password += Get-RandomCharacters -length 2 -characters 'ABCDEFGHKLMNOPRSTUVWXYZ'
        $Password += Get-RandomCharacters -length 2 -characters '1234567890'
        $Password += Get-RandomCharacters -length 2 -characters '!%&?@#'
        $Password = Scramble-Password $Password
        Write-Output $password      
        #Reset Password
        Set-ADAccountPassword $SamAccount -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $Password -Force) -Server $Domain -Confirm:$false 
        #Unlock Account
        Unlock-ADAccount –Identity $SamAccount -Server $Domain
        #SamAccount is set to change Password at next logon
        #ChangePasswordAtLogon to $False if you don't want to change password at logon
        Set-ADUser –Identity $SamAccount –ChangePasswordAtLogon $True -Server $Domain -ea stop
        Write-Host " Resetting Password For: " $SamAccount $password
}

#Where it's getting the names to read off
$Usrs = get-content C:\Temp\ResetBulkPassword.csv -ea SilentlyContinue 
$srvs = (Get-ADForest).domains

if($Usrs -eq $null)
{

    Write-Output "Input file not found"
}
else{
    Foreach ($Srv in $srvs){
        foreach ($usr in $Usrs){
            $Outo =$usr.ToUpper()
        
        
            $validater = get-aduser  -Filter {sAMAccountName -eq $usr} -Server $Srv
             If ($validater -ne $null){
             Try{  
                $pwd = Update-Password -SamAccount $validater.SamAccountName -Domain $Srv -Verbose
                                $i++
                Out-file -FilePath "C:\Temp\RandomBulkPWGood.csv" -InputObject "$Outo $pwd" -Append -Force
                }
             Catch{
                Out-file -FilePath "C:\Temp\RandomBulkPWError.csv" -InputObject "[Error] While resetting the password for $Outo. Please RunAs Administrator and try again" -Append -Force
                }               
             }               
        }
   
    }
    $total = $Usrs.count -1
    Write-Host "Total Amount of Password Resets: "$total
    Write-Output "Script Completed. Log is available at C:\Temp\RandomBulkPWGood.csv"
}