#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


####################
# Common options
####################
PS1='[\u@\h \W]\$ '
export EDITOR='vim'
export BROWSER="chromium"
export TERMINAL='urxvt'
export GREP_OPTIONS="--binary-files=without-match --directories=skip"

# RVM
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias ls='ls --color=auto'   # Colored
alias less="less -R"         # Colors on
alias brc="source ~/.bashrc" # Reload .bashrc

####################
# Daemons Shortcuts
####################
alias start_mysql="sudo systemctl start mysqld"
alias start_mongodb="sudo systemctl start mongodb"
alias start_mysql="sudo systemctl start mysqld"
alias start_es="sudo systemctl start elasticsearch"
alias start_pg="sudo systemctl start postgresql"

####################
# File Archivers
####################
alias untargz="tar -zxvf"
alias untarbz="tar -jxvf"
alias targz="tar -zcvf"

####################
# Dir shortcuts
####################
alias rp="cd ~/repos"
alias gw="cd ~/repos/git-wiki"
alias ma="cd ~/repos/mobile-app"
alias cfs="cd ~/repos/configs"
alias kt="cd ~/repos/kasto"
alias bl="cd ~/repos/blog"
alias lr="cd ~/repos/lr4"
alias dwmc="cd ~/repos/configs/configs/dwm-6.0"
alias ke="cd ~/repos/k-r-exercises"
alias st="cd ~/repos/sinatra-tasks"
alias xf="cd ~/repos/xope-frontend"
alias vt2="cd ~/repos/vertatweet2"
alias vt="cd ~/repos/vertatweet"

####################
# Programs Shortcuts
####################
alias g="git"
alias b="bundle"
alias 'gem-install'="gem install --no-ri --no-rdoc"
alias cal="cal -3m"

