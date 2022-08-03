# Notes on Microsoft Windows

## Win 10

For work, I'm using a Windows 10 system without access to the Microsoft/Windows
Store.

## Remap Keys

For better keyboard ergonomics, you can use PowerToys to remap the CAPS-LOCK key
as another Control key.  Or (if on a Windows system without PowerToys) you can
directly edit the registry to remap.  See, for example, [this superuser forum
answer](https://superuser.com/questions/949385/map-capslock-to-control-in-windows-10).

I saved a copy of this registry file [here](./remap/caps-to-control.reg).

They say I should be able to see the changes after logging/signing in and out,
but I'm not seeing it yet.  Maybe I'll have to reboot.  Nope; rebooting didn't
help, but I found a solution:

I'm using RDC (Remote Desktop Connection) to connect to a Windows Server 2016
machine, and it seems that the registry settings on the server are not being
applied across my connection via RDC.  However, changing the RDC options allowed
me to (presumably) apply my local key remappings to the remote machine.  Before
connecting to the remote machine, while viewing the RDC main window for making
the connection, click on "Show Options" to expand the window and change the
interface:

"Show Options" > "Local Resources" (tab) > "Keyboard" >
"Apply Windows key combinations:" > "On this computer"

Then connect.  The key mapping should now work.

## Mouse

Use the Registry to change the scroll-wheel direction:  
<https://www.windowscentral.com/how-reverse-scrolling-direction-windows-10>

See link above or see the copied source text (without images)
[here](./howto/mouse.md).

"If you use a mouse to navigate the Windows 10 desktop, the Settings app does
not include an option to reverse the scrolling direction. However, you can still
modify the scrolling behavior using the Registry."

"Warning: This is a friendly reminder that editing the Registry is risky, and it
can cause irreversible damage to your installation if you don't do it correctly.
Before proceeding, it's recommended to make a full backup of your computer."

```[text]
Device Manager (app)
 > PDS-1098037
 > Mice and other pointing devices (dropdown)
 > * HID-compliant mouse     (NOTE: HID  => USB port)    (enabled)
   * PS/2 Compatible Mouse   (NOTE: PS/2 => PS/2 port)   (not enabled)
   * Synaptics HID ClickPad                              (enabled)
   (NOTE: Presence of "Disable device" selection => device is enabled/active)
 > Properties (selection)
 > Details (tab)
 > Device instance path (selection)

* HID-compliant mouse:     HID\VID_046D&PID_C534&MI_01&COL01\7&3382A524&0&0000
* PS/2 Compatible Mouse:   ACPI\SYN307B\4&7AE4F8C&0
* Synaptics HID ClickPad:  HID\SYNA307B&COL01\5&2658B661&0&0000
```

So the active mouse is the HID mouse and we can extract the relevant ID.

* Mouse "VID ID": VID_046D&PID_C534&MI_01&COL01

```[text]
Registry Editor (app)
 > Computer
 > HKEY_LOCAL_MACHINE   ( HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID )
 > SYSTEM
 > CurrentControlSet
 > Enum
 > HID
 > VID_046D&PID_C534&MI_01&COL01
 > * 7&25e9da2e&0&0000
     Key: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID\VID_046D&PID_C534&MI_01&Col01\7&25e9da2e&0&0000
   * 7&3382a524&0&0000
     Key: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID\VID_046D&PID_C534&MI_01&Col01\7&3382a524&0&0000
 > Device Parameters
 > FlipFlopWheel DWORD / REG_DWORD  (double-click and set the value from 0 to 1)
```

The instructions mentioned there being one key, but I found two keys, so I
changed the (FlipFlopWheel) settings/registry for both keys, clicked OK, and
then restarted.

## PowerShell

Fundamental commands:

* Get-Help, Update-Help
* Get-Command
* Get-Member
* Find-Module

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

### WSL Interaction

* Start a WSL Ubuntu instance
  * [best] With the Terminal (Windows Terminal) app open, click on the
  down-arrow next to the rightmost tab and select "Ubuntu-20.04" from the
  drop-down menu that appears in order to simultaneously open a new tab and
  start the WSL system.
  * [ok] Open the Ubuntu virtual-terminal app (EG: 'Ubuntu 20.04 LTS').
* PowerShell Commands
  * `wsl -l`
  * `wsl -l -v`
  * `wsl --list --running`
  * `wsl --shutdown`
  * `wsl --terminate <distro>`

### Ubuntu Terminal

With the Ubuntu terminal ('Ubuntu 20.04 LTS') open, right-click /
double-finger-on-pad-click on the top bar of its window, and a drop-down menu
appears.  Select "Properties" from the menu.  You can change the font here.  I
presume you'll have to change the font in the "Defaults" selection to make the
changes permanent/persistent.

### WSL2 Random Failure / Success

Potential solution: just reboot Windows. (Let's see how often this fixes it; it
seems to have worked at least twice already.)

I've been trying to fix a network issue that comes up when executing
`sudo apt-get update`, but nothing has worked until I set things back to their
defaults in the WSL Linux system (but still had the effect of having run the
`wsl2net-fix.ps1` script)...

I now just saw this (temporary) result (where <cli.github.com> still did't work
but <archive.ubuntu.com> and <security.ubuntu.com> did work):

```[bash]
> sudo apt-get update

[sudo] password for LINUX.USERNAME:
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

From this github thread, the user scyto has some sensible things to say, but no
one seems to have found a real solution that I've tried that works for me:  
<https://github.com/microsoft/WSL/issues/5256>

## Windows Terminal

Use the [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701).
Though it was a pain to install (needing
[manual installation](https://docs.microsoft.com/en-us/windows/terminal/install)
via GitHub since I don't have access to the Microsoft/Windows Store), it ended
up being much nicer to use than Cmd.exe or the WSL/Ubuntu-20.04 terminal.

Creating a custom prompt for PowerShell:

* [Custom Prompt](https://docs.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup)
* [Oh My PoSh](https://ohmyposh.dev/docs/installation/windows)
* `$PROFILE` at  `~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`  
  (see `echo $PROFILE` for current location of PowerShell profile)

My PowerShell files:

* Profile: [Microsoft.PowerShell_profile.ps1](./pwsh/Microsoft.PowerShell_profile.ps1)
(placed at the location specified with `$PROFILE`)
* Prompt: [prompt-theme.omp.json](./pwsh/oh-my-posh/prompt-theme.omp.json)
(placed at the location specified in the PowerShell profile)
* Placement of these files is not yet automated with my config setup scripts.

## Web Dev on Windows

* vim (EG [gvim](https://www.vim.org/download.php)
-- `C:\Program Files (x86)\Vim\vim82`)  
  When using the installer, be sure to check the "create .bat files" option so
  vim/gvim will work in the terminal/console, as explained
  [here](https://stackoverflow.com/questions/10049316/how-do-you-run-vim-in-windows).
  (All of these become available: view, vim, vimdiff, vimtutor, evim, gview,
  gvim, gvimdiff.)
* git (EG [git-scm](https://git-scm.com/download/win))
* [nvm-windows](https://github.com/coreybutler/nvm-windows)
(node version manager for windows)  
 Using `nvm-setup.exe`  
 Use this to install node: EG `nvm install 16` and then `nvm use 16.x.y`

## PuTTY

Access: After installing PuTTY, you can create a link/shortcut to the app so it
shows up in Search.

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

## Miscellaneous

To solve error of not having `mysql_config` (utility):  
`sudo apt-get install libmysqlclient-dev`

Maybe need to do this too:  
`sudo apt-get install python3.10-dev`

VSCode (Visual Studio Code) in WSL2 seems to have a problem with the
markdownlint config file (maybe related to file-update-notification):  
<https://github.com/DavidAnson/vscode-markdownlint/issues/103>  
I'll try restarting/rebooting to see if it gets fixed: no, didn't get fixed.
