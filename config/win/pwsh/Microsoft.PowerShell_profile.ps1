# PowerShell prompt theme
oh-my-posh init pwsh --config ~\.config\oh-my-posh\prompt-theme.omp.json | Invoke-Expression

# Enable vi/vim key-bindings and visual indicator for mode
Set-PSReadlineOption -EditMode vi
Set-PSReadlineOption -ViModeIndicator Cursor # Doesn't seem to be working...
# See also:
# https://github.com/PowerShell/PSReadLine/issues/906

# Enable menu auto-completion: navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Enable history auto-completion: traversed with arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
