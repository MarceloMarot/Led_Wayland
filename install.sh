#! /bin/bash

sudo systemctl stop keyboard_leds

sudo cp keyboard_leds.sh /usr/bin/keyboard_leds.sh
sudo chmod +x /usr/bin/keyboard_leds.sh

sudo cp keyboard_leds.service /etc/systemd/system/keyboard_leds.service
sudo chmod 644  /etc/systemd/system/keyboard_leds.service

sudo systemctl enable keyboard_leds
sudo systemctl daemon-reload
sudo systemctl start keyboard_leds

