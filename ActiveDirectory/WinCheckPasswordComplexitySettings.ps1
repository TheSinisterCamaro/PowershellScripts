# This script retrieves and displays the password policy settings for the domain.
Get-ADDefaultDomainPasswordPolicy

Select-Object MinPasswordLength, PasswordHistoryCount, PasswordComplexityEnabled, MaxPasswordAge, MinPasswordAge
