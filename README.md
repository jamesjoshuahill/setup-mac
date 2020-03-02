# setup-mac

This repo records the configuration of my Mac. It can be used to set up a new
Mac and keep it up to date.

Files in the home directory are tracked using a bare git repository in `~/.setup`.

## Fresh install

1. Secure your Mac
    - System Preferences > Security > General
        - Require password after 'immediately'
    - System Preferences > Desktop & Screen Saver > Screen Saver
        - Start after '10 min'
        - Hot corners: 'Start Screen Saver' (top right)
    - System Preferences > Security & Privacy > General
        - Tick: Show a message when the screen is locked
        - Set Lock Message...

          `Found this computer? Please contact NAME on PHONE NUMBER or EMAIL ADDRESS.`
    - System Preferences > Firewall
        - Turn on Firewall
    - System Preferences > Security & Privacy > Advertising
        - Tick: Limit Ad Tracking
1. Upgrade macOS to the latest minor release (System Preferences > Software Update)
1. Install command line tools
    ```bash
    xcode-select --install
    ```
1. Set up the bare repository in `~/.setup`
    ```bash
    git clone --bare https://github.com/jamesjoshuahill/setup-mac.git "$HOME/.setup/"
    alias setup-git='git --git-dir="$HOME/.setup/" --work-tree="$HOME"'
    setup-git config status.showUntrackedFiles no
    ```
1. Update files in the home directory
    ```bash
    setup-git checkout
    ```
1. Run the setup script
    ```bash
    ~/bin/setup-mac
    ```
    > ⚠️ When Homebrew installs for the first time it may exit non-zero. Run
    > the setup script again to continue.

    > ⚠️ Apps installed using Homebrew casks need to be manually approved the
    > first time they are opened.

1. Restart and re-run setup script to install all macOS updates
1. Open 1Password and unlock vault
1. Enable FileVault
    - System Preferences > Security & Privacy > FileVault
        - Turn on FileVault...
        - Create a recovery key and do not use my iCloud account
        - Store recovery key in 1Password
1. Create GitHub token
    - Create a GitHub [personal access token](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line) for your new Mac with the `repo` scope.
    - Run a git command on a private repo and enter GitHub credentials. The token will be saved in the keychain.

### Manual configuration

- Load iTerm preferences:
    - Tick: General > Preferences > Load preferences from a custom folder or URL and type in the `~/.iterm` directory.
    - Tick: General > Preferences > Save changes to folder when iTerm2 quits
- Rectangle preferences:
    - Tick: Settings > Launch on login
- Flycut preferences:
    - Tick: General > Launch Flycut at login
    - Select: Appearance > Menu item icon > Black scissors


## Daily

Run the setup script regularly to update to the latest versions:
```bash
setup-mac
```

Check for changes to config:
```bash
setup-git status
```

Check in changes to tracked configuration:
```bash
setup-git add -p            # stage changes
```

Track new configuration:
```bash
setup-git add NEW_FILE      # track a new file
```

Commit and push:
```bash
setup-git commit -m "..."
setup-git push
```

> ℹ️ You can use the Bash alias `s` for `setup-git` and the Git aliases for shorter commands: `s st`, `s add -p`.

Update the Atom package list:
```bash
update-atom-package-list    # updates ~/.atom/packages.txt
```

## Monthly

Update the pinned versions in `~/bin/setup-mac`:
- [Ruby](https://www.ruby-lang.org/en/)
- [Node.js](https://nodejs.org/en/)
- [Go](https://golang.org)

Update the pinned versions in `~/Brewfile`:
- MongoDB
- Postgres

Update [Sensible Bash](https://github.com/mrzool/bash-sensible) in `~/.sensible`.

## Acknowledgements

- [Gerhard Lazu's setup](https://github.com/gerhard/setup)
- [Pivotal's workstation-setup](https://github.com/pivotal/workstation-setup)
- [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles).
- [Sensible Bash](https://github.com/mrzool/bash-sensible)
