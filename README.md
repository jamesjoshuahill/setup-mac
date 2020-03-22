# setup-mac

This repo records the configuration of my Mac. It can be used to set up a new
Mac and keep it up to date.

Files in the home directory are tracked using a bare git repository in `~/.setup`.

## Fresh install

Create a new GitHub issue using the **Fresh install** template.

This provides a [checklist](.github/ISSUE_TEMPLATE/fresh-install.md) to set up a fresh Mac.

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
