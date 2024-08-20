# This script checks and displays the group membership of a specific AD user.
$userName = "username"  # Replace with the actual username

Get-ADUser -Identity $userName -Properties MemberOf

Select-Object Name, @{Name="Groups";Expression={$_.MemberOf -join "; "}}
