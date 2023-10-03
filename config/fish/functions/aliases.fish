#!/usr/bin/env fish
# filename: aliases.fish
# purpose: For defining custom commands in the shell.

# This file is sourced from ~/.config/fish/config.fish
# tried using bass to convert from bash to fish, but didn't figure it out


# aliases:
alias gs='git status'                        # show all the usual stuff
alias gss='git status --untracked-files=no'  # don't show untracked files
alias ga='git add'
alias gcm='git commit -m'
alias gpsuo='git push --set-upstream origin'
#alias ls='ls -d *[^~]'                     # mac version of "ls -B"
# (this didn't work for me; it changed ls)   # (ignore-backups)
# (behavior is zsh, in particular, so    )
# (folders weren't highlighted.          )
#
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'
#alias ..='cd ..'
#alias dff='df -hT | grep -vE "(tmpfs|Use%)"'
#alias svi='vi -u NONE +"set syntax=" +"set nowrap"'
#alias pu="pip3 list --outdated --format=columns"


# functions:
function ls_hide_backups {
    ls -d *[^~]  # mac version of "ls -B" (ignore-backups)
}
#alias ls=ls_hide_backups  # not-so-great: `ls foldername` doesn't work
alias l=ls_hide_backups


function which-tmux-session {
    # Print the current terminal tmux session name, if any.
    # ...This function doesn't seem to work.
    for s in $(tmux list-sessions -F '#{session_name}'); do
        tmux list-panes -F '#{pane_tty} #{session_name}' -t "$s"
    done | grep "$(tty)" | awk '{print $2}'
}

function ainow {
    #conda activate
    conda-on
    #move to active "ai" directory
    cd ~/Dev/Insight/ai-vision-for-endoscopy/source
}

function glt {
    # glt = git lfs track
    # first go to a folder such as
    # ~/Dev/Insight/ai-vision-for-endoscopy/output/train/Xcp_a/2-processed/by_abnorm/data_C/Run_01/
    cd histories
    git lfs track "*.pckl"
    git add .gitattributes
    git add *.pckl
    cd ../chkpts
    git lfs track "*.hdf5"
    git add .gitattributes
    git add *.hdf5
    cd ..
    # gcm "Track large files with git-lfs."
}

function git-create-branch {
    git checkout -b $1 # $1 = <branch-name>
    printf "Ready to (automatically) set origin and upstream connections? (yes/no) "
    read readytocontinue
    printf "\n"
    if [ "${readytocontinue}" != "yes" ]; then
        # Not ready. Stop.
        printf "That wasn't a yes. Stopping here.\n"
    else
        # Ready. Continue.
        #git push --set-upstream origin <upstream-branch-name>
        git push --set-upstream origin $1
        #git branch --set-upstream-to=origin/<upstream-branch-name> <branch-name>
        #git branch --set-upstream-to=origin/$1 $1  # NEED THIS??
        #git push origin <origin-branch-name>
        #git push origin $1
    fi
}

function factorial {
    local ARG="${1}"
    local re='^[0-9]+$'
    if ! [[ $ARG =~ $re ]] ; then
        printf "Error: need a positive integer\n"
        return 1
    fi
    if [[ $ARG -eq 0 ]] ; then
        echo 1
    else
        prev=$(factorial $[$ARG-1])
        printf "%s\n" $(( $ARG * prev ))
    fi
}

function vmlist
    VBoxManage list runningvms

function vmstate {
    printf '%s' "State of VM \"Kubuntu\": "
    VBoxManage showvminfo --machinereadable "Kubuntu" | grep ^VMState=
}

function vm {
    local name="${1:-Kubuntu}"
    local username="${2:-zero}"
    # Check if VM is running.
    if ! VBoxManage list runningvms | cut -d '"' -f 2 | grep -q "${name}" ; then
        # VM is not running.
        # Start VM.
        VBoxManage startvm --type headless "${name}"
        printf "Waiting for SSH connection...\n\n"
    fi
    # VM is running.
    local port=$(VBoxManage showvminfo "${name}" --machinereadable |
                 grep '^Forwarding(.*,22"' | cut -d , -f 4)
    # Connect to VM.
    ssh -t -p ${port} -o ConnectionAttempts=200 ${username}@localhost
    # `-t` added to see if I can get color in my shell
    #ssh -p ${port} -o ConnectionAttempts=200 ${username}@localhost
}

function xvm {
    # (using the -Y option for insecure/trusted X11/X-Window forwarding, for instance, while using XQuartz on a Mac to view PDFs from the virtual machine)
    # (EG: use an XQuartz shell/Terminal, execute "xvm" to enter VM, and execute "okular filename.pdf")
    local name="${1:-Kubuntu}"
    local username="${2:-zero}"
    # Check if VM is running.
    if ! VBoxManage list runningvms | cut -d '"' -f 2 | grep -q "${name}" ; then
        # VM is not running.
        # Start VM.
        VBoxManage startvm --type headless "${name}"
        printf "Waiting for SSH connection...\n\n"
    fi
    # VM is running.
    local port=$(VBoxManage showvminfo "${name}" --machinereadable |
                 grep '^Forwarding(.*,22"' | cut -d , -f 4)
    # Connect to VM.
    ssh -Y -p ${port} -o ConnectionAttempts=200 ${username}@localhost
}

function vmoff {
    local name="${1:-Kubuntu}"
    local username="${2:-zero}"
    local password="$3"
    local readytocontinue="no"
    # Check if VM is running.
    if ! VBoxManage list runningvms | cut -d '"' -f 2 | grep -q "${name}" ; then
        # VM is not running.
        printf "No need: No running VM to shut down.\n"
    else
        # VM is running.
        ##############################
        # Check for open/active shell sessions (in host with "ps").
        # ps | grep "${username}@localhost"
        # Check for open/active shell sessions (in guest with "who").
        #### I don't know how to get this to work (even when writing command out literally in shell by hand).
        # from https://unix.stackexchange.com/questions/232063/what-is-most-secure-and-simplest-way-to-have-a-user-typed-password-on-bash-becom
        #  and https://askubuntu.com/questions/908134/how-to-pass-shell-arguments-with-vboxmanage-guestcontrol
        #  and https://superuser.com/questions/547980/bash-script-to-wait-for-virtualbox-vm-shutdown
        ## unset -v password # make sure it's not exported
        ## set +a               # make sure variables are not automatically exported
        ## printf "\n\nEnter VM password (to check for open shell sessions): "
        ## IFS= read -rs password < /dev/tty &&
        ##   eval $(echo VBoxManage --nologo guestcontrol "${name}" run --exe "/usr/bin/who" --username "${username}" --password "${password}" --wait-stdout)
        ##   #eval $(ls /pathy/path/"${name}")
        ##   #eval $(VBoxManage --nologo guestcontrol "${name}" run --exe "/usr/bin/who" --username "${username}" --password "${password}" --wait-stdout)
        #if ! ##expression##; then
        #    # No open shell sessions.
        #    # "Graceful" shut down.
        #    #### VBoxManage controlvm "${name}" acpipowerbutton
        #    printf "Would-be shut-down."
        #else
        #    # There are open shell sessions.
        #    # Don't shut down.
        #    printf "FAIL: Kubuntu still on: close active shell sessions first."
        #fi
        ##############################
        # Check if user knows about open/active shells sessions.
        printf "Are you sure that:\n"
        printf " 1) the "head"/GUI is not running, and\n"
        printf " 2) there are no open/active shell sessions?  (yes/no)  "
        read readytocontinue
        printf "\n"
        if [ "${readytocontinue}" != "yes" ]; then
            # Not ready. Abort.
            printf "That wasn't a yes. Aborting.\n"
            printf "Note: you can check for open/active sessions with the \"ps\" commandor the \"who\" command within the VM.\n\n"
        else
            # Ready. Shut down.
            printf "Shutting down \"gracefully\" with acpipowerbutton.\n"
            VBoxManage controlvm "${name}" acpipowerbutton
            # Return prompt after VM is off.
            printf "Waiting for virtual machine ${name} to shut down.."
            #until [ ! $(VBoxManage list runningvms | cut -d '"' -f 2 | grep -q "${name}") ]; do
            until [ $(VBoxManage showvminfo --machinereadable "${name}" | grep ^VMState=.poweroff.) ]; do
                printf "."
                sleep 1
            done
            print "\n"
        fi
    fi
}

function vmtest {
    local name="${1:-Kubuntu}"
    local username="${2:-zero}"
    local password="$3"
    unset -v password # make sure it's not exported
    set +a            # make sure variables are not automatically exported
    printf "\n\nEnter VM password (to check for open shell sessions): "
    IFS= read -rs password < /dev/tty &&
      VBoxManage --nologo guestcontrol "${name}" run --exe "/usr/bin/who" --username "${username}" --password "${password}" --wait-stdout
    printf "${password}\n"
}




function title {
    echo -n -e "\033]0;$1\007"
}

function notify {
    message="${1:-Process complete}"
    options='title "Terminal" sound name "Ping"'
    script="display notification \"$message\" with $options"
    /usr/bin/osascript -e "$script"
}

alias ..="cd .."
alias ...="cd ../.."


function add_conda_anaconda_to_PATH {
    export PATH="/Users/zero/Tools/anaconda3/bin:$PATH"
}

function remove_conda_anaconda_from_PATH {
    export PATH=$(echo ${PATH} | awk -v RS=: -v ORS=: '/anaconda3/ {next} {print}' | sed 's/:*$//')
}

function conda-on {
    # add conda (etc) to PATH
    add_conda_anaconda_to_PATH
    printf "The PATH environment variable is now set to\n"
    printf "  %s\n" $PATH
    printf "The conda (package manager) and the Anaconda (package distribution) should be activated now.\n\n"
}

function conda-off {
    # remove conda (etc) from PATH
    remove_conda_anaconda_from_PATH
    printf "The PATH environment variable is now set to\n"
    printf "    %s\n" $PATH
    printf "The conda (and Anaconda) should be de-activated now.\n\n"
}

# UPDATES
# mup = mac update   (MacOS, etc)
# bup = brew update  (Homebrew package manager)
# cup = conda update (conda package manager, and anaconda distribution)
# pup = pip update   (pip package manager)

#alias mup='softwareupdate -ia'
function mup {
    printf '\n'
    printf '%s\n' "--------------------"
    printf '%s\n' "|   MacOS update   |"
    printf '%s\n' "--------------------"
    printf '\n%s\n\n' "(for MacOS and MacOS-managed apps, not including brew-, conda-, and pip-managed packages)"
    softwareupdate -ia
    printf '\n'
}
#alias bup="brew update && brew upgrade && brew cleanup && brew doctor"
function bup {
    function bstep0 {
        # If necessary, to keep conda/anaconda from interfering with Homebrew's setup:
        printf '\n'
        printf '%s\n' "--------------------"
        printf '%s\n' "|   conda 'off'    |"
        printf '%s\n' "--------------------"
        printf '\n\n%s' "Deactivating conda (~'conda_off') so as not to interfere with Homebrew's setup."
        remove_conda_anaconda_from_PATH
    }
    function bstep1 {
        printf '\n'
        printf '%s\n' "--------------------"
        printf '%s\n' "|   brew update    |"
        printf '%s\n' "--------------------"
        printf ''
        brew update
    }
    function bstep2 {
        printf '\n'
        printf '%s\n' "--------------------"
        printf '%s\n' "|   brew upgrade   |"
        printf '%s\n' "--------------------"
        printf ''
        brew upgrade
    }
    function bstep3 {
        printf '\n'
        printf '%s\n' "--------------------"
        printf '%s\n' "|   brew cleanup   |"
        printf '%s\n' "--------------------"
        printf ''
        brew cleanup
    }
    function bstep4 {
        printf '\n'
        printf '%s\n' "--------------------"
        printf '%s\n' "|   brew doctor    |"
        printf '%s\n' "--------------------"
        printf ''
        brew doctor
    }
    bstep1 && bstep2 && bstep3 && bstep4
    printf '\n'
}
#alias cu="conda update --all --yes; conda clean --all --yes --quiet"
#alias cup="conda update --prefix /Users/zero/Tools/anaconda3 anaconda && conda clean"
function cup {
    function cstep1 {
        printf '\n'
        printf '%s\n' "--------------------"
        printf '%s\n' "|   conda 'on'     |"
        printf '%s\n' "--------------------"
        printf '\n'
        conda-on
    }
    function cstep2 {
        printf '\n'
        printf '%s\n' "--------------------"
        printf '%s\n' "|   conda update   |"
        printf '%s\n' "--------------------"
        printf '\n'
        conda update --prefix /Users/zero/Tools/anaconda3 anaconda
    }
    function cstep3 {
        printf '\n'
        printf '%s\n' "--------------------"
        printf '%s\n' "|   conda clean    |"
        printf '%s\n' "--------------------"
        printf '\n'
        conda clean --all
    }
    function cstep4 {
        printf '\n'
        printf '%s\n' "--------------------"
        printf '%s\n' "|   conda 'off'    |"
        printf '%s\n' "--------------------"
        printf '\n'
        conda-off
    }
    cstep1
    cstep2 && cstep3
    cstep4
}
