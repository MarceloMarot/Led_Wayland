
# LEDS de teclado con Systemd y Wayland


Este servicio busca los LEDs de teclado desde su directorio de Wayland y fuerza su estado a encendido periódicamente. 

## Ejecución manual desde rutina

```bash
sudo chmod +x led_teclado.sh
./led_teclado.sh
```


## Instalación simple

```bash
sudo chmod +x instalar.sh
./instalar.sh
```


## Crear servicio en Systemd (paso a paso)

Copiar rutina ejecutable:
```bash
sudo cp led_teclado.sh /usr/bin/led_teclado.sh
sudo chmod +x /usr/bin/led_teclado.sh
```

Crear archivo de servicio: `led_teclado.service`

```
[Unit]
Description=Encender LEDs de teclado - tarea periodica.

[Service]
Type=simple
ExecStart=/bin/bash /usr/bin/led_teclado.sh

[Install]
WantedBy=multi-user.target
```

Copiar archivo de servicio y asignar permisos:

```bash
sudo cp led_teclado.service /etc/systemd/system/led_teclado.service
sudo chmod 644  /etc/systemd/system/led_teclado.service
```

Ordenar el arranque del servicio manualmente: opción `start`

```bash
sudo systemctl start led_teclado
```

Ver el estado de ejecución: opción `status`

```bash
sudo systemctl status led_teclado
```

Ordenar la detención del servicio manualmente: opción `stop`
```bash
sudo systemctl stop led_teclado
```

Habilitar ejecución al inicio: opción `enable`

```bash
sudo systemctl enable led_teclado
```

En caso de realizar cambios sobre las rutinas hay que recargar:

```bash
systemctl daemon-reload
```

## Permitir permisos

Esta rutina requiere que el usuario tenga permisos de escritura para acceder a los ficheros de los LEDS de Wayland para que funcione correctamente. 

### opción a: permisos `sudo`

Se puede habilitar al usuario con el comando `adduser`: 
```bash
sudo adduser -D <nombre_usuario> sudo
```

Se verifica que el usuario posea
```bash
sudo -l -U <nombre_usuario> 
```

### opción b: editar `sudoers`

La alternativa es editar el archivo `sudoers` para aignar permisos de ejecucion de esta rutina particular:
```bash
sudo nano /etc/sudoers
```
y agregarle esta línea para habilitarle permisos de ejecucion a todos los usuarios:
 
```bash
## Habilitacion para encender los LEDs
ALL ALL=(ALL) /etc/systemd/system/led_teclado.service
```



## Referencias:

[Linode.com - Start service at boot](https://www.linode.com/docs/guides/start-service-at-boot/)


[Linux Console.es - Cómo agregar un usuario a Sudoers](https://es.linux-console.net/?p=23202)