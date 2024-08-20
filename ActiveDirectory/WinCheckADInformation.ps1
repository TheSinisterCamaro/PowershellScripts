# This script retrieves and displays the domain name, domain controllers, and forest information.
Get-ADDomain

Select-Object Name, DomainControllersContainer, Forest
