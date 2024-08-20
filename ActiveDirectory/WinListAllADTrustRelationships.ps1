# This script lists all trust relationships established between the current domain and other domains.
Get-ADTrust -Filter *

Select-Object Name, TrustType, TrustDirection, IsTransitive
