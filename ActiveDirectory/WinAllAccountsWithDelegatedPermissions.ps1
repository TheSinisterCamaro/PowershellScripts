# This script finds all accounts that have delegated permissions in Active Directory.
$delegatedPermissions = Get-ADUser -Filter {adminCount -eq 1} -Properties adminCount

Select-Object Name, SamAccountName, adminCount

$delegatedPermissions
