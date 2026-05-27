#!/bin/bash

chosen=$(printf " Desligar\n Reiniciar\n Logout\n" | \
rofi -dmenu -i -p "Power Menu")

case "$chosen" in
    " Desligar")
        systemctl poweroff
        ;;
    " Reiniciar")
        systemctl reboot
        ;;
    " Logout")
        i3-msg exit
        ;;
esac