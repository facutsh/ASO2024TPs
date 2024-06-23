#! /bin/bash

echo "Ingrese un nombre: "

read nombre                         #este es el nombre

URL=$(curl -s https://api.genderize.io/?name=$nombre)           #Para poder usar la pagina con el nombre ingresado

genero=$(echo $URL | jq -r '.gender')           #A genero le asigno el valor que tiene en la pagina web el nombre ingresado

if [ "$genero" == "male" ]          #Analiza si la persona es masculina
then
    echo "El probable genero de la persona de nombre $nombre es masculino"
elif [ "$genero" == "female" ]          #Analiza si la persona es femenina
then
    echo "El probable genero de la persona de nombre $nombre es femenino"
else            #Si no se le puede determinar el genero
    echo "No se pudo determinar el genero del nombre $nombre"
fi