# This script retrieves and displays audit logs of recently created user accounts.
Get-EventLog -LogName Security -InstanceId 4720 -Newest 100

Select-Object TimeGenerated, EntryType, Message
