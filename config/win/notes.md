# Notes on Microsoft Windows

## PuTTY

Font: You can download and install a font such as this that includes special
characters:

* `git clone https://github.com/taodongl/monaco.ttf`
* Open the `monaco.ttf` folder that results, open the `monaco` file, and click
the "Install" button to install into the set of installed fonts for Windows.

Nice Settings:

* Connection > Data > Terminal details > Terminal-type string: xterm-256color
* Window > Appearance > Font settings > Font used in the terminal window >
"Change..." button > pop-up (Here you can select the newly-installed "Monaco"
font or any other installed font that satisfies PuTTY's requirements.)

## WSL: Windows Subsystem for Linux

There are multiple ways to use Linux with Windows, but if using Windows 10
version 2004 and higher (Build 19041 and higher) or Windows 11, one can use WSL
to run a GNU/Linux environment -- including most command-line tools, utilities,
and applications -- directly on Windows, unmodified, without the overhead of a
traditional virtual machine or dual-boot setup.

<https://docs.microsoft.com/en-us/windows/wsl/>

EG: Install Ubuntu-20.04 and access it in several ways, most pleasantly through
the Windows Terminal app, but initially most conveniently through another
virtual-terminal app called 'Ubuntu 20.04 LTS'.  You can shut down the Linux
system using PowerShell with command `wsl --shutdown` (I think as long as you
close all connections to the system).

Note: WSL Ubuntu uses System V, not systemd for process management.

## WSL Interaction

* Start a WSL Ubuntu instance
  * [best] With the Terminal (Windows Terminal) app open, click on the down-arrow next
  to the rightmost tab and select "Ubuntu-20.04" from the drop-down menu that
  appears in order to simultaneously open a new tab and start the WSL system.
  * [ok] Open the 'Ubuntu 20.04 LTS' virtual-terminal app.
* PowerShell Commands
  * `wsl -l`
  * `wsl -l -v`
  * `wsl --list --running`
  * `wsl --shutdown`
  * `wsl --terminate <distro>`

## Ubuntu 20.04 LTS

With the Ubuntu terminal open, right-click/double-finger-on-pad-click on the
top bar of its window, and a drop-down menu appears.  Select "Properties" from
the menu.  You can change the font here.  I presume you'll have to change the
font in the "Defaults" selection to make the changes permanent/persistent.

## Windows Terminal

Use the "Windows Terminal". Though it was a pain to install (needing manual
installation since I don't have access to the Microsoft/Windows Store), it ended
up being much nicer to use than Cmd.exe or the WSL/Ubuntu-20.04 terminal.

## Random Success

I've been trying to fix a network issue that comes up when executing
`sudo apt-get update`, but nothing has worked until I set things back to their
defaults in the WSL Linux system (but still had the effect of having run the
`wsl2net-fix.ps1` script)...

I now just saw this (temporary) result (where <cli.github.com> still did't work
but <archive.ubuntu.com> and <security.ubuntu.com> did work):

```[bash]
> sudo apt-get update

[sudo] password for dex:
Err:1 https://cli.github.com/packages stable InRelease
  Temporary failure resolving 'cli.github.com'
Hit:2 http://archive.ubuntu.com/ubuntu focal InRelease
Get:3 http://archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
Get:4 http://security.ubuntu.com/ubuntu focal-security InRelease [114 kB]
Get:5 http://archive.ubuntu.com/ubuntu focal-backports InRelease [108 kB]
Get:6 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages [1,793 kB]
Get:7 http://security.ubuntu.com/ubuntu focal-security/main amd64 Packages [1,453 kB]
Get:8 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 c-n-f Metadata [15.2 kB]
Get:9 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 Packages [924 kB]
Get:10 http://archive.ubuntu.com/ubuntu focal-updates/universe amd64 c-n-f Metadata [20.7 kB]
Get:11 http://security.ubuntu.com/ubuntu focal-security/main Translation-en [250 kB]
Get:12 http://security.ubuntu.com/ubuntu focal-security/main amd64 c-n-f Metadata [10.2 kB]
Get:13 http://security.ubuntu.com/ubuntu focal-security/restricted amd64 Packages [914 kB]
Get:14 http://security.ubuntu.com/ubuntu focal-security/restricted Translation-en [130 kB]
Get:15 http://security.ubuntu.com/ubuntu focal-security/restricted amd64 c-n-f Metadata [520 B]
Get:16 http://security.ubuntu.com/ubuntu focal-security/universe amd64 Packages [703 kB]
Get:17 http://security.ubuntu.com/ubuntu focal-security/universe Translation-en [125 kB]
Get:18 http://security.ubuntu.com/ubuntu focal-security/universe amd64 c-n-f Metadata [14.5 kB]
Get:19 http://security.ubuntu.com/ubuntu focal-security/multiverse amd64 Packages [22.2 kB]
Get:20 http://security.ubuntu.com/ubuntu focal-security/multiverse Translation-en [5,376 B]
Get:21 http://security.ubuntu.com/ubuntu focal-security/multiverse amd64 c-n-f Metadata [512 B]
Fetched 6,719 kB in 16s (409 kB/s)
Reading package lists... Done
W: Failed to fetch https://cli.github.com/packages/dists/stable/InRelease  Temporary failure resolving 'cli.github.com'
W: Some index files failed to download. They have been ignored, or old ones used instead.
```

Hopefully, sometime, all three domains will resolve properly.
