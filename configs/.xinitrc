#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xresources &

feh  --bg-fill ~/wallpaper
while inotifywait -e modify ~/wallpaper; do
  feh  --bg-fill ~/wallpaper
done &

xscreensaver -no-splash &
dropboxd &

# if $SSH_AGENT_PID; then
#   ssh-agent -k
# fi
# eval $(ssh-agent)

__start_dwm() {
  dwmstatus &
  while true; do
    dwmstatus refresh
    xkb-switch --wait
  done &
  # while true; do
      # Log stderror to a file 
  dwm 2> ~/.dwm.log
      # No error logging
      #dwm >/dev/null 2>&1
  # done
  
}

case $1 in
  subtle)
    exec subtle
    ;;
  dwm|*)
    __start_dwm
    ;;
esac
