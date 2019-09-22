
# emacs

GNU Emacs, or Emacs, is a text editor that can run on many systems (including
GNU/Linux, MacOS, and MS Windows), but was designed provide the GNU operating
system with a powerful editor.

For more info, see  
  https://www.gnu.org/software/emacs


## configurations

I've configured my emacs editor to use vi key-bindings (using "evil").  I've
also configured it to use Org Mode (and evil-org-mode).

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

