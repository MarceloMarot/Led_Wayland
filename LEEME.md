
# LEDS de teclado con Systemd y Wayland


Este servicio busca los LEDs de teclado desde su directorio de Wayland y fuerza su estado a encendido periódicamente cada 0.2 segundos. 

[Version en inglés - README.md](README.md#keyboard-leds-with-wayland-and-systemd)


## Cómo Instalar


Abre una terminal Bash y pega en ella los comandos:

```bash
git clone https://github.com/MarceloMarot/Led_Wayland.git
cd Led_Wayland
```

Luego copia y pega los comandos:

```bash
sudo chmod +x install.sh
sudo ./install.sh
```


## Asignar Permisos de Usuario

Esta tarea requiere que el usuario tenga permisos para que funcione correctamente. 

Para ello, abre el archivo `sudoers` como `sudo`:

```bash
sudo nano /etc/sudoers
```
entonces agrega las siguientes líneas de codigo al final y guarda:
 
```bash
## Habilita permisos para todos los usuarios
ALL ALL=(ALL) /etc/systemd/system/keyboard_leds.service
```

Esto le da permiso a todos los usuarios de ejecutar esta tarea.


## Cómo Desinstalar

Ejecuta estas lineas en Bash:
```bash
chmod +x uninstall.sh 
sudo ./uninstall.sh
```



## Referencias:

[Turn on keyboard backlight/leds on wayland (xset led 3 alternative)](https://gist.github.com/ps1dr3x/b15c62eafb388ddf8bb7d3896d1a1cee)
