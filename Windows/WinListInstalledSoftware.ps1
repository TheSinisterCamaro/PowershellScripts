# This script lists all installed software on the computer, including the software name, version, publisher, and installation date.
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*

Select-Object DisplayName, DisplayVersion, Publisher, InstallDate

Sort-Object DisplayName