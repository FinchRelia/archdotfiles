[ ! -s ~/.config/mpd/pid ] && mpd # Mpd daemon
picom &
unclutter --timeout 3 &
export QT_STYLE_OVERRIDE=kvantum
# exec i3
