# Modelo Actuator (Un solo LED)

## Descripción del Módulo (Paso 10)
El módulo **Actuator** es un módulo de código C del tipo temporizado (*Update by Time Code*, período = 1mS) encargado de la etapa de **actuar** (*Act*) . Su función es recibir los mensajes/señales provenientes del módulo `System` y modificar el estado físico de los actuadores de salida (por ejemplo, el LED o la barrera de acceso) .

Un LED o salida digital puede adoptar estados de encendido, apagado o secuencias temporizadas utilizando temporizadores internos (`tick`) .

---

## Convención de Identificadores y Eventos (Paso 10)
* **Señales de Entrada (Signals desde System):** `EV_ACT_LED_ON`, `EV_ACT_LED_OFF` 
* **Estados:** `ST_ACT_OFF`, `ST_ACT_ON` 
* **Temporizadores Internos:** `tick` // `0`, `DEL_ACT_NAME` 

### Eventos y Señales de Entrada
1. **`EV_ACT_LED_ON`**: Comando recibido desde `System` para encender la salida digital (LED / Barrera Abierta) .
2. **`EV_ACT_LED_OFF`**: Comando recibido desde `System` para apagar la salida digital (LED / Barrera Cerrada) .

### Acciones Físicas
1. **`SetDigitalOutput(ON)`**: Modifica el pin de salida a nivel lógico ALTO para encender el LED/actuador .
2. **`SetDigitalOutput(OFF)`**: Modifica el pin de salida a nivel lógico BAJO para apagar el LED/actuador .

---

## Actuator Statechart - Tabla de Transición de Estados (Paso 11)

A continuación se presenta la tabla de Estados y Excitaciones (*State Transition Table*) del modelo **Actuator** :

| Current State | Event | [Guard] | Next State | Actions |
| :--- | :--- | :--- | :--- | :--- |
| `ST_ACT_OFF` | `EV_ACT_LED_ON` | - | `ST_ACT_ON` | `SetDigitalOutput(ON)` |
| `ST_ACT_OFF` | `EV_ACT_LED_OFF` | - | `ST_ACT_OFF` | `SetDigitalOutput(OFF)` |
| `ST_ACT_ON` | `EV_ACT_LED_OFF` | - | `ST_ACT_OFF` | `SetDigitalOutput(OFF)` |
| `ST_ACT_ON` | `EV_ACT_LED_ON` | - | `ST_ACT_ON` | `SetDigitalOutput(ON)` |
