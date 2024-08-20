# This script retrieves and displays the last logon time for a specific AD user.
$userName = "username"  # Replace with the actual username

Get-ADUser -Identity $userName -Properties LastLogonDate

Select-Object Name, LastLogonDate
