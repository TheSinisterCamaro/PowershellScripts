# This script finds and displays all disabled user accounts in AD.
Get-ADUser -Filter {Enabled -eq $false}

Select-Object Name, SamAccountName
