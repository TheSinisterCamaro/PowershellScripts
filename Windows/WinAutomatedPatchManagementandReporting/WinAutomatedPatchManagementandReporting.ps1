# Ensure the PSWindowsUpdate module is imported
Import-Module PSWindowsUpdate

# Define the report file path
$reportPath = "C:\Path\To\File\Reports\PatchReport_$(Get-Date -Format 'yyyyMMdd').txt" # Fill in your path here for reports

# Start the report
$reportContent = @("Patch Management Report - $(Get-Date)")
$reportContent += "==============================="
$reportContent += ""

# Check for available updates
$updates = Get-WindowsUpdate

# Log available updates to the report
if ($updates) {
    $reportContent += "Updates Found:"
    $reportContent += "--------------"
    $reportContent += $updates | Format-Table -AutoSize | Out-String
} else {
    $reportContent += "No updates found."
}

# Install updates
$installedUpdates = Get-WindowsUpdate -Install -AcceptAll -AutoReboot

# Log installed updates to the report
if ($installedUpdates) {
    $reportContent += ""
    $reportContent += "Installed Updates:"
    $reportContent += "------------------"
    $reportContent += $installedUpdates | Format-Table -AutoSize | Out-String
} else {
    $reportContent += ""
    $reportContent += "No updates were installed."
}

# Write the report to the file
$reportContent | Out-File -FilePath $reportPath -Force

Write-Output "Patch report generated at $(Get-Date)"
Write-Output "Report saved to: $reportPath"
