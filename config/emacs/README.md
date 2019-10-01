
# emacs

GNU Emacs, or Emacs, is a very versatile and powerful text editor that can run
on many systems (including GNU/Linux, MacOS, and MS Windows), but was designed
provide the GNU operating system with a powerful editor.  Enter `man emacs` in
the shell for info on usage.  For instance, to edit a file, such as
`~/file.txt`, enter the program name (emacs) and the path to the file to be
edited in the shell, `emacs ~/file.txt`, or navigate to the location of the file
(in this case your home directory `~`) and execute using just the file name:
`emacs file.txt`.

To learn more about emacs, you can enter `emacs` on its own in the shell,
without referring to a file, and emacs provides a menu showing how to access
help, the manual, a tutorial, etc.  In the shell you can also enter
`info emacs` to see its info file.

And for more info from the GNU website itself, see  
  https://www.gnu.org/software/emacs


## note

This set of configurations is probably the most disorganized and aesthetically
displeasing of all my configuration files.  Over time it should improve as I
hone it further.


## configurations

I'll note a couple major configurations here.  I've configured my emacs editor
to use vi key-bindings (using "evil").  I've also configured it to use Org Mode
(and evil-org-mode).

For more info, see  
  https://orgmode.org  
  https://github.com/Somelauw/evil-org-mode


## reference

For the record, and for troubleshooting when things go wrong, I'll (try to) put
all of the submodule commands here.  They normally won't need to be used.  If
using them, be sure to navigate to the correct folder before executing, or give
the full path to the submodule at the end of the command.

* `git submodule add https://github.com/emacs-evil/evil evil`
* `git submodule add https://code.orgmode.org/bzg/org-mode.git org`
* `git submodule add https://github.com/somelauw/evil-org.git evil-org`

