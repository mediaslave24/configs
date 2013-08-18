#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH="/usr/local/heroku/bin:$PATH"
export PATH=$HOME/bin:$PATH
export BROWSER='chromium'
BROWSER='chromium'
export EDITOR='vim'
export GREP_OPTIONS="--binary-files=without-match --directories=skip"

export TASKRC="~/Dropbox/.taskrc"
export TASKDATA="~/Dropbox/.taskdata"

eval $(keychain --eval -Q --agents ssh id_rsa id_ecdsa)
