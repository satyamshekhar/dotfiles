# -*- shell-script -*-

export FZF_DEFAULT_COMMAND='rg --files --hidden'

export PATH="/usr/local/opt/gnu-sed/bin":"$HOME/bin":".":"$HOME/.cargo/bin":$PATH

shopt -s histappend
export HISTCONTROL=ignoredups:ignorespace
export HISTSIZE=10000
export HISTFILESIZE=200000
DOTFILES_DIR=$(dirname "${BASH_SOURCE[0]}")
# Hack to make histfile grow more than 2000 words. It seems to get truncated on new shell.
export HISTFILE="$DOTFILES_DIR/.cmd_history"

. $DOTFILES_DIR/colors
. $DOTFILES_DIR/aliases
. $DOTFILES_DIR/prompt
. $DOTFILES_DIR/netspring

tabs -2

function compress_history {
    awk 'NR==FNR && !/^#/{lines[$0]=FNR;next} lines[$0]==FNR' \
"$HISTFILE" "$HISTFILE" > "$HISTFILE.compressed" && mv "$HISTFILE.compressed" "$HISTFILE"
}

# disable xon/xoff for CTRL-S (forward search).
stty -ixon
# xmodmap ~/.xmodmap

ulimit -c unlimited

# set -o vi
tabs -2
