# Warning: Use this with caution as it could slow the network down on large pulls
# This script lists all computers in the Active Directory, displaying their Name, OperatingSystem, and LastLogonDate.
Get-ADComputer -Filter * -Property Name, OperatingSystem, LastLogonDate

Select-Object Name, OperatingSystem, LastLogonDate

Sort-Object Name
