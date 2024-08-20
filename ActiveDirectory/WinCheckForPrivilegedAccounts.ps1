# This script checks for accounts with privileged group memberships (e.g., Domain Admins, Enterprise Admins).
$privilegedGroups = "Domain Admins", "Enterprise Admins"

foreach ($group in $privilegedGroups) {
    Get-ADGroupMember -Identity $group | 
    Select-Object @{Name="Group";Expression={$group}}, Name, SamAccountName
}
