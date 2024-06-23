#! /bin/bash

aleatorio=$(( (RANDOM % 100) + 1 ))     #genera el numero a adivinar
intentos=1                              #Variable para ver cuantos intentos tomo adivinar

lejos=40                            #variables para medir que tan lejos se esta del
medio=20                            #numero a adivinar
cerca=10
casi=3

while ((num != aleatorio))
do

    echo "Ingrese un numero:"       
    read num                            #el usuario adivina

    if ((num < aleatorio - lejos))              #condicionales para medir la diferencia
    then
        echo "El numero $num es muy menor, siga intentando!"
    elif ((num >= aleatorio - lejos)) && ((num < aleatorio - medio))
    then
        echo "El numero $num es menor, siga intentando!"
    elif ((num >= aleatorio - medio)) && ((num < aleatorio - cerca))
    then    
        echo "El numero $num es menor, pero se esta acercando!!"
    elif ((num >= aleatorio - cerca)) && ((num < aleatorio - casi))
    then
        echo "El numero $num es menor, pero ya esta bastante cerca!!"
    elif ((num >= aleatorio - casi)) && ((num < aleatorio))
    then
        echo "Ya casi!, el numero $num es menor pero por muy poco!"
    elif ((num > aleatorio + lejos))
    then
        echo "El numero $num es muy mayor, siga intentando!"
    elif ((num <= aleatorio + lejos)) && ((num > aleatorio + medio))
    then
        echo "El numero $num es mayor, siga intentando!"
    elif ((num <= aleatorio + medio)) && ((num > aleatorio + cerca))
    then    
        echo "El numero $num es mayor, pero se esta acercando!!"
    elif ((num <= aleatorio + cerca)) && ((num > aleatorio + casi))
    then
        echo "El numero $num es mayor, pero ya esta bastante cerca!!"
    elif ((num <= aleatorio + casi)) && ((num > aleatorio))
    then
        echo "Ya casi!, el numero $num es mayor pero por muy poco!"
    elif ((num == aleatorio))
    then    
        echo "Acertaste!!"
        break
    fi

    intentos=$((intentos + 1))

done

echo "Te tomo $intentos intentos adivinar!"