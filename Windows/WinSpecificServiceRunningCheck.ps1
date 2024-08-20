# This script checks if the Windows Update service (wuauserv) is running on the computer.
$serviceName = 'wuauserv'
$service = Get-Service -Name $serviceName

if ($service.Status -eq 'Running') {
    Write-Output "$serviceName is running."
} else {
    Write-Output "$serviceName is not running."
}
