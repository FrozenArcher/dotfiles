#!/bin/sh

run() {
	if ! pgrep -f "$1" ; then
		"$@"
	fi
}

# polkit
_polkit=/usr/lib/polkit-kde-authentication-agent-1
_polkit_gnome=/usr/bin/gnome-keyring-daemon
if [ -f $_polkit ]; then
    $_polkit &
elif [ -f $_polkit_gnome ]; then
    dbus-update-activation-environment --all
    gnome-keyring-daemon --start --components=secrets
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
