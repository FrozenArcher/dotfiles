#!/bin/sh

run() {
	if ! pgrep -f "$1" ; then
		"$@"
	fi
}

# polkit
_polkit=/usr/lib/polkit-kde-authentication-agent-1
if [ -f $_polkit ]; then
    $_polkit &
fi

# run wm app
run picom -b
run nm-applet &
run udiskie --tray &
run blueman-applet &
run xfce4-power-manager &
run caffeine &
run xfce4-screensaver &
run pasystray &
