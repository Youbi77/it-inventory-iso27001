#!/bin/bash
# Script de Inventario ISO 27001 - Bilal El Younossi

FECHA=$(date +'%Y-%m-%d_%H-%M')
ARCHIVO="Ficha_Tecnica_$FECHA.txt"

echo "=== GENERANDO FICHA TECNICA (LINUX) ===" > $ARCHIVO
echo "Fecha: $(date)" >> $ARCHIVO
echo "--------------------------------------" >> $ARCHIVO

echo "1. DATOS DEL EQUIPO" >> $ARCHIVO
echo "Serie PC: $(sudo dmidecode -s system-serial-number)" >> $ARCHIVO
echo "Modelo: $(sudo dmidecode -s system-product-name)" >> $ARCHIVO

echo -e "\n2. DATOS DE DISCOS" >> $ARCHIVO
lsblk -d -o NAME,MODEL,SERIAL,SIZE >> $ARCHIVO

echo -e "\n3. DATOS DE RED" >> $ARCHIVO
echo "IP: $(hostname -I)" >> $ARCHIVO
echo "MAC: $(cat /sys/class/net/$(ls /sys/class/net | grep -v lo | head -n 1)/address)" >> $ARCHIVO

echo "--------------------------------------" >> $ARCHIVO
echo "Ficha generada en: $ARCHIVO"
cat $ARCHIVO
