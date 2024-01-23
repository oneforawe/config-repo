# Web Dev

For web development in JavaScript / TypeScript, will want:

* General Development
  * Version Control  
    For example, [git](https://git-scm.com/downloads) -- git is the
    "stupid content tracker", for file/project version control and
    downloading/uploading. It's possible you already have this installed by
    default. If using MacOS with Homebrew, you can use brew to install git.

* Back-end / Runtime: [Node](https://nodejs.org/en/)
  ([nvm](https://github.com/nvm-sh/nvm), node, npm, npx)  
  See the Further Notes below for more details.

* Front-end / Browser: [Chrome](https://www.google.com/chrome/), using its
  [DevTools](https://developer.chrome.com/docs/devtools) and
  [Redux DevTools](https://chromewebstore.google.com/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd)

## Further Notes

### Node

Node.js (aka NodeJS, node, etc) is a back-end (non-browser) runtime environment
for JavaScript, with an associated shell command `node`.  Note that with node
installed, you will also have the [npm](https://www.npmjs.com/) (node package
manager) `npm` utility at your command, which connects with an enormous registry
of useful Node/JavaScript packages, and the `npx` utility, which allows you to
run an arbitrary command from an npm package (either one installed locally, or
fetched remotely).

In a command-line interface, also known as a CLI or (virtual) terminal, you can
find out if you already have node installed.  If the shell running your terminal
is bash or zsh, these instructions will work for you.  You can confirm either of
these two shells by executing the command `echo $0` and seeing that bash or zsh
is printed (with a dash in front if it's acting as a login shell).

You can execute `command -V node`, and if the result shows a path location of
"node", such as `usr/bin/node`, then you've already got it installed, otherwise
it will tell you that node is "not found".  The command `node -v` will show you
the version.  You might want to upgrade if your version is, say, below version
20 -- you should prefer to use the "Active LTS" (Long-Term Support) release of
node, or a "Maintenance LTS", which you can find
[here](https://nodejs.org/en/about/releases/).  (You can use `command -V npm`
and `npm -v` too.)

If you don't have node installed, you could just go to the
[node website](https://nodejs.org/en/) and download from there, but you should
probably consider other methods, including using a package manager.  Here are
two good options:

* For development  
  If you intend on using node on an on-going basis during JavaScript/Node
development (or simply want to use a globally-installed npm package), it's best
to follow the instructions from
[nvm (node version manager)](https://github.com/nvm-sh/nvm) to install nvm and
node+npm.  As the
[npm docs](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally)
explain, installing node/npm with nvm "is the best way to avoid permissions
issues".  Also, with nvm you'll be able to quickly switch between versions of
node, if you ever need to -- and if you develop over the span of years, you will
probably need to or want to.

* For one-time use, production use, etc  
  If you intend on just using node for a one-time implementation (and without
using globally-installed npm packages), you can follow instructions from
[NodeSource](https://github.com/nodesource/distributions) to just install one
version of node+npm.  If using GNU/Linux apt and NodeSource, you can follow
step 1 in
[this tutorial](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-20-04).

Confirmation from
[Linuxize](https://linuxize.com/post/how-to-install-node-js-on-ubuntu-18.04/):
"If you need Node.js only as a local runtime for deploying Node.js applications
then the simplest option is to install Node.js from the NodeSource repository.
Developers should prefer installing Node.js using the NVM script."  This is
further confirmed on
[stackoverflow](https://stackoverflow.com/questions/28017374/what-is-the-suggested-way-to-install-brew-node-js-io-js-nvm-npm-on-os-x)
(see the 2nd "2019 update" answer).

Note that, if not using a package manager (such as
[apt](https://en.wikipedia.org/wiki/APT_(software)) for GNU/Linux or
[Homebrew](https://brew.sh/) for MacOS), you may have to take more steps if you
want to keep your software up-to-date.  For instance, you can use the same
"curl" or "wget" command to update nvm as the one used to install it (if a newer
file is referenced?).  And you can install more versions of node+npm and switch
between them; see `nvm --help` for more info.  Note also that your
globally-installed packages (seen with `npm ls -g --depth 0`) will change when
switching between versions.

(Also, for your information, if you're using MacOS with Homebrew, `brew doctor`
will give a long warning about node, but that warning can just be ignored.)
