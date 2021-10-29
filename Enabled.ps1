$Server = read-host "Enter Domain to query/domain controller"


$tempArray = @() #An Arraylist to store the information found 


$User = import-csv "C:\Temp\users.csv" #import the users CSV 


Foreach ($index in $User){
$firstname = $index.FirstName
$lastname = $index.LastName


if(($firstname -like $null) -and ($lastname -like $null) ) {
continue
}


Write-host "looking up the following user:" $firstname, $lastname


$tempArray += Get-ADUser -Server $Server -Filter {(GivenName -like $firstname) -and (surname -like $lastname)} | select Enabled, SamAccountName,GivenName,Surname  #add the each users info in the temporary array.
}




Write-host "Outputing users to CSV"
$tempArray | Export-Csv "C:\temp\Enabled.csv" 
