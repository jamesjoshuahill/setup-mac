# setup-mac

This repo records the configuration of my Mac. It can be used to set up a new
Mac and update it.

Files in the home directory are tracked using a bare git repository in `~/.setup`.

## Prerequisites

- A Mac computer
- macOS Catalina

The fresh install checklist can be completed on a clean install of macOS.

## Fresh install

Create a new GitHub issue using the **Fresh install** template.

This provides a [checklist](.github/ISSUE_TEMPLATE/fresh-install.md) to set up a fresh Mac.

## Daily

Run the update script regularly to update to the latest versions:

```bash
~/update-mac
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
setup-git add -f NEW_FILE   # track a new file
```

Commit and push:

```bash
setup-git commit -m "..."
setup-git push
```

> ℹ️ You can use the Bash alias `s` for `setup-git` and the Git aliases for shorter commands: `s st`, `s add -p`.

Update the VS Code extension list:

```bash
update_vscode_extension_list
```

## Monthly

Update the default versions in `~/.config/post_install/*.bash`:

- [Ruby](https://www.ruby-lang.org/en/)
- [Node.js](https://nodejs.org/en/)
- [Go](https://golang.org/dl/)

Update Sensible Bash in `~/.config/profile.d/sensible.bash`:

- [Sensible Bash](https://github.com/mrzool/bash-sensible)

## Acknowledgements

- [setup](https://github.com/gerhard/setup) by Gerhard Lazu
- [workstation-setup](https://github.com/pivotal/workstation-setup) by Pivotal
- [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles) by Nicola Paolucci
- [Sensible Bash](https://github.com/mrzool/bash-sensible) by Mattia Tezzele
- [A Few of My Favorite Things](https://blog.testdouble.com/posts/2020-04-07-favorite-things/) by Kyle Adams
- [dotfiles](https://github.com/thoughtbot/dotfiles) by thoughtbot
