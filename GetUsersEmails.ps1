Get-Content c:\temp\GetUsersEmails.txt | ForEach {

    Get-ADUser -Identity $_ -Properties EmailAddress |
        Select SamAccountName,EmailAddress
      

} | Export-Csv c:\temp\Emails.csv -NoTypeInformation

Write-Host "Getting Email Completed!"