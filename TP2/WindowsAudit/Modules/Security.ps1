# Statut du pare-feu Windows
"Pare-feu Windows :"
(Get-NetFirewallProfile | Select-Object -First 1).Enabled

# Statut de Windows Defender
"Windows Defender :"
(Get-MpComputerStatus).RealTimeProtectionEnabled