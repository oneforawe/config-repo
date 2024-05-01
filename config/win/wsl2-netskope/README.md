# Netskope and CA Certs

Observation: WSL HTTP interactions and certificates are influenced by the host
Windows system, in particular with effects from Netskope.

## Possible (Partial?) Solution

This doesn't fix the problem mentioned below, but perhaps it fixes other
(general) problems not yet observed.

* In WSL, link the Windows Netskope cert file in `/etc/ssl/certs/`:  
  `sudo ln -sf /mnt/c/ProgramData/netskope/stagent/data/nscacert.pem /etc/ssl/certs/nscacert.pem`

## Possible (Partial?) Solution

This doesn't fix the problem mentioned below, but perhaps it fixes other (Node
related) problems not yet observed.

* In WSL, edit the environment file, targetting Node.
  * Enter the file:  
    `sudo vim /etc/environment`
  * Add this line, below the line for the PATH:  
    `NODE_EXTRA_CA_CERTS="/mnt/c/ProgramData/netskope/stagent/data/nscacert.pem"`

## Possible (Partial?) Solution

This doesn't fix the problem mentioned below, but perhaps it fixes other
(general) problems not yet observed.

Generate copies of (apparently) all certificates in Windows. Copy them over into
the WSL Linux system (EG, into `~/dev/support/wsl2-netskope-windows-certs/`.
Link to them from the `/etc/ssl/certs/` folder.

EG, `sudo ln -s ~/dev/support/wsl2-netskope-windows-certs/* /etc/ssl/certs`

* <https://github.com/bayaro/windows-certs-2-wsl>
* Found via <https://github.com/microsoft/WSL/issues/3161>

## Problem

I'm a remote developer, using a Windows machine with WSL (Linux in Windows,
"Windows Subsystem for Linux"). When I attempt to open VSCode from within WSL,
it automatically attempts to download and install a VSCode server for WSL, but
it fails due to a self-signed cert for PDS:

```(text)
ERROR: cannot verify update.code.visualstudio.com's certificate, issued by ‘emailAddress=certadmin@netskope.com,CN=ca.pacificdental.goskope.com,OU=e3d0cf1222e430abc0335ec532b67633,O=Pacific Dental Services,L=Irvine,ST=CA,C=US’:
Self-signed certificate encountered.
To connect to update.code.visualstudio.com insecurely, use `--no-check-certificate'.
ERROR: Failed to download https://update.code.visualstudio.com/commit:e170252f762678dec6ca2cc69aba1570769a5d39/server-linux-x64/stable to /home/pan/.vscode-server/bin/e170252f762678dec6ca2cc69aba1570769a5d39-1714410824.tar.gz
Please install missing certificates.
Debian/Ubuntu: sudo apt-get install ca-certificates
```

(I've tried that last command and some others but so far haven't succeeded.)

I'm thinking maybe I should explicitly add the PDS certificate (PEM file) with
an environment variable as suggested in this solution:
<https://stackoverflow.com/a/69758289>

But I'd like some perspective from a Help Desk wizard. Can you help me?

## References

* <https://docs.netskope.com/en/netskope-help/data-security/netskope-secure-web-gateway/configuring-cli-based-tools-and-development-frameworks-to-work-with-netskope-ssl-interception/>
* <https://stackoverflow.com/a/69758289>
* <https://nodejs.org/api/cli.html#node_extra_ca_certsfile>
* <https://ling123labs.com/posts/WSL-files-in-Windows-and-vice-versa/>

