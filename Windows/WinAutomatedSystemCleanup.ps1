# This script automates system cleanup tasks.

# Clear temp files, skipping those that are in use
Get-ChildItem "C:\\Windows\\Temp" -Recurse | ForEach-Object {
    try {
        Remove-Item $_.FullName -Force -Recurse
    } catch {
        Write-Output "Skipped: $($_.FullName) - File is in use."
    }
}

# Uninstall unused software (example)
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -like "OldSoftware"} | ForEach-Object { $_.Uninstall() }

# Defragment disk
Optimize-Volume -DriveLetter C -Defrag -Verbose

Write-Output "System cleanup completed at $(Get-Date)"
