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

## Acknowledgements

- [Gerhard Lazu's setup](https://github.com/gerhard/setup)
- [Pivotal's workstation-setup](https://github.com/pivotal/workstation-setup)
- [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles).
