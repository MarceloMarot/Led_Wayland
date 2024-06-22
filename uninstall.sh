#! /bin/bash


sudo systemctl stop keyboard_leds

sudo rm /usr/bin/keyboard_leds.sh
sudo rm /etc/systemd/system/keyboard_leds.service

sudo systemctl daemon-reload