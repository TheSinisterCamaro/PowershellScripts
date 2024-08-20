# Define the log file path
$logDirectory = "C:\Users\jdick\source\repos\PowershellScripts\Windows"
$logFile = Join-Path $logDirectory "SystemHealthCheck_$(Get-Date -Format 'yyyyMMdd').log"

# Ensure the log directory exists
if (-not (Test-Path -Path $logDirectory)) {
    New-Item -Path $logDirectory -ItemType Directory
}

# Start the log
Start-Transcript -Path $logFile

# Perform System Health Check

# Check Disk Usage
$diskUsage = Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{Name="FreeSpace(GB)";Expression={[math]::round($_.Free/1GB,2)}}, @{Name="UsedSpace(GB)";Expression={[math]::round(($_.Used)/1GB,2)}}, @{Name="TotalSpace(GB)";Expression={[math]::round($_.Used/1GB + $_.Free/1GB,2)}}

# Check CPU Load
$cpuLoad = Get-CimInstance -ClassName Win32_Processor | Select-Object Name, LoadPercentage

# Check Memory Usage
$memoryUsage = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object @{Name="TotalMemory(GB)";Expression={[math]::round($_.TotalVisibleMemorySize/1MB,2)}}, @{Name="FreeMemory(GB)";Expression={[math]::round($_.FreePhysicalMemory/1MB,2)}}

# Check Network Connectivity
$networkConnectivity = Test-Connection -ComputerName google.com -Count 4

# Display Disk Usage
Write-Output "Disk Usage:"
$diskUsage | Format-Table -AutoSize

# Display CPU Load
Write-Output "`nCPU Load:"
$cpuLoad | Format-Table -AutoSize

# Display Memory Usage
Write-Output "`nMemory Usage:"
$memoryUsage | Format-Table -AutoSize

# Display Network Connectivity
Write-Output "`nNetwork Connectivity Test:"
$networkConnectivity | Format-Table -AutoSize

# Output a summary of the health check
Write-Output "`nSystem Health Check completed at $(Get-Date)"

# Alerts

# CPU Load Alert
foreach ($cpu in $cpuLoad) {
    if ($cpu.LoadPercentage -gt 80) {
        Write-Output "ALERT: CPU load on $($cpu.Name) is above 80%!"
    }
}

# Disk Space Alert
foreach ($drive in $diskUsage) {
    if ($drive."FreeSpace(GB)" -lt 10) {
        Write-Output "ALERT: Drive $($drive.Name) has less than 10GB of free space!"
    }
}

# End the log
Stop-Transcript

Write-Output "System Health Check results logged to $logFile"
