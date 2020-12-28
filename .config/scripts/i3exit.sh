#!/bin/bash

choice=$(echo -e "Exit I3\nReboot\nShutdown" | rofi -dmenu -p "Chose action")
case $choice in
	"Exit I3")
		i3-msg exit;;
	Reboot)
		reboot;;
	Shutdown)
		poweroff;;
esac
