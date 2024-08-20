# This script audits and displays account lockout events from the Security log.
Get-EventLog -LogName Security -InstanceId 4740 -Newest 100

Select-Object TimeGenerated, EntryType, Message
