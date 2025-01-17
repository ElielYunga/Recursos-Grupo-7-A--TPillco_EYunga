#!/bin/bash

# Tiempo total para monitorear (en segundos)
MONITOR_DURATION=300  # 5 minutos
END_TIME=$((SECONDS + MONITOR_DURATION))

# Nombre del emulador a monitorear (por ejemplo: 'mgba', 'retroarch', etc.)
EMULATOR_NAME="mgba"  # Cambia esto según el emulador que uses

# Archivo CSV para almacenar los datos
OUTPUT_FILE="monitoreo_recursos.csv"

# Mensaje inicial
echo "-----------------------------"
echo "   Monitoreo de Raspberry Pi"
echo "   Duración: $((MONITOR_DURATION / 60)) minutos"
echo "   Guardando datos en: $OUTPUT_FILE"
echo "-----------------------------"

# Crear encabezado para el archivo CSV
echo "Tiempo,CPU(%),RAM Usada(MB),RAM Total(MB),Temp(°C),Disco Usado(%),Emulador" > "$OUTPUT_FILE"

# Función para monitorear recursos
while [ $SECONDS -lt $END_TIME ]; do
    # Tiempo transcurrido
    CURRENT_TIME=$((END_TIME - SECONDS))

    # Uso de CPU
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

    # Uso de RAM
    RAM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
    RAM_USED=$(free -m | awk '/Mem:/ {print $3}')

    # Temperatura de la CPU
    CPU_TEMP=$(vcgencmd measure_temp | awk -F'=' '{print $2}' | tr -d "'C")

    # Espacio en disco
    DISK_USAGE=$(df -h / | awk '/\// {print $5}' | tr -d '%')

    # Estado del emulador
    EMULATOR_PROCESS=$(pgrep -f "$EMULATOR_NAME")
    if [ -n "$EMULATOR_PROCESS" ]; then
        EMULATOR_STATUS="Sí"
    else
        EMULATOR_STATUS="No"
    fi

    # Agregar datos en un archivo CSV
    echo "$CURRENT_TIME,$CPU_USAGE,$RAM_USED,$RAM_TOTAL,$CPU_TEMP,$DISK_USAGE,$EMULATOR_STATUS" >> "$OUTPUT_FILE"

    # Pausa antes de la próxima medición
    sleep 1
done

# Mensaje final
echo "-----------------------------"
echo "Monitoreo completado."
echo "Datos guardados en: $OUTPUT_FILE"
echo "-----------------------------"
