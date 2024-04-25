# Notes on Microsoft Windows

## Win 10

For work, I'm using a Windows 10 system without access to the Microsoft/Windows
Store.

## Secondary Machine

In addition to the physical laptop with Windows, I have access to a remote
virtual machine as another development environment, which has become my primary
development environment for work.  I call it DevVM.

* Access via Citrix Workspace 2210 (and shortcut "IT" app to DevVM desktop)
* Installed Software (more detail further below)
  * OS: Windows 10
  * Outlook
  * RingCentral
  * Box (Box Drive)
  * Visual Studio Code
  * Visual Studio (Professional 2022 LTSC)
  * Microsoft SQL Server 2019 64-bit (with Management Studio)
  * Windows Terminal
  * Oh My Posh
  * Vim for Windows
  * Git for Windows
  * NVM for Windows (for Node 18, etc)
  * WSL2 (Windows Subsystem for Linux)
  * PuTTY (release 0.77 64-bit)
  * Remote Desktop Connection (already installed by default?)

## Admin Account

With my replacement laptop, I'll need to press shift and right-click on an
executable to "Run as different user" and then sign in with my `_admin` account
to run as a local administrator.

## Remap Keys

For better keyboard ergonomics, you can use PowerToys to remap the CAPS-LOCK key
as another Control key.  Or (if on a Windows system without PowerToys) you can
directly edit the registry to remap.  See, for example, [this superuser forum
answer](https://superuser.com/questions/949385/map-capslock-to-control-in-windows-10).

I saved a copy of this registry file [here](./remap/caps-to-control.reg).

They say I should be able to see the changes after logging/signing out and back
in, but I'm not seeing it yet (on a remote machine).  Maybe I'll have to reboot.
Nope; rebooting didn't help, but I found a solution:

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

## RDC

In Remote Desktop Connection, besides the settings mentioned for Remap Keys, one
can also conveniently make the origin filesystem available to the remote system,
with the following setting.

* `Options` > `Local Resources` > `Local devices and resources` > `More...` >
`[X] Drives`

One can also export and import (save and open) the settings as/from `.rdp`
(Remote Desktop Protocol) files.

## Citrix

Citrix Workspace gives a list of available desktops, and with my current set-up
the DevVM (development virtual machine) is called "IT" in that list.  (It's
currently the only desktop in the list).  There's also a shortcut called "IT"
(App) that directly opens the DevVM.  (I'm not sure how to rename it to be
called "DevVM" instead.)

Using the Citrix connection to the DevVM, the resolution is sometimes not very
good.  To fix the resolution:

* Open the Windows task bar (lower-right) notification area and make sure that
the "Citrix Workspace" (reciever) icon is present.  If not, start the
"Citrix Workspace" (receiver) app from the Windows search.
* Open the Windows task bar notification area and right-click the
"Citrix Workspace" receiver icon.
* Select Advanced Preferences and click the "High DPI" settings.  The DPI
settings dialog appears, with the question "Scale the session for high
resolution?".
* Change the settings as required. By default, the option "Let the operating
system scale the resolution" is selected.  Instead, select "No, use the native
resolution".
* Select Save.
* Restart the "Citrix Workspace" receiver for the Windows session for the
changes to take effect.  (Right-click on the receiver icon again and select
"Exit", then start the "Citrix Workspace" app from the Windows search.)

Reference:
[source](https://cloud9hosting.com/hosting/knowledgebase/10241/How-do-I-change-display-settings-in-Citrix-Receiver.html)

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

* Help, Update-Help, Get-Help
* Get-Command
* Get-Member
* Find-Module

## Windows Terminal

Use the [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701).
Though it was a pain to install (needing
[manual installation](https://docs.microsoft.com/en-us/windows/terminal/install)
via GitHub since I don't have access to the Microsoft/Windows Store), it ended
up being much nicer to use than Cmd.exe or the WSL/Ubuntu-20.04 terminal.

### Install Notes

Some install notes (from my second install on a new replacement work laptop):

* On the GitHub page, followed instructions to find an installer, downloaded it,
  and attempted to install (but it fails, needing a supporting framework):  
  `Add--AppxPackage .\Microsoft.WindowsTerminal_1.19.10821.0_8wekyb3d8bbwe.msixbundle`
  * Error message (ellipsed):

    Windows cannot install package
    Microsoft.WindowsTerminal_1.19.10821.0_x64__8wekyb3d8bbwe
    because this package depends on a framework that could not be found. Provide
    the framework "Microsoft.UI.Xaml.2.8" published by...

* Downloaded `Microsoft.VSLibs.x64.14.00.Desktop.appx` and ran in PowerShell  
  `Add-AppxPackage .\Microsoft.VSLibs.x64.14.00.Desktop.appx`  
  (not sure if this was necessary)
* Found necessary steps [here](https://github.com/microsoft/winget-cli/issues/1861)
  to get `Microsoft.UI.Xaml.2.8.appx` without using the Microsoft Store:
  * Download this NuGetPackage: <https://www.nuget.org/packages/Microsoft.UI.Xaml/>
  * Unzip it (change file extension to `.zip` if needed).
  * Enter the resulting folder.
  * Go to `.\tools\AppX\{arch}\Release\` and install it with PowerShell:  
    `Add-AppxPackage .\Microsoft.UI.Xaml.2.8.appx`
* Then I could successfully install Windows Terminal:  
  `Add--AppxPackage .\Microsoft.WindowsTerminal_1.19.10821.0_8wekyb3d8bbwe.msixbundle`
* From there, the app should be available as "Terminal". Might need to restart.
  (I did restart but not sure if I had to.)

### Profile and Prompt

Creating a custom prompt for PowerShell:

* [Custom Prompt](https://docs.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup)
* [Oh My PoSh](https://ohmyposh.dev/docs/installation/windows)
* `$PROFILE` at  `~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`  
  (see `echo $PROFILE` for current location of PowerShell profile)

My PowerShell files:

* Profile: [Microsoft.PowerShell_profile.ps1](./pwsh/Microsoft.PowerShell_profile.ps1)
(placed at the location specified with `$PROFILE`)  
  `New-Item -ItemType Directory ~\Documents\WindowsPowerShell`  
  `Copy-Item -Path ~\.config-repo\config\win\pwsh\Microsoft.PowerShell_profile.ps1 -Destination ~\Documents\WindowsPowerShell\ -PassThru`
* Prompt: [prompt-theme.omp.json](./pwsh/oh-my-posh/prompt-theme.omp.json)
(placed at the location specified in the PowerShell profile)  
  `New-Item -ItemType Directory ~\.config`  
  `New-Item -ItemType Directory ~\.config\oh-my-posh`  
  `Copy-Item -Path ~\.config-repo\config\win\pwsh\oh-my-posh\prompt-theme.omp.json -Destination ~\.config\oh-my-posh\ -PassThru`
* Settings: After installing a Nerd Font, change the Windows Terminal settings
to use that font.
* Placement of these files is not yet automated with my config setup scripts.

Git Segment:

* See the OhMyPosh website [git section](https://ohmyposh.dev/docs/segments/git)
for an explanation of the cryptic symbols (`+`, `-`, `~`, `?`) in the prompt's
git segment.
* More symbols:
  * `\uF044` edit-icon (pencil-to-paper) -- Working (editing in progress, correct?)
  * `\uF046` check-icon (check-in-box) -- Staging (commits made, correct?)
  * `\uF692` save-icon (floppy-disk) -- Stashed (uncommited edits saved/stashed)

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
* More Commands
  * [WSL basic commands](https://learn.microsoft.com/en-us/windows/wsl/basic-commands)

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

## Web Dev on Windows

* vim (EG [gvim](https://www.vim.org/download.php)
-- `C:\Program Files\Vim`)  
  (Previously `C:\Program Files (x86)\Vim\vim82`)
  When using the installer, be sure to check the "create .bat files" option so
  vim/gvim will work in the terminal/console, as explained
  [here](https://stackoverflow.com/questions/10049316/how-do-you-run-vim-in-windows).  
  (All of these become available: view, vim, vimdiff, vimtutor, evim, gview,
  gvim, gvimdiff.)  
  Can "Remap a few keys for Windows" (eg, Ctrl-V, Ctrl-C, etc)
  Settings: open PowerShell as an admin user (create folders as needed) and
  either
  * create copies
    * `Copy-Item -Path C:\Users\USERNAME\.config-repo\config\vim\vimrc -Destination C:\Users\USERNAME\vimfiles\ -PassThru`
    * `Copy-Item -Path C:\Users\USERNAME\.config-repo\config\vim\vim.d\colors\zenburn.vim -Destination C:\Users\USERNAME\vimfiles\colors\ -PassThru`
  * or create links
    * `New-Item -ItemType SymbolicLink -Path C:\Users\USERNAME\vimfiles\vimrc -Target C:\Users\USERNAME\.config-repo\config\vim\vimrc`
    * `New-Item -ItemType SymbolicLink -Path C:\Users\USERNAME\vimfiles\colors\zenburn.vim -Target C:\Users\USERNAME\.config-repo\config\vim\vim.d\colors\zenburn.vim`
* git (EG [git-scm](https://git-scm.com/download/win), also promoted
  [here](https://gitforwindows.org/)), and most recent installation settings:
  * use default folders/locations
  * (can de-select the "Windows Explorer integration" options for "Open Git Bash
    here" and "Open Git GUI here" since I don't use those)
  * use Vim as Git's default editor  
    (and I think this should use the vim/gvim app already installed)
  * can let Git decide on default branch name  
    (and I use other config files for my preference)
  * select "Git from the command line and also from 3rd-party software"  
    (no need for optional Unix tools)
  * use external OpenSSH
  * use the OpenSSL library  
    (for this option, "Server certificates will be validated using the
    `ca-bundle.crt` file.")  
    (not sure if I should be using the native Windows Secure Channel library --
    "Server certificates will be validated using Windows Certificate Stores.
    This option also allows you to use your company's internal Root CA
    certificates distributed e.g. via Active Directory Domain Services.)
  * use the second "input" option:
    * Checkout Windows-style, commit Unix-style line endings  
      Git will convert LF to CRLF when checking out text files. When committing
      text files, CRLF will be converted to LF. For cross-platform projects,
      this is the recommended setting on Windows ("core.autocrlf" is set to
      "true").
    * Checkout as-is, commit Unix-style line endings  
      Git will not perform any conversion when checking out text files. When
      committing text files, CRLF will be converted to LF. For cross-platform
      projects, this is the recommended setting on Unix ("core.autocrlf" is set
      to "input").
    * Checkout as-is, commit as-is  
      Git will not perform any conversion when checking out or committing text
      files. Choosing this option is not recommended for cross-platform projects
      ("core.autocrlf" is set to "false").
  * can use the first option for Git Bash (but I don't use Git Bash)
    * Use MinTTY (the default terminal of MSYS2)
    * Use Windows' default console window
  * default for `git pull` (pick first? it's selected by default, even though
    the third option is "standard")
    * Fast-forward or merge  
      Fast-forward the current branch to the fetched branch when possible,
      otherwise create a merge commit.
    * Rebase  
      Rebase the current branch onto the fetched branch. If there are no local
      commits to rebase, this is equivalent to a fast-forward.
    * Only ever fast-forward  
      Fast-forward to the fetched branch. Fail if that is not possible. This is
      the standard behavior of `git pull`.
  * Don't use a credential helper. Choose second option.
    * Git Credential Manager
    * None
  * Can enable both extra (non-experimental) optional features
    * Enable file system caching  
      File system data will be read in bulk and cached in memory for certain
      operations ("core.fscache" is set to "true"). This provides a significant
      performance boost.
    * Enable symbolic links
      Enable symbolic links (requires the SeCreateSymbolicLink permission).
      Please note that existing repositories are unaffected by this setting.
* [nvm-windows](https://github.com/coreybutler/nvm-windows)
  (node version manager for windows)
  * Installing/Upgrading NVM for Windows  
    Install: `nvm-setup.exe` (via `nvm-setup.zip`)  
    Upgrade: `nvm-update.exe` (via `nvm-update.zip`)
  * Installing versions of Node  
    EG: `nvm install 16` and then `nvm use 16.x.y`
* ssh (see
[instructions](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement)
)

## Data Science on Windows

* Anaconda - [download](https://docs.anaconda.com/free/anaconda/install/windows/)

Once installed, both "Anaconda Prompt" and "Anaconda Powershell Prompt" can be
added to Windows Terminal.

See instructions here below. A reference with slightly different instructions is
[here](https://dev.to/azure/easily-add-anaconda-prompt-in-windows-terminal-to-make-life-better-3p6j).

In the Windows Terminal Settings, you can "Add a new profile" for each Anaconda
shell / "Prompt", starting by duplicating another profile (such as "Command
Prompt" and "Windows PowerShell").  You can get the appropriate command
("Command line") by searching for the app (EG, "Anaconda Prompt") in the Windows
search, right-clicking on the app, selecting "Open file location",
right-clicking on the app, selecting "Properties", and copying the Shortcut
Target.  That "target" can be simplified for the Terminal profile.

* Anaconda Prompt
  * Command:  
    `cmd.exe /K %USERPROFILE%\AppData\Local\anaconda3\Scripts\activate.bat`
* Anaconda Powershell Prompt
  * Command:  
    `powershell.exe -ExecutionPolicy ByPass -NoExit -Command "& '%USERPROFILE%\AppData\Local\anaconda3\shell\condabin\conda-hook.ps1' ; conda activate '%USERPROFILE%\AppData\Local\anaconda3' "`
  * Icon:  
    `%USERPROFILE%\AppData\Local\anaconda3\Menu\anaconda-navigator.ico`

## PuTTY

When installing
[PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html),
you can get a whole set of utilities (eg, including puttygen) that are useful
to have.

* EG, PuTTY for Windows 10 (64 bit, amd) -- putty-64bit-0.77-installer.msi

Access: After installing, if PuTTY is not already showing up in Search you can
create a link/shortcut to the app.  It can be installed generally or per user.
I now have it installed generally, but when I had installed just in my user
space, I placed the file and shortcut in these locations:

* Program  
  `C:\Users\andrew.forrester\AppData\Local\Programs\PuTTY\putty.exe`
* Shortcut  
  `C:\Users\andrew.forrester\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\PuTTY\PuTTY`

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

Export/Import Settings:

* Exporting PuTTY settings:  
  `reg export HKCU\Software\SimonTatham\PuTTY\Sessions ([Environment]::GetFolderPath("Desktop") + "\putty-sessions.reg")`
* Importing PuTTY settings:  
  `reg import putty-sessions.reg`

Usage Issue:

* The PuTTY program's
[system menu](https://documentation.help/PuTTY/using-sysmenu.html) should have
"extra program features" that allow you to, for example, start a new session.
For some reason, I don't see those features in the system menu, so to add a new
session, I have to use a non-user-friendly approach:
  * Type in a new session name in the "Saved Sessions" field.
  * This may cause a saved session name to become highlighted, maybe the closest
    name alphabetically to the new name that you've typed.  Ignore that
    highlighting.
  * Hit the "Save" button to add that new session option to the saved list.
  * Now that new session option/config can be edited to suit the new connection.

## Miscellaneous

To solve error of not having `mysql_config` (utility):  
`sudo apt-get install libmysqlclient-dev`

Maybe need to do this too:  
`sudo apt-get install python3.10-dev`

VSCode (Visual Studio Code) in WSL2 seems to have a problem with the
markdownlint config file (maybe related to file-update-notification):  
<https://github.com/DavidAnson/vscode-markdownlint/issues/103>  
I'll try restarting/rebooting to see if it gets fixed: no, didn't get fixed.
