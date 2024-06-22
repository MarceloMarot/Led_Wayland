#! /bin/bash

sudo cp led_teclado.sh /usr/bin/led_teclado.sh
sudo chmod +x /usr/bin/led_teclado.sh

sudo cp led_teclado.service /etc/systemd/system/led_teclado.service
sudo chmod 644  /etc/systemd/system/led_teclado.service

sudo systemctl enable led_teclado
systemctl daemon-reload
sudo systemctl start led_teclado

