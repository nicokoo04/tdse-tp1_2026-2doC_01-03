# Modelo System (Procesamiento)

## Descripción del Módulo (Paso 08)
El módulo **System** es un módulo de código C del tipo temporizado (*Update by Time Code*, período = 1mS) cuya función dentro de la arquitectura es **procesar** (*Process*) la lógica de control del sistema . 

Recibe eventos y señales enviadas por el módulo `Sensor`, evalúa las condiciones lógicas y despacha las señales correspondientes hacia el módulo `Actuator` .

---

## Convención de Identificadores y Eventos (Paso 08)
* **Señales de Entrada (Signals desde Sensor):** `EV_SYS_BTN_PRESSED`, `EV_SYS_BTN_RELEASED` 
* **Señales de Salida (Signals hacia Actuator):** `EV_ACT_LED_ON`, `EV_ACT_LED_OFF` 
* **Estados de Control:** `ST_SYS_IDLE`, `ST_SYS_ACTIVE`, `ST_SYS_WAITING_RELEASE` 
* **Temporizadores Internos:** `tick` // `0`, `DEL_SYS_TIMEOUT` 

### Eventos de Entrada
1. **`EV_SYS_BTN_PRESSED`**: Notificación recibida del módulo Sensor al confirmarse la pulsación estable del botón .
2. **`EV_SYS_BTN_RELEASED`**: Notificación recibida del módulo Sensor al confirmarse la liberación del botón .

### Acciones y Señales de Salida
1. **`PutMessage(EV_ACT_LED_ON)`**: Orden enviada al módulo Actuator para activar la salida (ej. abrir barrera o encender LED) .
2. **`PutMessage(EV_ACT_LED_OFF)`**: Orden enviada al módulo Actuator para desactivar la salida (ej. cerrar barrera o apagar LED) .
3. **`tick = 0` / `tick++`**: Control de temporización interna para el manejo de timeouts del sistema .

---

## System Statechart - Tabla de Transición de Estados (Paso 09)

A continuación se presenta la tabla de Estados y Excitaciones (*State Transition Table*) del modelo **System** :

| Current State | Event | [Guard] | Next State | Actions |
| :--- | :--- | :--- | :--- | :--- |
| `ST_SYS_IDLE` | `EV_SYS_BTN_PRESSED` | - | `ST_SYS_ACTIVE` | `PutMessage(EV_ACT_LED_ON)`, `tick = 0` |
| `ST_SYS_IDLE` | - | - | `ST_SYS_IDLE` | - |
| `ST_SYS_ACTIVE` | `EV_SYS_BTN_RELEASED` | - | `ST_SYS_WAITING_RELEASE` | `tick = 0` |
| `ST_SYS_ACTIVE` | - | `[tick < DEL_SYS_TIMEOUT]` | `ST_SYS_ACTIVE` | `tick++` |
| `ST_SYS_ACTIVE` | - | `[tick >= DEL_SYS_TIMEOUT]` | `ST_SYS_IDLE` | `PutMessage(EV_ACT_LED_OFF)` |
| `ST_SYS_WAITING_RELEASE` | - | `[tick < DEL_SYS_HOLD]` | `ST_SYS_WAITING_RELEASE` | `tick++` |
| `ST_SYS_WAITING_RELEASE` | - | `[tick >= DEL_SYS_HOLD]` | `ST_SYS_IDLE` | `PutMessage(EV_ACT_LED_OFF)` |
