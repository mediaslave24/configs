#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


PS1='[\u@\h \W]\$ '
export EDITOR='vim'
export BROWSER="chromium"

# RVM
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export GREP_OPTIONS="--binary-files=without-match --directories=skip"

# Colored ls, less
alias ls='ls --color=auto'
alias less="less -R"
# Subtle config
alias subtle-c="gvim ~/.config/subtle/subtle.rb"
# Reload .bashrc
alias brc="source ~/.bashrc"

# Daemons
alias start_mysql="sudo systemctl start mysqld"
alias start_mongodb="sudo systemctl start mongodb"
alias start_mysql="sudo systemctl start mysqld"
alias start_es="sudo systemctl start elasticsearch"
alias start_pg="sudo systemctl start postgresql"
alias start_daemons=" sudo systemctl restart nginx php-fpm mysqld "
alias stop_daemons=" sudo systemctl stop nginx php-fpm mysqld mongodb elasticsearch "

# Untar
alias untargz="tar -zxvf"
alias untarbz="tar -jxvf"
alias targz="tar -zcvf"

# Reload background
alias wp="sh ~/.fehbg"

# Dir shortcuts
alias rp="cd ~/repos"
alias gw="cd ~/repos/git-wiki"
alias ma="cd ~/repos/mobile-app"
alias cfs="cd ~/repos/configs"
alias kt="cd ~/repos/kasto"
alias lr="cd ~/repos/lr4"
alias dwmc="cd ~/repos/configs/configs/dwm-6.0"
alias ke="cd ~/repos/k-r-exercises"
alias st="cd ~/repos/sinatra-tasks"
alias xf="cd ~/repos/xope-frontend"
alias vt2="cd ~/repos/vertatweet2"
alias vt="cd ~/repos/vertatweet"

# Progs
alias g="git"
alias b="bundle"
alias 'gem-install'="gem install --no-ri --no-rdoc"
