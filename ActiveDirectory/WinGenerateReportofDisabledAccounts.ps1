# This script generates a report of all disabled user accounts in the domain.
$disabledAccounts = Get-ADUser -Filter {Enabled -eq $false}

Select-Object Name, SamAccountName

$disabledAccounts | Export-Csv -Path "Disabled_AD_Accounts_Report.csv" -NoTypeInformation
