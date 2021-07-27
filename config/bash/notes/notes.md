
# notes on bash

## General Reference

* [bash on Wikipedia](https://en.wikipedia.org/wiki/Bash_(Unix_shell))
* [official bash site](https://www.gnu.org/software/bash/)
* [bash manual options](https://www.gnu.org/software/bash/manual)
* [reference manual](https://www.gnu.org/software/bash/manual/bash.html)


## Intro

Maybe the best intro to bash would be a practical demonstration showing how to
execute some task that's important to you right now.  For example, copying files
or creating an ssh key-pair for securely connection to a remote machine.  With
that context, learning the general ideas and technologies involved would be
well-motivated.

One can become overwhelmed with all of the documentation and resources to get
familiar with bash, so, as with any complicated topic, it's probably best to
take an iterative approach to learning.

Here I'll try to give a broad overview of what bash is and how to learn more
about it, with emphasis on it's own commands, tools, and self-documentation.


## GNU

Bash is a part of the
[GNU](https://www.gnu.org/software/software.html)/[Linux](https://en.wikipedia.org/wiki/Linux)
operating system, although it's available in Apple (MacOS) and Microsoft
(Windows) systems too.  It's full name is
[GNU Bash](https://www.gnu.org/software/bash/), where the name "Bash" stands for
"the Bourne Again SHell" - a pun derived from an earlier shell called the Bourne
Shell.


## Shell

Bash is a shell.  A shell is a computer program that gives a user access to and
control of the computer at a fairly deep level.  To get an idea of what a
[shell](https://en.wikipedia.org/wiki/Shell_(computing)) is and what role it
plays in an operating system, especially with respect to the
[kernel](https://en.wikipedia.org/wiki/Kernel_(operating_system)), here are
some simplified diagrams, hopefully giving a useful first-iteration
perspective, even if they're a little over-simplified.

<a href="https://jaguhiremath62.medium.com/difference-between-kernel-and-shell-718b3de15be6">
<img
  src="./images/shell_kernel_app.png"
  alt="shell vs kernel vs apps"
  width="350"/>
</a>

<a href="https://www.meted.ucar.edu/ucar/unix/navmenu.php?tab=1&page=2-1-0&type=flash">
<img
  src="./images/shell_context_unix.jpg"
  alt="shell context unix"
  width="350"/>
</a>

<a href="https://www.elprocus.com/unix-architecture-and-properties/">
<img
  src="./images/shell_unix_architecture.jpg"
  alt="shell unix architecture"
  width="350"/>
</a>

A shell is a program that provides commands and a language/syntax to chain the
commands together.

Usually a user accesses a shell through either a physical terminal (keyboard
and screen), or a "virtual terminal" (a graphical user interface, or GUI,
application accessible through the GUI portion of an operating system).  One
can thus say that one usually uses a virtual terminal that is "powered by" a
specific shell.  The shell and terminal are also called a command-line
interface or CLI.

Bash is a shell, but there are many other shells, such as sh (the Thompson
shell and then the Bourne Shell), csh (the C shell), tcsh (the he TENEX C
shell), ksh (the Korn shell), zsh (the Z Shell), fish (the friendly interactive
shell), rc (run commands), ash, es, dash, sash, etc.  Here are some
[shell comparisons](https://hyperpolyglot.org/unix-shells).


## Scripting language

A shell program comes along with its own built-in commands and its own
programming language or scripting language.  This allows a person to construct
compound commands from the built-in commands, and construct large sequences of
commands that can be saved in a file (a "script") and executed at once or in
"batch" form.

So "bash" can refer to the shell program and the scripting language that the
bash shell uses.


## Bash Commands

Here are some important orienting bash commands:

<table>
 <thead>
  <tr>
    <td>Command</td>
    <td>
      Example Usage<br/>
      <code>&#x2011;&#x2011;&#x2011;&#x2011;&#x2011;&#x2011;&#x2011;&#x2011;&#x2011;&#x2011;&#x2011;&#x2011;&#x2011;&#x2011;&#x2011;</code>
    </td>
    <td>Notes</td>
  </tr>
 </thead>
 <tbody>
  <tr>
    <td><code>help</code></td>
    <td>
      <code>help</code><br/>
      <code>help help</code><br/>
      <code>help cd</code><br/>
      <code>help compgen</code>
    </td>
    <td>
      <code>help [built-in command]</code><br/>
      See GNU bash help info, including further suggested help commands and a
      bash built-in commands list.  Notice that the <code>help cd</code> output
      explains the options/flags for the command <code>cd</code>, but
      <code>help compgen</code> does not explain the options for
      <code>compgen</code>.  For that explanation we'll have to use
      <code>info</code>.
    </td>
  </tr>
  <tr>
    <td><code>info</code></td>
    <td>
      <code>info</code><br/>
      <code>info info</code><br/>
      <code>info bash</code><br/>
    </td>
    <td>
      "Info reader"<br/>
      Start with <code>info info</code> to learn how to use it.
    </td>
  </tr>
  <tr>
    <td>
      <code>man</code><br/>
      <code>man man</code><br/>
      <code>man bash</code><br/>
      <code>man ls</code>
    </td>
    <td></td>
    <td>
      <code>man [command]</code><br/>
      Access a manual page for the command <code>[command]</code>.
    </td>
  </tr>
  <tr>
    <td><code>bash</code></td>
    <td>
      <code>bash</code><br/>
      <code>bash --help</code><br/>
      <code>bash [filename]</code>
    </td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
  </tr>
 </tbody>
</table>


## More Links

Beginners?:

* [guide for beginners](http://tldp.org/LDP/Bash-Beginners-Guide/html/index.html)

Scripting:

* [bash scripting tutorial](https://linuxconfig.org/bash-scripting-tutorial-for-beginners)
* [really nice scripting reference](https://devhints.io/bash)

System Admin:

* [SysAdmin Basics](https://www.linode.com/docs/tools-reference/linux-system-administration-basics/)
* [SysAdmin Tutorial](https://www.tutorialspoint.com/linux_admin/)