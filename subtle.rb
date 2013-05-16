# -*- encoding: utf-8 -*-

# Globals
set :increase_step, 5
set :border_snap, 1
set :default_gravity, :center
set :urgent_dialogs, true
set :honor_size_hints, true
set :gravity_tiling, true
set :click_to_focus, false
set :skip_pointer_warp, false
set :skip_urgent_warp, false
set :wmname, true

# Programs
editor =       "gvim"
terminal =     "urxvt"
browser =      "chromium"
im =           "skype"
filemanager =  "\pcmanfm"
music_player = "exaile"
torrents =     "deluge"

# Jumps
(1..9).each do |i|
  grab "W-S-#{i}", :"ViewJump#{i}"
  grab "W-#{i}", :"ViewSwitch#{i}"
end

# Reboot, shutdown
grab "W-Home", "sudo shutdown -P +0"
grab "W-End",  "sudo reboot"
grab "W-Delete",    "xscreensaver-command -lock"
grab "W-Insert",    "xscreensaver-command -activate"

grab "W-C-n", "setxkbmap -layout 'us, ru, ua'"
grab "W-C-m", "setxkbmap -layout 'ru, ua, us'"
grab "W-C-comma", "setxkbmap -layout 'ua, us, ru'"

# Programs
grab "W-Return", terminal
grab "W-t",      terminal
grab "W-b",      browser
grab "W-v",      editor
grab "W-d",      filemanager
grab "W-z",      im
grab "W-x",      music_player

# Combos
grab "W-l 4",    "#{browser} http://localhost:4000"
grab "W-l 3",    "#{browser} http://localhost:3000"
grab "W-l d",     "#{browser} http://www.feedly.com/home"

# Music
grab "W-o",     "exaile --prev"
grab "W-p",     "exaile --next"
grab "W-space", "exaile --play-pause"

# Sound
grab "W-f",      "amixer -c 0 set Master 4%-"
grab "W-g",      "amixer -c 0 set Master 4%+"
(1..9).each do |i|
  grab "W-C-KP_#{i}", "amixer -c 0 set Master #{i*10}%"
end

# Else
grab "A-Tab", :WindowLower
grab "W-q",   :WindowKill
grab "F11",   :WindowFull
grab "W-C-c", "#{editor} #{__FILE__}"
grab "F1",    "#{browser} https://wiki.archlinux.org/"
grab "F2",    "#{browser} http://subforge.org/projects/subtle/"


# Placing
grab "W-KP_7", [ :top_left,     :top_left66,     :top_left33     ]
grab "W-KP_8", [ :top,          :top66,          :top33          ]
grab "W-KP_9", [ :top_right,    :top_right66,    :top_right33    ]
grab "W-KP_4", [ :left,         :left66,         :left33         ]
grab "W-KP_5", [ :center,       :center66,       :center33       ]
grab "W-KP_6", [ :right,        :right66,        :right33        ]
grab "W-KP_1", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
grab "W-KP_2", [ :bottom,       :bottom66,       :bottom33       ]
grab "W-KP_3", [ :bottom_right, :bottom_right66, :bottom_right33 ]

###############################

screen 1 do
  top [ 
    :views, 
    :title, 
    :spacer, 
    :keychain,
    :tray, 
    :tasks,
    :separator,
    :cpuchart,
    :separator,
    :clock 
  ]
  bottom [
  ]
end

style :all do
  background  "#202020"
  icon        "#757575"
  border      "#303030", 0
  padding     1, 5
  font        "xft:ubuntumono-13"
end

style :views do
  foreground  "#757575"

  style :focus do
    foreground  "#fecf35"
  end

  style :urgent do
    foreground  "#ff9800"
  end

  style :occupied do
    foreground  "#b8b8b8"
  end
end

style :sublets do
  style :clock do
    foreground "#eee"
    padding 0, 5, 0, 10
  end
  style :volume do
    padding 0, 5
  end
  foreground  "#757575"
end

style :separator do
  foreground  "#757575"
  separator   "|"
end

style :title do
  foreground  "#fecf35"
end

style :clients do
  active    "#303030", 2
  inactive  "#202020", 2
  margin    0
  width     50
end

style :subtle do
  margin      0, 0, 0, 0
  panel       "#202020"
  stipple     "#757575"
end


gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  66 ]
gravity :top_left33,     [   0,   0,  50,  34 ]

gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]

gravity :top_right,      [  50,   0,  50,  50 ]
gravity :top_right66,    [  50,   0,  50,  66 ]
gravity :top_right33,    [  50,   0,  50,  33 ]

gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,   0,  66, 100 ]
gravity :left33,         [   0,   0,  33, 100 ]

gravity :center,         [   0,   0, 100, 100 ], :horz
gravity :center66,       [  17,  17,  66,  66 ]
gravity :center33,       [  33,  33,  33,  33 ]

gravity :right,          [  50,   0,  50, 100 ]
gravity :right66,        [  34,   0,  66, 100 ]
gravity :right33,        [  67,   0,  33, 100 ]

gravity :bottom_left,    [   0,  50,  50,  50 ]
gravity :bottom_left66,  [   0,  34,  50,  66 ]
gravity :bottom_left33,  [   0,  67,  50,  33 ]

gravity :bottom,         [   0,  50, 100,  50 ]
gravity :bottom66,       [   0,  34, 100,  66 ]
gravity :bottom33,       [   0,  67, 100,  33 ]

gravity :bottom_right,   [  50,  50,  50,  50 ]
gravity :bottom_right66, [  50,  34,  50,  66 ]
gravity :bottom_right33, [  50,  67,  50,  33 ]

gravity :gimp_image,     [  10,   0,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [  90,   0,  10, 100 ]





grab "KP_Add",      :ViewNext
grab "W-Tab",       :ViewNext
grab "KP_Subtract", :ViewPrev
grab "W-S-Tab",     :ViewPrev

grab "W-C-r", :SubtleReload
grab "W-C-S-r", :SubtleRestart
grab "W-C-q", :SubtleQuit

grab "W-B1", :WindowMove
grab "W-B3", :WindowResize
grab "W-e", :WindowFloat
grab "W-s", :WindowStick

grab "W-Left",  :WindowLeft
grab "W-Down",  :WindowDown
grab "W-Up",    :WindowUp
grab "W-Right", :WindowRight

###############################


# Programs tags
tag "terms" do
  match "[u]?rxvt"
  gravity :center
end

tag "flash" do
  match "<unknown>|plugin-container|exe|operapluginwrapper|npviewer.bin" 
  stick true
end


gravity :skype_files,  [  70,   0,  30, 20  ]

tag "skype_files" do
  match name: "^file.transfers"
  gravity :skype_files
end

tag "skype" do 
  match "skype"
  gravity :center
  float true
end

tag "picture" do
  match "feh|mirage"
end

tag "filemanager" do
  match "pcmanfm|ranger|vifm|spacefm|thunar|nemo"
end

tag "browser" do
  match "#{browser}|uzbl|opera|firefox|navigator"
  float true
end

tag "editor" do
  match "[g]?vim"
end


tag "media" do
  match "vlc|exaile(\.py)?"
end

view "terms", "terms"
view "www",   "browser"
view "dev",   "editor"
view "fm",    "filemanager"
view "media", "media"
view "skype", "skype|skype_files"
view "else",   "default"
