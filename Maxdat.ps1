$Group = @()
$Group = Read-Host 'enter group name'

If (test-path c:\temp\maxdat.txt) {Remove-Item c:\temp\maxdat.txt};
If (test-path c:\temp\maxd.txt) {Remove-Item c:\temp\maxd.txt}

Write-Output $Group | Out-File "c:\temp\maxdat.txt"

Get-ADGroupMember -Identity $Group|
Get-ADObject -Properties Name |
Sort Name|
Format-Table Name -AutoSize| Out-File "c:\temp\maxdat.txt" -Append


#Use below to remove whitespace
#$content = Get-Content C:\temp\maxdat.txt
#$content | Foreach {$_.TrimEnd()} | Set-Content C:\temp\maxdat.txt

(get-content "C:\temp\maxdat.txt")  -notmatch "name" -notmatch "----" -notmatch "'r'n" |
 Where-Object{$_.trim() -ne""} | Out-File "c:\temp\maxd.txt"

c:\temp\maxd.txt
cat C:\temp\maxd.txt | clip