# Adresse IP, passerelle, DNS
$network = Get-NetIPAddress -AddressFamily IPv4 | Select-Object -First 1
"Adresse IP : $($network.IPAddress)"
$gateway = Get-NetRoute -DestinationPrefix 0.0.0.0/0 | Select-Object -First 1
"Passerelle : $($gateway.NextHop)"
$dnsList = Get-DnsClientServerAddress | Where-Object { $_.ServerAddresses -match '\d{1,3}(\.\d{1,3}){3}' } | Select-Object -ExpandProperty ServerAddresses
"Serveur DNS (IPv4) : $($dnsList -join ', ')"


# Nom d'hôte
"Nom d'hôte : $env:COMPUTERNAME"

# Adaptateurs réseau
Get-NetAdapter | Select-Object Name, Status | Format-Table -AutoSize
