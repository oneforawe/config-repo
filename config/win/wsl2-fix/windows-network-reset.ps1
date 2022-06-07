# https://stackoverflow.com/questions/62314789/no-internet-connection-on-wsl-ubuntu-windows-subsystem-for-linux/64057835#64057835
# This is tied in with some other scripts/steps in ~/.config-repo/config/win/
# EG: wslnet-fix.ps1, wsl.conf, resolv.conf

# Hopefully this helps fix the internet connection / resolving problem in WSL.

# Note: All connections to WSL should probably be closed first to allow shutting down.
wsl --shutdown
netsh winsock reset
netsh int ip reset all
netsh winhttp reset proxy
ipconfig /flushdns
netsh winsock reset
shutdown /r
