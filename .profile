[ ! -s ~/.config/mpd/pid ] && mpd # Mpd daemon
picom &
unclutter --timeout 3 &
xflux -l 48.67 -g 6.15 -k 3000
export QT_STYLE_OVERRIDE=kvantum
# exec i3
