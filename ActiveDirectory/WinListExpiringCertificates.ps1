# This script lists all certificates that are about to expire in the next 30 days within AD.
$timeSpan = (Get-Date).AddDays(30)

Get-ADObject -LDAPFilter "(&(objectClass=user)(userCertificate=*))" -Property userCertificate

ForEach-Object {
    $cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2
    $cert.Import([byte[]]$_.userCertificate)
    if ($cert.NotAfter -lt $timeSpan) {
        [PSCustomObject]@{
            Name = $_.Name
            CertificateExpiryDate = $cert.NotAfter
        }
    }
}

Select-Object Name, CertificateExpiryDate
