# PowerShell prompt theme
oh-my-posh init pwsh --config ~\.config\oh-my-posh\prompt-theme.omp.json | Invoke-Expression

# Enable vi/vim key-bindings and visual indicator for mode
Set-PSReadlineOption -EditMode vi
#Set-PSReadlineOption -EditMode vi -ViModeIndicator Cursor # doesn't seem to work (yet)

# Enable menu auto-completion: navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Enable history auto-completion: traversed with arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
