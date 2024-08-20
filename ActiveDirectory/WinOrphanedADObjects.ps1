# This script identifies and displays orphaned AD objects (objects with no parent).
Get-ADObject -Filter *

Where-Object {$_.DistinguishedName -notmatch '^CN='}
