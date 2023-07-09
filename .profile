[ ! -s ~/.config/mpd/pid ] && mpd # Mpd daemon
picom &
unclutter --timeout 3 &
export QT_STYLE_OVERRIDE=kvantum
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# exec i3
