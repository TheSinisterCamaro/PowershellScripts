# This script calculates and displays how long the system has been running since the last boot.
$uptime = (Get-Date) - (gcim Win32_OperatingSystem).LastBootUpTime
Write-Output "System Uptime: $($uptime.Days) days, $($uptime.Hours) hours, $($uptime.Minutes) minutes."
