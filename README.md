# ZshSync
ZshSync is a simple and efficient tool for synchronizing your Zsh configurations across different machines.
This script automates the process of pushing and pulling your .zshrc and custom Oh My Zsh settings to and from a Git repository.
Once installed simply use `pushConf` and `pullConf` on your respective devices to update. 😇

*This tool is made for mac*

## Prerequisites
- Git: Ensure Git is installed and configured on your machine.
- Oh My Zsh: This tool assumes you are using Oh My Zsh.

## Setup
On your mac, create a new repository inside your **Documents** folder -> `PRIVATE-Config` <br>
```bash
mkdir -p ~/Documents/PRIVATE-Config
cd ~/Documents/PRIVATE-Config
git init
```
*Feel free to host this repository anywhere*

Copy the file `syncConf.zsh` into your custom folder inside oh-my-zsh -> `cd .oh-my-zsh/custom`
```bash
cp ~/<WHEREEVER YOU CLONED THIS REPO>/ZshSync/syncConf.zsh ~/.oh-my-zsh/custom/
```

After restarting your console you will now be able to execute `pushConf` and `pullConf`

## Usage
Push Configuration: <br>
Use pushConf to synchronize your current .zshrc and Oh My Zsh custom settings to the Git repository

Pull Configuration: <br>
Use pullConf to fetch and update your local configuration files from the Git repository:

## Security
Hosting Repository:

While you can host the PRIVATE-Config repository anywhere, ensure it is kept private or secured appropriately.
Consider switching the repository to private mode if sensitive information is included.

Ignored Files:

The repository includes a .gitignore file to exclude unnecessary files such as temporary files, system files, and Git metadata.
Ensure sensitive information like passwords or API keys are not stored in tracked files.

## syncConf.zsh
`syncConf.zsh` script automates the process of copying .zshrc and custom Oh My Zsh settings between your local system and the Git repository.
It handles synchronization tasks such as copying files, excluding specific directories (like plugins), and performing Git operations (add, commit, push, stash, pull).
