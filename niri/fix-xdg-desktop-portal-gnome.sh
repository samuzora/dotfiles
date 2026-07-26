#!/bin/bash
sleep 4
killall xdg-desktop-portal-gnome
killall xdg-desktop-portal
/usr/lib/xdg-desktop-portal-gnome &
sleep 4
/usr/lib/xdg-desktop-portal &
