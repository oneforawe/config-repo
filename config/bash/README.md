## bash config files

For an explanation of bash, one can start with the bash man page.  Below I
summarize some of my imperfect understanding.

When bash is invoked as a login shell (interactive or non-interactive with the
`--login` option), it executes `/etc/profile` and then the first existing,
readable file in this list: `~/.bash_profile`, `~/.bash_login`, `~/.profile`.

The file `/etc/profile` is the system-wide initialization file, executed for
login shells for all users.  The other three initialization files are
user-specific, located in a user's home directory (<code>~</code>).  The file
`~/.profile` in particular is included for backwards compatibility, since that's
the login script filename used by the original Bourne shell `/bin/sh`.

When bash is invoked as a non-login shell, it executes this file, if it exists:
`~/.bashrc`.

Each of these files may `source` other files, that is, refer bash to those other
files for execution.


## plan

So, my plan is the following:

<table>
  <tbody>
    <tr>
      <th> file         </th>
      <th> abbr purpose </th>
      <th> purpose      </th>
    </tr>
    <tr>
      <td>  <code>.bash_profile</code>
      </td>
      <td>  login
      </td>
      <td>  contain login-shell configs via re-directs to <code>.profile</code>
            and <code>.bash_login</code> and via a conditional re-direct to
            <code>.bashrc</code> (for interactive login shells)
      </td>
    </tr>
    <tr>
      <td>  <code>.profile</code>
      </td>
      <td>  login, non-bash
      </td>
      <td>  contain non-bash-specific login-shell configs for shells (eg,
            <code>sh</code> or <code>bash</code> invoked as <code>sh</code>)
            and graphical applications(?)
      </td>
    </tr>
    <tr>
      <td>  <code>.bash_login</code>
      </td>
      <td>  login, bash
      </td>
      <td>  contain bash-specific login-shell-specific configs
      </td>
    </tr>
    <tr>
      <td> <code>.bashrc</code>
      </td>
      <td>  interactive
      </td>
      <td>  contain bash-specific interactive-shell configs
      </td>
    </tr>
    <tr>
      <td>  other bash config files
      </td>
      <td>  organization
      </td>
      <td>  For organizational purposes, some blocks of code may be kept in
            separate files, sourced by the middle three files in this table.
            For example, three files (<code>.bashrc_prompt</code>,
            <code>.bashrc_aliases</code>, <code>.bashrc_etc</code>) are sourced
            by <code>.bashrc</code>.
      </td>
    </tr>
  </tbody>
</table>


## references

* https://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc
* https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc
* http://tristram.squarespace.com/home/2012/7/20/why-profile-bash_profile-and-bash_login.html
* https://serverfault.com/questions/261802/what-are-the-functional-differences-between-profile-bash-profile-and-bashrc
* http://mywiki.wooledge.org/DotFiles

