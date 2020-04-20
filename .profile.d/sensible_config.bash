# Configure Sensible Bash
set +o noclobber  # Allow overwriting files on stdout redirection '>'
CDPATH=".:$HOME/projects"  # Add ~/projects to CDPATH
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear:exa"  # Add exa to HISTIGNORE
