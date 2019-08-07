# setup

This repo records the configuration of my Mac. It can be used to set up a new
Mac and keep it up to date.

Files in the home directory are tracked using a bare git repository in `~/.setup`.

## Fresh install

1. Generate an SSH key with this [script](https://github.com/jamesjoshuahill/setup/blob/master/bin/generate-ssh-key)
    ```
    generate-ssh-key some.one@example.com
    ```
1. Clone this repo into `~/.setup`
    ```
    git clone git@github.com:jamesjoshuahill/setup.git ~/.setup/
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

Note: the bare git repo is configured not to show untracked files, because only
a few files need to be tracked. So remember to check if there are any new files
you want to record.

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
