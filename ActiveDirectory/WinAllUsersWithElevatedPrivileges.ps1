# This script lists all AD users who are members of privileged groups (e.g., Domain Admins, Enterprise Admins).
$privilegedGroups = "Domain Admins", "Enterprise Admins", "Administrators"

foreach ($group in $privilegedGroups) {
    Get-ADGroupMember -Identity $group | 
    Select-Object @{Name="Group";Expression={$group}}, Name, SamAccountName
}
