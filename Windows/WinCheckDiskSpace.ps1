# This script checks and displays the available disk space, used space, and total space for each drive on the computer.
Get-PSDrive -PSProvider FileSystem
Select-Object Name, @{Name="FreeSpace(GB)";Expression={[math]::round($_.Free/1GB,2)}}, @{Name="UsedSpace(GB)";Expression={[math]::round(($_.Used)/1GB,2)}}, @{Name="TotalSpace(GB)";Expression={[math]::round($_.Used/1GB + $_.Free/1GB,2)}}