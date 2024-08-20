# This script generates a security report summarizing key AD attributes (e.g., disabled accounts, locked-out accounts, expired passwords).
$report = @()
$report += Get-ADUser -Filter {Enabled -eq $false} | Select-Object Name, SamAccountName, @{Name="Status";Expression={"Disabled"}}
$report += Get-ADUser -Filter {LockedOut -eq $true} | Select-Object Name, SamAccountName, @{Name="Status";Expression={"LockedOut"}}
$report += Get-ADUser -Filter * -Property "msDS-UserPasswordExpiryTimeComputed" | 
    Where-Object {([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")) -lt (Get-Date)} |
    Select-Object Name, SamAccountName, @{Name="Status";Expression={"PasswordExpired"}}

$report | Export-Csv -Path "AD_Security_Report.csv" -NoTypeInformation
