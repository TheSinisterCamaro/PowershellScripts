# This script lists all domain controllers in the AD domain, displaying their Name, OperatingSystem, and Site.
Get-ADDomainController -Filter *

Select-Object Name, OperatingSystem, Site
