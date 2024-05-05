########################
# Labmet 05/08/2023    #
# Dev: Arthur Duarte   #
# Script queda Rs-stm  #
########################



#!/bin/bash

cd /home/arthur/graduacao/dados/rs-stm/tratados/
output_dir="/home/arthur/graduacao/dados/rs-stm/quedas/00"


for mes in jan23 fev23 mar23 abr23 mai23; do
    output_file="${output_dir}/${mes}_00.csv"
    echo "Latitude,Longitude,Altitude" > "$output_file"
    
    for i in *"${mes}"*/*00*descida.ptu; do
        head -n 2 "$i" | tail -1 | cut -d ',' -f12,13,14 >> "$output_file"
    done
done

exit

#--------- Comandos na mao ---------#

for i in *00*descida.ptu;do head -n 2 "$i" |tail -1 | cut -d ',' -f12,13,14; done
for i in *12*descida.ptu;do head -n 5 "$i" |tail -1 | cut -d ',' -f12,13,14; done

cd /home/arthur/graduacao/dados/rs-stm/tratados/

echo "latitude,longitude,altitude"

for mes in jan23; do
    for i in *"${mes}"*/*00*descida.ptu; do
    head -n 2 "$i" | tail -1 | cut -d ',' -f12,13,14
done
done 
   
echo "latitude,longitude,altitude"

for mes in fev23; do
    for i in *"${mes}"*/*00*descida.ptu; do
    head -n 2 "$i" | tail -1 | cut -d ',' -f12,13,14  
      
done
done

echo "latitude,longitude,altitude"

for mes in mar23; do
    for i in *"${mes}"*/*00*descida.ptu; do
    head -n 2 "$i" | tail -1 | cut -d ',' -f12,13,14  
      
done
done
