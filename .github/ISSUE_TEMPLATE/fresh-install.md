---
name: Fresh install
about: Steps to set up a fresh Mac
title: Fresh install MAC NAME
labels: ''
assignees: ''

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

### Run setup script

- Install command line tools
  - [ ] `xcode-select --install`

- Set up the bare repository in `~/.setup`
  ```bash
  git clone --bare https://github.com/jamesjoshuahill/setup-mac.git "$HOME/.setup/"
  alias setup-git='git --git-dir="$HOME/.setup/" --work-tree="$HOME"'
  setup-git config status.showUntrackedFiles no
  ```

- Update files in the home directory
  - [ ] `setup-git checkout`

- Run the setup script
  - [ ] `~/bin/setup-mac`
    > ⚠️ When Homebrew installs for the first time it may exit non-zero. Run
    > the setup script again to continue.
    >
    > ⚠️ Apps installed using Homebrew casks need to be manually approved the
    > first time they are opened.

- Restart and re-run the setup script to install all macOS updates
  - [ ] Restart Mac
  - [ ] Re-run setup script

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

- Google Account
    - [ ] System Preferences > Internet Accounts > Google

- Slack
    - [ ] Sign in

- iVPN
    - [ ] Sign in
    - [ ] Turn on AntiTracker
    - [ ] Turn on Firewall
    - [ ] Tick: General > Autoconnect: On Launch
    - [ ] Tick: General > On launch: Launch at login
    - [ ] Untick: General > On launch: Show main window on launch
    - [ ] Tick: General > On exit: Disconnect and quit without confirmation when closing application
    - [ ] Untick: General > Diagnostics: Create log files
    - [ ] Connect

- Automator
    - [ ] Open `~/workflows/Convert to JPEG.workflow`

- Sound
    - [ ] Tick: System Preferences > Sound > Show volume in menu bar
