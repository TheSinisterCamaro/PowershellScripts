# This script audits recent changes to AD group memberships, focusing on critical security groups.
$criticalGroups = "Domain Admins", "Enterprise Admins"

foreach ($group in $criticalGroups) {
    Get-EventLog -LogName Security -InstanceId 4728, 4729, 4732, 4733 -Newest 100

    Where-Object {$_.Message -like "*$group*"}

    Select-Object TimeGenerated, EntryType, Message
}
