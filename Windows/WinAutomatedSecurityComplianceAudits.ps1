# Example script to check if the firewall is enabled
$firewallStatus = Get-NetFirewallProfile | Select-Object Name, Enabled

if ($firewallStatus.Enabled -contains "False") {
    Write-Output "WARNING: One or more firewall profiles are disabled!"
} else {
    Write-Output "Firewall is enabled on all profiles."
}
