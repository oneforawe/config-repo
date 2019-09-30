
# readline

GNU Readline is a general utility for command-line interaction that can be used
by many different programs, giving a consistent experience across those
different programs.  In the file `inputrc` you can select a pre-defined key
mapping (emacs style by default, or vi style) or define your own custom key
mapping with individually defined key bindings (or "hot keys" or keyboard
"short-cuts", etc).


## un-ideal

In an ideal world, all of my preferred key bindings could be defined in one
place (say, the inputrc file here) and referred-to by all the different
programs.  Maybe that's possible, but I don't know how to do it yet.  So,
instead, I'll leave some notes here about all the places where I define my key
bindings and access information about them.

* Definitions
** `readline/inputrc`
** `bash/bashrc_opt`
** `zsh/zshrc_opt`
* Info
** Regarding readline
*** Get info:  
   `$ info` (and search for readline) or  
   `$ info rluserman`
** Regarding bash
*** Get info:  
   `$ man bash`  (search bind)  
   `$ help bind`
*** Get current map:  
   `$ bind -p`
** Regarding zsh
*** Get info:  
   `$ man 
   `$ man zshbuiltins`  (search bind or bindkey)  
   `$ man zshzle`  (z line-editor)  
   etc
*** Get current map:  
   `$ bindkey -L`
*** Override, switch current map:  
   `$ bindkey -e`  (switch to emacs)  
   `$ bindkey -v`  (switch to vi)
** Regarding vim
*** Get info:  
   `:help map`
*** Get current map:  
   `:map`
** Regarding emacs
*** Default key bindings, good reference:  
    https://caiorss.github.io/Emacs-Elisp-Programming/Keybindings.html
*** Get info:  
   `$ emacs`  (follow instructions to see help, manual, tutorial)  
   Can also see more info at:  
   `$ man emacs`
   `$ info emacs`
*** Get current map:  
   `C-h ? b`  (to see help options and select b to see all key bindings)  
   `C-h b`  (faster)

