# Monitoreo y Visualización de Recursos en Raspberry Pi

---

## Descripción

Este repositorio contiene dos scripts que permiten monitorear los recursos de una Raspberry Pi mientras ejecuta un emulador de juegos. Los datos recolectados se exportan a un archivo CSV y luego se analizan mediante gráficos para visualizar el consumo de CPU, RAM, temperatura, y uso de disco.

---

## Funcionalidades

1. **Monitoreo de Recursos con Bash**
   - El script `monitoreo_recursos.sh` monitorea los siguientes recursos de la Raspberry Pi:
     - **CPU (%)**: Porcentaje de uso de la CPU.
     - **RAM Usada (MB)**: Memoria RAM consumida en megabytes.
     - **RAM Total (MB)**: Total de memoria disponible.
     - **Temperatura (°C)**: Temperatura de la CPU.
     - **Disco Usado (%)**: Porcentaje de espacio usado en el disco.
     - **Estado del Emulador**: Indica si el emulador está activo o no.
   - Los datos se guardan en un archivo CSV con encabezados.

2. **Análisis y Visualización con Python**
   - El script `visualizacion_recursos.py` lee el archivo CSV generado y crea gráficos de línea para analizar:
     - Uso de CPU.
     - Uso de RAM.
     - Temperatura de la CPU.
     - Uso de disco.
   - Utiliza la biblioteca **Matplotlib** para generar las gráficas.

---

## Requisitos

### 1. Hardware:
   - Raspberry Pi con sistema operativo basado en Linux.
   - Emulador de juegos instalado (por ejemplo: `mgba` o `retroarch`).

### 2. Software:
   - Bash Shell.
   - Python 3.x con las siguientes bibliotecas instaladas:
     - `matplotlib`
     - `pandas`

---

## Cómo Usar

### 1. **Ejecutar el Script de Monitoreo**
   - Asegúrate de que el script `monitoreo_recursos.sh` tenga permisos de ejecución:
     ```bash
     chmod +x monitoreo_recursos.sh
     ```
   - Modifica el nombre del emulador en la variable `EMULATOR_NAME` dentro del script, si es necesario.
   - Ejecuta el script:
     ```bash
     ./monitoreo_recursos.sh
     ```
   - El monitoreo durará 5 minutos (configurable en la variable `MONITOR_DURATION`) y los datos se guardarán en `monitoreo_recursos.csv`.

### 2. **Analizar los Datos**
   - Asegúrate de que el archivo CSV generado (`monitoreo_recursos.csv`) esté disponible en la misma carpeta que el script Python.
   - Ejecuta el script `visualizacion_recursos.py`:
     ```bash
     python3 visualizacion_recursos.py
     ```
   - Se generarán gráficos interactivos que muestran el consumo de recursos a lo largo del tiempo.

---

## Personalización

- **Duración del Monitoreo**:
  Modifica la variable `MONITOR_DURATION` en segundos en el script Bash para cambiar el tiempo de monitoreo.
  
- **Nombre del Emulador**:
  Cambia el valor de `EMULATOR_NAME` según el emulador que desees monitorear.

- **Añadir Nuevas Métricas**:
  Puedes extender el script Bash para incluir nuevas métricas según tus necesidades.

---

## Ejemplo de Visualización

Gráficos generados por el script Python incluyen:
- **Uso de CPU (%) vs Tiempo**.
- **Uso de RAM (MB) vs Tiempo**.
- **Temperatura de la CPU (°C) vs Tiempo**.
- **Uso de Disco (%) vs Tiempo**.

---

## Créditos

- **Script Bash**: Monitoreo de recursos desarrollado en Bash para sistemas Linux.
- **Script Python**: Visualización de recursos utilizando Pandas y Matplotlib.

---

## Licencia

Este proyecto está licenciado bajo la [MIT License](LICENSE).
