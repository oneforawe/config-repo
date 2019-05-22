## bash config files

For an explanation of bash, one can start with the bash man page.  Below I
summarize some of my imperfect understanding.

When bash is invoked as a login shell (interactive or non-interactive with the
`--login option`), it executes `~/etc/profile` and then the first existing,
readable file in this list: `~/.bash_profile`, `~/.bash_login`, `~/.profile`.

The file `profile` is the system-wide initialization file, executed for login
shells for all users.  The file `.profile` is included for backwards
compatibility, since that's the login script filename originally used by
`/bin/sh`.

When bash is invoked as a non-login interactive shell, it executes this file,
if it exists: `~/.bashrc`.

Each of these files may `source` other files, that is, refer bash to those files
for execution.

## plan

So, my plan is the following:

| file            | purpose |
| --------------- | ------- |
| `.profile`      | contain non-bash-specific configs for shells (eg, `sh` or `bash` invoked as `sh`) and graphical applications(?) |
| `.bashrc`       | contain bash-specific interactive-shell configs |
| `.bash_login`   | contain bash-specific login-shell-specific configs |
| `.bash_profile` | contain re-directs to `.profile`, `.bash_login`, and `.bashrc` |
| other bash config files | for organizational purposes, some blocks of code may be kept in separate files, sourced by the top three files in this table |

## references

* https://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc
* https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc
* http://tristram.squarespace.com/home/2012/7/20/why-profile-bash_profile-and-bash_login.html
* https://serverfault.com/questions/261802/what-are-the-functional-differences-between-profile-bash-profile-and-bashrc
* http://mywiki.wooledge.org/DotFiles
