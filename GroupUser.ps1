$ErrorActionPreference = "Stop"

If (test-path c:\temp\usergroups.txt) {Remove-Item c:\temp\usergroups.txt};
If (test-path c:\temp\usergroup.txt) {Remove-Item c:\temp\usergroup.txt}
$Userid = @()
$Userid = Read-Host 'Enter userid'
$Server = Read-Host 'On what domain?'
$Creds = Get-Credential

Get-ADPrincipalGroupMembership $Userid -server $Server -credential $Creds|
select name | sort name |
Format-Table name > c:\temp\usergroups.txt -ErrorAction Stop

#Out-GridView -PassThru|

#Use below to remove whitespace
$content = Get-Content C:\temp\usergroups.txt
$content | Foreach {$_.TrimEnd()} | Set-Content C:\temp\usergroups.txt

#(Get-Content C:\temp\usergroups.txt) | Where-Object{$_.trim() -ne""} | set-content c:\temp\usergroup.txt
(get-content "C:\temp\usergroups.txt")  -notmatch "name" -notmatch "----" -notmatch "'r'n"| Where-Object{$_.trim() -ne""}|Out-File "c:\temp\usergroup.txt"
c:\temp\usergroup.txt
cat C:\temp\usergroup.txt | clip