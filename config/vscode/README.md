# VSCode

VSCode (Visual Studio Code) -- could also try VSCodium.

To find the location of `settings.json`, you can open the settings UI with
`File > Preferences > Settings`, click on an `Edit in settings.json` link, click
on the file tab, select `Reveal in File Explorer`, and inspect the location from
there.

## Mac

* [TODO: Decide how to handle `settings.json` and extensions.]
* See `~/Library/Application Support/Code/User`

## GNU/Linux (via WSL within Windows)

* [TODO: See if the `settings.json` file location below is obsolete.]
* Executed with PowerShell in host Windows machine
  `New-Item -ItemType HardLink -Path "C:\Users\andrew.forrester\AppData\Roaming\Code\User\settings.json" -Target "C:\Users\andrew.forrester\.config-repo\config\vscode\settings.json"`
* Executed with Bash in guest Linux machine
  `bash ~/.config-repo/config/vscode/extensions-manual.sh`  

## Windows

* [TODO: See if the `settings.json` file location below is obsolete.]
* Executed with PowerShell  
  `.$Home\.config-repo\config\vscode\extensions-manual.sh` (won't work if in
  restricted mode, with ExecutionPolicy set to Restricted)  
  `New-Item -ItemType HardLink -Path "C:\Users\andrew.forrester\.vscode\settings.json" -Target "C:\Users\andrew.forrester\.config-repo\config\vscode\settings.json"`
