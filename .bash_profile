[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Suppressing "The default interactive shell is now zsh" message in macOS
export BASH_SILENCE_DEPRECATION_WARNING=1
eval "$(rbenv init -)"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="~> \[\033[35m\]\u\[\033[m\]@\[\033[36m\]\h:\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR=/usr/bin/vim
export LC_CTYPE='en_US.UTF-8'

# History handling
export HISTCONTROL=erasedups # Erase duplicates
export HISTSIZE=10000 # resize history size

# GIT
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global core.editor emacs

alias emacs="emacs -nw"
