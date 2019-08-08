# setup

This repo records the configuration of my Mac. It can be used to set up a new
Mac and keep it up to date.

Files in the home directory are tracked using a bare git repository in `~/.setup`.

## Fresh install

1. Create a GitHub [personal access token](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line) for the new Mac.
1. Set up the bare repository in `~/.setup`
    ```
    git clone --bare https://github.com/jamesjoshuahill/setup.git "$HOME/.setup/"
    alias setup-git='git --git-dir="$HOME/.setup/" --work-tree="$HOME"'
    setup-git config status.showUntrackedFiles no
    ```
1. Update files in the home directory
    ```
    setup-git checkout
    ```
1. Run the update script
    ```
    ./update.sh
    ```

## Daily

### Update everything

Run the update script regularly to update everything to the latest versions:
```
cd
./update.sh
```

### Record changes

Check for changes:
```
setup-git status
```

Record changes:
```
setup-git add -p            # stage changes
setup-git add NEW_FILE      # track a new file
setup-git commit -m "..."
setup-git push
```

## Acknowledgements

- [Gerhard Lazu's setup](https://github.com/gerhard/setup)
- [Pivotal's workstation-setup](https://github.com/pivotal/workstation-setup)
- [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles).
- [Sensible Bash](https://github.com/mrzool/bash-sensible)
