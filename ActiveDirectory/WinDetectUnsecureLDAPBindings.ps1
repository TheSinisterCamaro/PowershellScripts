# This script checks for unsecure LDAP bindings by identifying any domain controllers accepting simple LDAP binds.
$dcList = Get-ADDomainController -Filter *

foreach ($dc in $dcList) {
    nltest /server:$($dc.HostName) /test:$($dc.Domain)
    Select-String "Error"
}
