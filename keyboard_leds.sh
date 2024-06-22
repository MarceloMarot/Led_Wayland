#! /bin/bash


led_folder=$1
delay=$2

cd $led_folder

content=`ls`

pattern="input" 

key="scrolllock"


while :
do

    for inner_folder in ${content[*]}
    do

        condition_1=`echo $inner_folder | grep $pattern | wc -l`
        condition_2=`echo $inner_folder | grep $key | wc -l`

        if [ $condition_1 -ge 1 -a $condition_2 -ge 1 ] 
        then

            led_path="$led_folder$inner_folder/brightness"
            echo $led_path

            if test -f $led_path
            then
                sudo echo 1 >> $led_path
            fi

        fi

    done

sleep $delay;    
done
