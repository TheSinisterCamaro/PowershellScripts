# This script audits and displays recent changes to group memberships in AD.
Get-EventLog -LogName Security -InstanceId 4728, 4729, 4732, 4733 -Newest 100

Select-Object TimeGenerated, EntryType, InstanceId, Message
