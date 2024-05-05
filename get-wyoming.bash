############################################
# 
# Script Para Baixar dados de Radiossonda
# Laboratorio de Meteorologia - UFOPA 
# Dev: Arthur Duarte 	       
# Fonte: Uwyoming  
# 23 - 08 - 2023  
#
############################################

#!/bin/bash   

# Diretório de saída principal
dirout="/home/arthur/dados/altitude/wyoming/brutos/"
estacao="82244"
local="santarem"

# Loop pelos anos
for ano in {2023..2023}; do
    # Crie um diretório para o ano se ele não existir
    dirano="${dirout}/${local}-${estacao}/${ano}"
    mkdir -p "$dirano"

    # Loop pelos meses de janeiro a dezembro
    for mes in {02..02}; do
        # Crie um diretório para o mês se ele não existir
        dirano_mes="${dirano}/${mes}"
        mkdir -p "$dirano_mes"

        # Loop pelos dias e horas
        for dia in {01..31}; do
            for hora in 00 12; do
                url="https://weather.uwyo.edu/cgi-bin/sounding?region=samer&TYPE=TEXT%3ALIST&YEAR=$ano&MONTH=$mes&FROM=$dia$hora&TO=$dia$hora&STNM=$estacao"

                # Nome do arquivo de saída
                saida="${dirano_mes}/${local}-${estacao}-${ano}-${mes}-${dia}-${hora}Z.csv"

                # Baixe os arquivos e formate-os
                wget --no-check-certificate -cO - -qO- "$url" |
                sed '/---------------------------------------------------------------/d' |
                sed '/hPa/d' |
                sed -e 's/<[^>]*>//g' |                                     
                awk '/Station/ {found=1} !found' > "$saida"
            done
        done
    done
done

# Remova as primeiras 5 linhas de todos os arquivos CSV
find "${dirout}" -name "*.csv" -exec sed -i '1,5d' {} \;

exit

#------------------comando usado para leitura dos arquivos em python------------------#

import pandas as pd
import matplotlib.pyplot as plt

dir = "/home/arthur/radiossonda/dados/wyoming/82099-07.txt"

# cabecalho
name_col = ["PRES", "HGHT", "TEMP", "DWPT", "RELH", "MIXR", "DRCT", "SKNT", "THTA", "THTE", "THTV"]
dados = pd.read_csv(dir, delim_whitespace=True, names=name_col, skiprows=1)
display(dados)
