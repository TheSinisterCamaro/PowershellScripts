# This script checks the status of the Windows Firewall and displays whether it's enabled or disabled for each profile.
Get-NetFirewallProfile

Select-Object Name, Enabled
