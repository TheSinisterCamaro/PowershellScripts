# Basic example of CPU and memory monitoring with real-time output
while ($true) {
    Clear-Host
    $cpu = Get-Counter '\Processor(_Total)\% Processor Time'
    $memory = Get-Counter '\Memory\Available MBytes'
    
    Write-Output "CPU Usage: $($cpu.CounterSamples.CookedValue) %"
    Write-Output "Available Memory: $($memory.CounterSamples.CookedValue) MB"
    Start-Sleep -Seconds 5
}
