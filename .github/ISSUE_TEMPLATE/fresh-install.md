---
name: Fresh install
about: Steps to set up a fresh Mac
title: Fresh install MAC NAME
labels: ""
assignees: ""
---

## Fresh install

### Secure your Mac

- System Preferences > Security & Privacy > General

  - [ ] Require password after 'immediately'
  - [ ] Tick: Show a message when the screen is locked
  - [ ] Set Lock Message...

    `Found this computer? Please contact NAME on PHONE NUMBER or EMAIL ADDRESS.`

- System Preferences > Security & Privacy > Privacy > Advertising

  - [ ] Tick: Limit Ad Tracking

- System Preferences > Firewall

  - [ ] Turn on Firewall

- System Preferences > Desktop & Screen Saver > Screen Saver
  - [ ] Start after '10 min'
  - [ ] Hot corners: 'Start Screen Saver' (top right)

### Upgrade macOS

- System Preferences > Software Update

  - [ ] Upgrade macOS to the latest minor release

### Install pre-requisites

- Install command line tools

  - [ ] `xcode-select --install`

- Install Homebrew

  - [ ] `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

### Install dotfiles

- Set up the bare repository in `~/.setup`

  ```bash
  git clone --bare https://github.com/jamesjoshuahill/setup-mac.git "$HOME/.setup/"
  alias setup-git='git --git-dir="$HOME/.setup/" --work-tree="$HOME"'
  setup-git config status.showUntrackedFiles no
  ```

- Update files in the home directory

  - [ ] `setup-git checkout`

### Install packages

- Run the update script

  - [ ] `~/update-mac`
    > ⚠️ Apps installed using Homebrew casks need to be manually approved the
    > first time they are opened.

- Restart and re-run the update script to install all macOS updates
  - [ ] Restart Mac
  - [ ] Re-run update script

### One-off configuration

- 1Password

  - [ ] Open 1Password and unlock vault

- FileVault

  - [ ] System Preferences > Security & Privacy > FileVault > Turn on FileVault...
  - [ ] Create a recovery key and do not use my iCloud account
  - [ ] Store recovery key in 1Password

- GitHub

  - [ ] Create a GitHub [personal access token](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line) for your new Mac with the `repo` scope.
  - [ ] Run a git command on a private repo and enter GitHub credentials. The token will be saved in the keychain.

- SF Mono font

  - [ ] Run `cp /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-*.otf "$HOME/Library/Fonts/"`

- iTerm

  - [ ] Tick: General > Preferences > Load preferences from a custom folder or URL and type in the `~/.iterm` directory.
  - [ ] Tick: General > Preferences > Save changes to folder when iTerm2 quits
  - [ ] Restart iTerm

- Rectangle

  - [ ] Tick: Settings > Launch on login

- Flycut

  - [ ] Tick: General > Launch Flycut at login
  - [ ] Select: Appearance > Menu item icon > Black scissors

- Safari

  - [ ] Autofill > Untick all.
  - [ ] Select Search > Search engine > DuckDuckGo
  - [ ] Tick: Advanced > Smart Search Field > Show full website address
  - [ ] Tick: Advanced > Show Develop menu in menu bar
  - [ ] Tap: View menu > Show Status Bar

- macOS User

  - [ ] Download your profile photo
  - [ ] Import profile photo into Photos app
  - [ ] Tap: System Preferences > Users & Groups > USERNAME > edit (hover over photo)

- Finder

  - [ ] Go > Computer
  - [ ] Navigate to Macintosh HD > Users
  - [ ] Drag user directory into Favourites in sidebar

- Dock

  - [ ] Tick: System Preferences > Dock > Automatically hide and show the Dock
  - [ ] Untick: System Preferences > Dock > Show recent applications in Dock
  - [ ] Remove all icons from Dock: `dockutil --list | cut -d"$(printf '\t')" -f1 | grep -v Downloads | xargs -I{} dockutil --remove '{}' --no-restart`

- Keyboard

  - [ ] Select 'Fast': System Preferences > Keyboard > Keyboard > Key Repeat
  - [ ] Select 'Short': System Preferences > Keyboard > Keyboard > Delay until Repeat

- Trackpad

  - [ ] Tick: System Preferences > Trackpad > Point & Click > Tap to click

- Sound

  - [ ] Tick: System Preferences > Sound > Show volume in menu bar

- Date & Time

  - [ ] Untick: System Preferences > Date & Time > Clock > Use a 24-hour clock
  - [ ] Tick: System Preferences > Date & Time > Clock > Show am/pm
  - [ ] Tick: System Preferences > Date & Time > Clock > Show the day of the week
  - [ ] Tick: System Preferences > Date & Time > Clock > Show date

- Google Account

  - [ ] System Preferences > Internet Accounts > Google

- Software Update

  - [ ] Tick: System Preferences > Software Update > Automatically keep my Mac up to date
  - [ ] Tick all boxes: System Preferences > Software Update > Advanced...

- Slack

  - [ ] Sign in

- Automator

  - [ ] Open `~/workflows/Convert to JPEG.workflow`
