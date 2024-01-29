# Source:
# https://gist.github.com/andrewvc/fe22397c554ac3e6255681bfc864e62e
# Found via:
# https://github.com/microsoft/WSL/issues/4435
# and
# https://github.com/microsoft/WSL/issues/3438#issuecomment-518464665

# Instructions:
#
# 0. The goal of these instructions is to fix errors in the WSL GNU/Linux system
#    such as the following:
#
# > sudo apt-get update
#   [sudo] password for linux.username:
#   Err:1 http://archive.ubuntu.com/ubuntu focal InRelease
#     Temporary failure resolving 'archive.ubuntu.com'
#   Err:2 http://security.ubuntu.com/ubuntu focal-security InRelease
#     Temporary failure resolving 'security.ubuntu.com'
#   Err:3 https://cli.github.com/packages stable InRelease
#     Temporary failure resolving 'cli.github.com'
#   Err:4 http://archive.ubuntu.com/ubuntu focal-updates InRelease
#     Temporary failure resolving 'archive.ubuntu.com'
#   Get:5 http://archive.ubuntu.com/ubuntu focal-backports InRelease [108 kB]
#   Fetched 108 kB in 46s (2,346 B/s)
#   Reading package lists... Done
#   W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/focal/InRelease  Temporary failure resolving 'archive.ubuntu.com'
#   W: Failed to fetch http://archive.ubuntu.com/ubuntu/dists/focal-updates/InRelease  Temporary failure resolving 'archive.ubuntu.com'
#   W: Failed to fetch http://security.ubuntu.com/ubuntu/dists/focal-security/InRelease  Temporary failure resolving 'security.ubuntu.com'
#   W: Failed to fetch https://cli.github.com/packages/dists/stable/InRelease  Temporary failure resolving 'cli.github.com'
#   W: Some index files failed to download. They have been ignored, or old ones used instead.
#
# 1. With the Windows machine hosting WSL, ensure the WSL guest machine is on.
#
# 2. In the Windows machine, in a PowerShell execute the script using the
#    command format  ./script-name.ps1
#    Hence:  ./wsl2net-fix.ps1
#    This will apply settings that should hopefully fix the problem.... nope...
#    Maybe I need to make sure that the WSL guest has the correct settings first.
#
# 3. Follow the instructions in the wsl.conf file (and then the resolv.conf file).


# Attempt to fix broken network in WSL2.0 by setting netmask and default gateway
Write-Output "Initial routing table:"
bash -c "sudo ip route show"
$guest_ip = bash -c "/sbin/ifconfig eth0 | egrep -o 'inet [0-9\.]+' | cut -d ' ' -f2"
Write-Output "Guest IP IS: $guest_ip"
$gateway_ips = Get-NetIPAddress -InterfaceAlias "vEthernet (WSL)" | Select-Object IPAddress
$gateway_ip = $gateway_ips[1].IPAddress
Write-Output "Gateway (local WSL adapter) IP is: $gateway_ip"
bash -c "sudo ifconfig eth0 netmask 255.255.240.0"
bash -c "sudo ip route add default via $gateway_ip"
Write-Output "Final routing table (after addition):"
bash -c "sudo ip route show"


# My Output (in PowerShell) (before I added the "Inital" and "Final" printouts):
# PS C:\Users\windows.username\path-to-file> .\wsl2net-fix.ps1
# Guest IP IS: 172.20.19.130
# Gateway (local WSL adapter) IP is: 172.20.16.1
# [sudo] password for linux.username:
# [sudo] password for linux.username:
# RTNETLINK answers: File exists

# Note this other output (in PowerShell) (later on, after rebooting WSL system):
# PS C:\Users\windows.username\path-to-file> bash -c "/sbin/ifconfig eth0 | egrep -o 'inet [0-9\.]+' | cut -d ' ' -f2"
# 172.20.25.161
# PS C:\Users\windows.username\path-to-file> bash -c "sudo ip route show"
# [sudo] password for linux.username:
# default via 172.20.16.1 dev eth0
# 172.20.16.0/20 dev eth0 proto kernel scope link src 172.20.25.161
