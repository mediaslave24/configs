#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# if [ -e /usr/share/terminfo/x/xterm-256color ]; then
#         export TERM='xterm-256color'
# else
#         export TERM='xterm-color'
# fi
# 


### ENV VARIABLES ###
PS1='[\u@\h \W]\$ '
export EDITOR='vim'
export BROWSER="chromium"
# RVM
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export GREP_OPTIONS="--binary-files=without-match --directories=skip"

### ALIASES ###
# Colored ls, less
alias ls='ls --color=auto'
alias less="less -R"
# Subtle config
alias subtle-c="gvim ~/.config/subtle/subtle.rb"
# Reload .bashrc
alias brc="source ~/.bashrc"

# Untar
alias untargz="tar -zxvf"

# Reload background
alias wp="sh ~/.fehbg"

# Dir shortcuts
alias rp="cd ~/repos"
alias ma="cd ~/repos/mobile-app"
alias cfs="cd ~/repos/configs"
alias kt="cd ~/repos/kasto"
alias lr="cd ~/repos/lit-bed-rails"
alias dwmc="cd ~/repos/configs/configs/dwm-6.0"

# Test connection
alias test_inet="ping -c 3 www.google.com"

# Progs
alias g="git"
alias v="gvim"
alias b="bundle"

alias start_mongodb="sudo systemctl start mongodb"
alias start_mysql="sudo systemctl start mysql"
