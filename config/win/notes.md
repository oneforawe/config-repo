# Notes on Microsoft Windows

## WSL: Windows Subsystem for Linux

There are multiple ways to use Linux with Windows, but if using Windows 10
version 2004 and higher (Build 19041 and higher) or Windows 11, one can use WSL
to run a GNU/Linux environment -- including most command-line tools, utilities,
and applications -- directly on Windows, unmodified, without the overhead of a
traditional virtual machine or dual-boot setup.

https://docs.microsoft.com/en-us/windows/wsl/

EG: Install Ubuntu-20.04 and access it in several ways, most conveniently
through a virtual-terminal app called 'Ubuntu 20.04 LTS'.  You can shut down
the Linux system using PowerShell with command `wsl --shutdown`.

Note: WSL Ubuntu uses System V, not systemd for process management.

## WSL Interaction

* Start a WSL Ubuntu instance
  * what's the best way?
* PowerShell Commands
  * `wsl -l`
  * `wsl -l -v`
  * `wsl --list --running`
  * `wsl --shutdown`
  * `wsl --terminate <distro>`

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


## Ubuntu 20.04 LTS

With the Ubuntu terminal open, right-click/double-finger-on-pad-click on the
top bar of its window, and a drop-down menu appears.  Select "Properties" from
the menu.  You can change the font here.  I presume you'll have to change the
font in the "Defaults" selection to make the changes permanent/persistent.


## Windows Terminal

Consider using the "Windows Terminal".