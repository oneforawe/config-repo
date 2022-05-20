# Source:
# https://gist.github.com/andrewvc/fe22397c554ac3e6255681bfc864e62e
# Found via:
# https://github.com/microsoft/WSL/issues/4435
# and
# https://github.com/microsoft/WSL/issues/3438

# Instructions:
# Run this with PowerShell in the Windows machine hosting WSL. (Right? How?)
# Get settings and then do what?

# Attempt to fix broken network in WSL2.0
$guest_ip = bash -c "/sbin/ifconfig eth0 | egrep -o 'inet [0-9\.]+' | cut -d ' ' -f2"
Write-Output "Guest IP IS:  $guest_ip"
$gateway_ips = Get-NetIPAddress -InterfaceAlias "vEthernet (WSL)" | select IPAddress
$gateway_ip = $gateway_ips[1].IPAddress
Write-Output "Gateway (local WSL adapter) IP is: $gateway_ip"
bash -c "sudo ifconfig eth0 netmask 255.255.240.0"
bash -c "sudo ip route add default via $gateway_ip"
