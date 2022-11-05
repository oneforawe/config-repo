# VSCode

VSCode (Visual Studio Code) -- soon to try out VSCodium.

## GNU/Linux (via WSL within Windows)

* Executed with PowerShell in host Windows machine
  `New-Item -ItemType HardLink -Path "C:\Users\andrew.forrester\AppData\Roaming\Code\User\settings.json" -Target "C:\Users\andrew.forrester\.config-repo\config\vscode\settings.json"`
* Executed with Bash in guest Linux machine
  `bash ~/.config-repo/config/vscode/extensions-manual.sh`  

## Windows

* Executed with PowerShell  
  `.$Home\.config-repo\config\vscode\extensions-manual.sh` (won't work if in
  restricted mode, with ExecutionPolicy set to Restricted)  
  `New-Item -ItemType HardLink -Path "C:\Users\andrew.forrester\.vscode\settings.json" -Target "C:\Users\andrew.forrester\.config-repo\config\vscode\settings.json"`
