# Log file location for driver updates and repairs
$logFile = "C:\DriverUpdateLog.txt"

# Function to update all drivers using PnPUtil
function Update-Drivers {
    Write-Host "Updating drivers..." -ForegroundColor Green
    pnputil /scan-devices | Out-File -FilePath $logFile -Append
    pnputil /enum-devices /problem | Out-File -FilePath $logFile -Append

    # Force rescan and update of all drivers
    pnputil /scan-devices
    pnputil /enum-devices /problem
    Write-Host "Drivers update completed. Check the log file at $logFile" -ForegroundColor Green
}

# Function to check and repair system files using DISM and SFC
function Repair-SystemFiles {
    Write-Host "Checking and repairing system files..." -ForegroundColor Green
    # Use DISM to check for and repair issues with the Windows image
    dism /Online /Cleanup-Image /RestoreHealth | Out-File -FilePath $logFile -Append

    # Use SFC to check and repair system files
    sfc /scannow | Out-File -FilePath $logFile -Append
    Write-Host "System file check completed. Check the log file at $logFile" -ForegroundColor Green
}

# Execute the driver update and system repair functions
Update-Drivers
Repair-SystemFiles

Write-Host "Driver updates and system repairs completed. Check the log file at $logFile for details." -ForegroundColor Yellow


# Timestamp: 2024-09-25 22:41:42

# Authentication Code: BF7CB50E4D0C1106916E76ABE503E40DA29E077867E0AF321A4A9F662795E673

# SIG # Begin signature block
# MIIG7QYJKoZIhvcNAQcCoIIG3jCCBtoCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUGOCkcPlA3r9FJ8hNpLUdlS7H
# V/agggQPMIIECzCCAnOgAwIBAgIQHnpd38JS1L5EsDeXTX2uajANBgkqhkiG9w0B
# AQsFADATMREwDwYDVQQDDAhUb255VGVzdDAeFw0yNDA5MjUyMTMxMDVaFw0yNTA5
# MjUyMTQxMDVaMBMxETAPBgNVBAMMCFRvbnlUZXN0MIIBojANBgkqhkiG9w0BAQEF
# AAOCAY8AMIIBigKCAYEAxf5x+y8uQaE1RAMkE2mmrZZpn2aRp55z5lZ44tLfqBeg
# Lii8qZ0qtsYUyduwc9lScP2Np30RgulYO2hsZg/SI5zCix2cbWAHvpjbKdaDTUvt
# DSNZN0db0o42SDXTxig+/1Jfr132h7ywgAfba0OrwwF2MwpaeE+s63zzrETKyUwz
# BBbn968iljQJG4Ul9VxMLgdAfgEQ870yeozvN/2Pt3OT741mq2azhhLq6nXJ2vsL
# 3i3b953vOK9iwFDKYWJcXQghXQ4ntQWQIMYUKtwHz60X/grMeY09CkJf6+kc13ae
# CbsRpxUQJMODd7bPlq0DFUk0dazUzAaHhNwj5N/Cj9TrzmTdrgAUPX8SsyBCtC1l
# GGb3kQrshfYv1HplxQoqfJ+EXcRolxgN5hiQQymITxZ+DBSu2K2kbOm1P9y2mXwK
# rNAYWA299N5/zCVmoubaUwcIYfJasblzLSLzeDIud6aUHct7/2B3WgclH5ByqUzO
# Zq0iBTA/Bz4nSEFQw8URAgMBAAGjWzBZMA4GA1UdDwEB/wQEAwIHgDATBgNVHSUE
# DDAKBggrBgEFBQcDAzATBgNVHREEDDAKgghUb255VGVzdDAdBgNVHQ4EFgQUz52c
# RSodnUI7tKt5Yr+2ENTClz0wDQYJKoZIhvcNAQELBQADggGBAG8OEhwjIGm2ESxU
# 1wE5MWskSRllLwuXLigY2QR6ksKDFlaUr7VNheGEpcXtBZAUsy0H6DSjpw2Tujo7
# x3JUfZJOsLSTq6LSDGx00qvvCfzww8w5P15OW7CxGJI6zXrI8lt3hg5eL2cidniH
# SEKsGvxVCl/QOCRcP+yS3ptToL0N2d5YM1Dh/1z68sDoSXqm5w73ANBUTA8PCg9f
# 6wJOw5ytdfT7qgQ2wUSSNNwMHmSO0Vt4FK686THUx+mwixI9dU1in1Cx+4szvsqd
# xsb5XIxXkYoOIbOW1CqrG0Ta+1bobDlFUZZr0Xvg+MGnTNCyOp2V3EHoYFiv3djh
# LKEGJ0EVwzkQhnGhvcFTrTSWj7qncFzuGStpXZVqzrbZ9sMCCU9nc+rjh0cVL7ne
# fAB29PNXTUFx7CHhtwZlpRqGMFT05jjuyddwkWTUSDpKsBZ9qJ+CBIUz1b9/cKz9
# 8UQ6FXtPs8rsHK8WuhwaSd1fgFoC/Uu3DwJ9l3UJFr1jS5lSpzGCAkgwggJEAgEB
# MCcwEzERMA8GA1UEAwwIVG9ueVRlc3QCEB56Xd/CUtS+RLA3l019rmowCQYFKw4D
# AhoFAKB4MBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwG
# CisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZI
# hvcNAQkEMRYEFByMriD747b3Z17VJcrmWPWg1nIjMA0GCSqGSIb3DQEBAQUABIIB
# gJXjBtm80y9jPNObsQcT/WQCc5AD7B3TE/s9omrv04jyWUGFot1TPh4HAZ8U0E8s
# A3zTW8OZABHPI2n33ZcQyKhKdBbzhv8k8wSqEjPoF2217icmKXn/uXu/Hn2IWkx9
# iE3rakBYuZaLxTH4w0HIJFuaf2tJRmdj4gbipVnX8Mj+S2wIpv2O2ZYK0bzPhv7g
# UE4o8aa7rqsnm/J01IYeVjWKB08O8E9V+AcP8Kby54LIrhD/8DGCYNIsxP/pbAbW
# ZDT8wW2yUQHC/nLg6784JIeWAWXrknU97eTYAoAEN4O8c66KmJS43ztJ9t6sBWEd
# abIDrPoNnx1RfEZ2GbUS8SgKXVQXrC+mPCe8i1sRoVJzLjn5BJahp9gZ3BFNXfOh
# jE24NdxDVdrDJxAs8/3mIZhMLnQRxhk7xwg8cCoB7risQ41SoPh6yQMQFgxztUxh
# AO6edaSQ0cPtlP7vaVpSKyyDl8NIBlAtapm0ZDRqB0/CpaCVzHRTMf1rzJtjLB0z
# Gw==
# SIG # End signature block
