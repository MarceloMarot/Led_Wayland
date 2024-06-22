
# Keyboard LEDs with Wayland and Systemd 


This service searchs the keyboard LEDS from their Wayland folder and forces to turn them periodically every 0.2 seconds.


## How to Install

Open a Bash terminal and paste in it the comands:

```bash
git clone https://github.com/MarceloMarot/Led_Wayland.git
cd Led_Wayland
```

Then copy and paste in terminal the commands:
```bash
sudo chmod +x install.sh
sudo ./install.sh
```

## Giving user permissions

This task requires user permissions to work properly. 
Users require execution permissions to run this task properly.

To this, open `sudoers` file as `sudo`:

```bash
sudo nano /etc/sudoers
```

then add the following line codes at the end and save:
 
```bash
## Enabling permissions to all users for this particular task
ALL ALL=(ALL) /etc/systemd/system/keyboard_leds.service
```

It gives permissions to all users to execute this task.



## References:

[Turn on keyboard backlight/leds on wayland (xset led 3 alternative)](https://gist.github.com/ps1dr3x/b15c62eafb388ddf8bb7d3896d1a1cee)
