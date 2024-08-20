# Warning: Could slow network if large pull request
# This script retrieves and displays the group memberships for all users in AD.
Get-ADUser -Filter * -Property MemberOf

Select-Object Name, @{Name="Groups";Expression={$_.MemberOf -join "; "}} 

Sort-Object Name
