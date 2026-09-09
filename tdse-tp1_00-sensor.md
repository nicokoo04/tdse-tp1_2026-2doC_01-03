# Modelo Sensor (Un solo botón)

## Descripción del Módulo
El módulo **Sensor** es un módulo de código C del tipo temporizado (*Update by Time Code*, con un período de 1 ms) cuya función dentro de la arquitectura es **escrutar** (*Scrutinize*) el estado físico del pulsador/botón .

Al presionar o soltar un pulsador mecánico, se produce un fenómeno conocido como rebote (*switch bounce* o *glitch*), generando fluctuaciones rápidas e indeseadas en la señal eléctrica antes de estabilizarse . Para evitar lecturas falsas, el módulo implementa un algoritmo de filtrado/antirrebote (*debouncing*) mediante el uso de un temporizador (`tick`) y un retardo configurado (`DEL_BTN_NAME`) .

---

## Convención de Identificadores
De acuerdo con las especificaciones del trabajo práctico, se utilizan las siguientes convenciones de nombres :

* **Eventos de Entrada (Hardware/Posición):** `EV_BTN_NAME` 
* **Señales hacia el Sistema (Signals):** `EV_SYS_NAME` 
* **Estados:** `ST_BTN_NAME` 
* **Temporizador / Retardo:** `tick` // `0`, `DEL_BTN_NAME` 

---

## Eventos (Triggers de Entrada)
Son los eventos binarios que reflejan la posición física leída del botón en cada ciclo de 1 ms :

1. **`EV_BTN_UP`** (o `EV_BTN_NOT_PRESSED`): Indica que el botón se encuentra físicamente liberado (nivel lógico en reposo) .
2. **`EV_BTN_DOWN`** (o `EV_BTN_PRESSED`): Indica que el botón se encuentra físicamente presionado .

---

## Acciones y Señales (Signals)
Las acciones reflejan que ocurrió un cambio de posición válido y estable en el botón después del proceso de desrebote, o bien corresponden a operaciones internas de control del temporizador :

1. **Señales (*Signals*) hacia el Módulo System:**
   * **`EV_SYS_BTN_PRESSED`**: Señal enviada al módulo `System` para notificar que el botón ha sido presionado de forma estable .
   * **`EV_SYS_BTN_RELEASED`**: Señal enviada al módulo `System` para notificar que el botón ha sido liberado de forma estable .

2. **Acciones de Control Interno (Temporizador/Guarda):**
   * **`tick = 0`**: Inicialización/reinicio del contador de tiempo al detectar un posible cambio de nivel en la entrada .
   * **`tick++`**: Incremento del temporizador en cada ciclo de 1 ms para medir la duración del estado de transición .
   * **Condición de Guarda `[tick >= DEL_BTN_NAME]`**: Se evalúa para confirmar que la señal se mantuvo estable durante el tiempo de retardo necesario, permitiendo la transición de estado definitiva .
