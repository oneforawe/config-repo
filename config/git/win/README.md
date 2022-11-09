# Notes

Commands:

* `git config --list`
* `git config --list --system`
* `git config --list --global`

System config:  
EG `C:\Program Files\Git\etc\gitconfig`

Global config:  
EG: `~\.gitconfig`

Link for template file:

* `New-Item -ItemType Directory C:\Users\andrew.forrester\.config\git`
* `New-Item -ItemType Directory C:\Users\andrew.forrester\.config\git\template`
* `New-Item -ItemType HardLink -Path "Link" -Target "Target"`
* `New-Item -ItemType HardLink -Path ~/.config/git/template/HEAD -Target ~/.config-repo/config/git/template/HEAD`
