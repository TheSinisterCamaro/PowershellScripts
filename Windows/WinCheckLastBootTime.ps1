# This script retrieves and displays only the last boot time of the computer.
(Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
