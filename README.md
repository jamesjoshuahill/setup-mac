# setup-mac

This repo records the configuration of my Mac. It can be used to set up a new
Mac and keep it up to date.

Files in the home directory are tracked using a bare git repository in `~/.setup`.

## Fresh install

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
1. Run the update script
    ```bash
    ~/bin/update-mac
    ```
1. Restart and re-run update script to install all macOS updates
1. Load iTerm preferences:
    - Tick: General > Preferences > Load preferences from a custom folder or URL and select the home directory.
    - Tick: General > Preferences > Save changes to folder when iTerm2 quits
1. Spectacle preferences:
    - Tick: Launch Spectacle at login
1. Flycut preferences:
    - Tick: General > Launch Flycut at login
1. Save GitHub credentials:
    - Create a GitHub [personal access token](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line) for the new Mac with the `repo` scope.
    - Run a git command on a private repo and enter GitHub credentials. They will be saved in the keychain.

## Daily

Run the update script regularly to update to the latest versions:
```bash
update-mac
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

Update the pinned versions in the update script:
- [Ruby](https://www.ruby-lang.org/en/)
- [Node.js](https://nodejs.org/en/)
- [Go](https://golang.org)

## Acknowledgements

- [Gerhard Lazu's setup](https://github.com/gerhard/setup)
- [Pivotal's workstation-setup](https://github.com/pivotal/workstation-setup)
- [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles).
- [Sensible Bash](https://github.com/mrzool/bash-sensible)
