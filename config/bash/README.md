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

When bash is invoked as a non-login shell, it executes this file, if it exists:
`~/.bashrc`.

Each of these files may `source` other files, that is, refer bash to those ohter
files for execution.

## plan

So, my plan is the following:

| file            | abbr purpose    | purpose |
| --------------- | --------------- | ------- |
| `.bashrc`       | interactive     | contain bash-specific interactive-shell configs |
| `.profile`      | login, non-bash | contain non-bash-specific login-shell configs for shells (eg, `sh` or `bash` invoked as `sh`) and graphical applications(?) |
| `.bash_login`   | login, bash     | contain bash-specific login-shell-specific configs |
| `.bash_profile` | login           | contain login-shell configs via re-directs to `.profile` and `.bash_login` and via a conditional re-direct to `.bashrc` (for interactive login shells) |
| other bash config files | organization | For organizational purposes, some blocks of code may be kept in separate files, sourced by the top three files in this table.  For example, three files (`.bashrc_prompt`, `.bashrc_aliases`, `.bashrc_etc`) are sourced by `.bashrc`. |


## (experimenting with source: html instead of markdown)

<div  markdown=1>

<table>
  <tbody>
    <tr>
      <th> file         </th>
      <th> abbr purpose </th>
      <th> purpose      </th>
    </tr>
    <tr>
      <td>

            `.bashrc`

      </td>
      <td>  interactive
      </td>
      <td>  contain bash-specific interactive-shell configs
      </td>
    </tr>
    <tr>
      <td markdown=1>

                       `.profile`

      </td>
      <td markdown=1>  login, non-bash
      </td>
      <td markdown=1>  contain non-bash-specific login-shell configs for shells
                       (eg, `sh` or `bash` invoked as `sh`) and graphical
                       applications(?)
      </td>
    </tr>
    <tr>
      <td>  `.bash_login`
      </td>
      <td>  login, bash
      </td>
      <td>  contain bash-specific login-shell-specific configs
      </td>
    </tr>
    <tr>
      <td markdown=1>  `.bash_profile`
      </td>
      <td markdown=1>  login
      </td>
      <td markdown=1>  contain login-shell configs via re-directs to
                       `.profile` and `.bash_login` and via a conditional
                       re-direct to `.bashrc` (for interactive login shells)
      </td>
    </tr>
    <tr>
      <td markdown=1>  other bash config files
      </td>
      <td markdown=1>  organization
      </td>
      <td markdown=1>  For organizational purposes, some blocks of code may be
                       kept in separate files, sourced by the top three files
                       in this table.  For example, three files
                       (`.bashrc_prompt`, `.bashrc_aliases`, `.bashrc_etc`)
                       are sourced by `.bashrc`.
      </td>
    </tr>
  </tbody>
</table>

</div>


## references

* https://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc
* https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc
* http://tristram.squarespace.com/home/2012/7/20/why-profile-bash_profile-and-bash_login.html
* https://serverfault.com/questions/261802/what-are-the-functional-differences-between-profile-bash-profile-and-bashrc
* http://mywiki.wooledge.org/DotFiles

