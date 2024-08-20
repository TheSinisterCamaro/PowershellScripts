# Specify the name of the service you want to check
$serviceName = "Spooler"

# Retrieve the status of the specified service
$service = Get-Service -Name $serviceName

# Output the current status of the service
Write-Output "The status of the service '$($serviceName)' is: $($service.Status)"
