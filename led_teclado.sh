#! /bin/bash

delay=1

carpeta_led="/sys/class/leds/"
cd $carpeta_led

# cd "/sys/class/leds/"

# contenido=`cd "/sys/class/leds/" | ls`
contenido=`ls`


patron="input" 

eleccion="scrolllock"

# echo $contenido

# Los LEDs se activan SI o SI cada 1 segundo
while :
do

    for carpeta_interna in ${contenido[*]}
    do

        # echo $carpeta_interna

        # detectar y contar coincidencias con el patrón
        coincidencia1=`echo $carpeta_interna | grep $patron | wc -l`
        coincidencia2=`echo $carpeta_interna | grep $eleccion | wc -l`

        if [ $coincidencia1 -ge 1 -a $coincidencia2 -ge 1 ] 
        then

            ruta_led="$carpeta_led/$carpeta_interna/brightness"
            echo $ruta_led


            if test -f $ruta_led
            then
                # echo "Exite"
                echo 1 | sudo tee $ruta_led
                echo "Archivo de control en $carpeta_interna activado"
                # echo $ruta_led
            else
                echo "ERROR: no exite el archivo de control en $carpeta_interna"
                # echo $ruta_led

            fi

        fi

    done

# repeticion cada 1 segundo
sleep $delay;    
done

# echo 1 | sudo tee /sys/class/leds/input3::scrolllock/brightness
# echo 1 | sudo tee /sys/class/leds/input4::scrolllock/brightness
