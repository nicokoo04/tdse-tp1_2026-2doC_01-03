# Modelo Actuator (Control de LED y Barrera)

## Descripción del Módulo
El módulo **Actuator** es un módulo de código C del tipo temporizado (*Update by Time Code*, período = 1mS) encargado de la etapa de **actuar** (*Act*). Su función es recibir los mensajes/señales provenientes del módulo `System` y modificar el estado físico de los actuadores de salida.

En este diseño, un único LED físico se utiliza para representar múltiples estados de una barrera de acceso. Para lograrlo, el sistema puede adoptar estados fijos (encendido/apagado) o secuencias temporizadas utilizando la base de tiempo (`ev_tick`). Se incorporaron dos rutinas de parpadeo a distinta frecuencia: una lenta para indicar que la barrera está subiendo, y otra rápida para cuando está bajando.

---

## Convención de Identificadores y Eventos

* **Señales de Entrada (desde System):** `EV_ACT_LED_ON`, `EV_ACT_LED_OFF`, `EV_ACT_BARRERA_SUBE`, `EV_ACT_BARRERA_BAJA`
* **Señales de Tiempo:** `ev_tick` (Resolución de 1mS)
* **Estados Fijos:** `ST_ACT_OFF`, `ST_ACT_ON`
* **Estados de Parpadeo (Sube):** `ST_ACT_BLINK_ON`, `ST_ACT_BLINK_OFF`
* **Estados de Parpadeo (Baja):** `ST_ACT_BLINK_ON_2`, `ST_ACT_BLINK_OFF_2`
* **Variables Internas:** `timer`, `led_state`, `DEL_BLINK_1`, `DEL_BLINK_2`

### Eventos y Señales de Entrada
1. **`EV_ACT_LED_ON`**: Comando para encender la salida de forma fija.
2. **`EV_ACT_LED_OFF`**: Comando para apagar la salida de forma fija.
3. **`EV_ACT_BARRERA_SUBE`**: Comando que activa el ciclo temporal con frecuencia 1 (`DEL_BLINK_1`), indicando visualmente que la barrera está en ascenso.
4. **`EV_ACT_BARRERA_BAJA`**: Comando que activa el ciclo temporal con frecuencia 2 (`DEL_BLINK_2`), indicando visualmente que la barrera está en descenso.

### Acciones Físicas
1. **`SetDigitalOutput(true)`**: Modifica el pin de salida a nivel lógico ALTO para encender el LED.
2. **`SetDigitalOutput(false)`**: Modifica el pin de salida a nivel lógico BAJO para apagar el LED.

---


## Actuator Statechart - Tabla de Transición de Estados

A continuación se presenta la tabla de Estados y Excitaciones (*State Transition Table*) del modelo **Actuator**:

| Current State             | Event                  | [Guard]                | Next State            | Actions                                                 |
| :------------------------ | :--------------------- | :--------------------- | :-------------------- | :------------------------------------------------------ |
| **`ST_ACT_OFF`**          | `EV_ACT_LED_OFF`       | -                      | `ST_ACT_OFF`          | `SetDigitalOutput(false); led_state = false`            |
| **`ST_ACT_OFF`**          | `EV_ACT_LED_ON`        | -                      | `ST_ACT_ON`           | `SetDigitalOutput(true); led_state = true`              |
| **`ST_ACT_OFF`**          | `EV_ACT_BARRERA_SUBE`  | -                      | `ST_ACT_BLINK_ON`     | -                                                       |
| **`ST_ACT_OFF`**          | `EV_ACT_BARRERA_BAJA`  | -                      | `ST_ACT_BLINK_ON_2`   | -                                                       |
| **`ST_ACT_ON`**           | `EV_ACT_LED_ON`        | -                      | `ST_ACT_ON`           | `SetDigitalOutput(true); led_state = true`              |
| **`ST_ACT_ON`**           | `EV_ACT_LED_OFF`       | -                      | `ST_ACT_OFF`          | `SetDigitalOutput(false); led_state = false`            |
| **`ST_ACT_ON`**           | `EV_ACT_BARRERA_SUBE`  | -                      | `ST_ACT_BLINK_ON`     | -                                                       |
| **`ST_ACT_ON`**           | `EV_ACT_BARRERA_BAJA`  | -                      | `ST_ACT_BLINK_ON_2`   | -                                                       |
| **`ST_ACT_BLINK_ON`**     | `ev_tick`              | -                      | `ST_ACT_BLINK_ON`     | `timer += 1; SetDigitalOutput(true); led_state = true`  |
| **`ST_ACT_BLINK_ON`**     | `ev_tick`              | `timer > DEL_BLINK_1`  | `ST_ACT_BLINK_OFF`    | `SetDigitalOutput(false); led_state = false; timer = 0` |
| **`ST_ACT_BLINK_ON`**     | `EV_ACT_LED_OFF`       | -                      | `ST_ACT_OFF`          | `SetDigitalOutput(false)`                               |
| **`ST_ACT_BLINK_ON`**     | `EV_ACT_LED_ON`        | -                      | `ST_ACT_ON`           | `SetDigitalOutput(true)`                                |
| **`ST_ACT_BLINK_ON`**     | `EV_ACT_BARRERA_BAJA`  | -                      | `ST_ACT_BLINK_ON_2`   | -                                                       |
| **`ST_ACT_BLINK_OFF`**    | `ev_tick`              | -                      | `ST_ACT_BLINK_OFF`    | `timer += 1`                                            |
| **`ST_ACT_BLINK_OFF`**    | `ev_tick`              | `timer > DEL_BLINK_1`  | `ST_ACT_BLINK_ON`     | `SetDigitalOutput(true); led_state = true; timer = 0`   |
| **`ST_ACT_BLINK_OFF`**    | `EV_ACT_LED_OFF`       | -                      | `ST_ACT_OFF`          | `SetDigitalOutput(false)`                               |
| **`ST_ACT_BLINK_OFF`**    | `EV_ACT_LED_ON`        | -                      | `ST_ACT_ON`           | `SetDigitalOutput(true)`                                |
| **`ST_ACT_BLINK_OFF`**    | `EV_ACT_BARRERA_BAJA`  | -                      | `ST_ACT_BLINK_ON_2`   | -                                                       |
| **`ST_ACT_BLINK_ON_2`**   | `ev_tick`              | -                      | `ST_ACT_BLINK_ON_2`   | `timer += 1; SetDigitalOutput(true); led_state = true`  |
| **`ST_ACT_BLINK_ON_2`**   | `ev_tick`              | `timer > DEL_BLINK_2`  | `ST_ACT_BLINK_OFF_2`  | `SetDigitalOutput(false); led_state = false; timer = 0` |
| **`ST_ACT_BLINK_ON_2`**   | `EV_ACT_LED_OFF`       | -                      | `ST_ACT_OFF`          | `SetDigitalOutput(false)`                               |
| **`ST_ACT_BLINK_ON_2`**   | `EV_ACT_LED_ON`        | -                      | `ST_ACT_ON`           | `SetDigitalOutput(true)`                                |
| **`ST_ACT_BLINK_ON_2`**   | `EV_ACT_BARRERA_SUBE`  | -                      | `ST_ACT_BLINK_ON`     | -                                                       |
| **`ST_ACT_BLINK_OFF_2`**  | `ev_tick`              | -                      | `ST_ACT_BLINK_OFF_2`  | `timer += 1`                                            |
| **`ST_ACT_BLINK_OFF_2`**  | `ev_tick`              | `timer > DEL_BLINK_2`  | `ST_ACT_BLINK_ON_2`   | `SetDigitalOutput(true); led_state = true; timer = 0`   |
| **`ST_ACT_BLINK_OFF_2`**  | `EV_ACT_LED_OFF`       | -                      | `ST_ACT_OFF`          | `SetDigitalOutput(false)`                               |
| **`ST_ACT_BLINK_OFF_2`**  | `EV_ACT_LED_ON`        | -                      | `ST_ACT_ON`           | `SetDigitalOutput(true)`                                |
| **`ST_ACT_BLINK_OFF_2`**  | `EV_ACT_BARRERA_SUBE`  | -                      | `ST_ACT_BLINK_ON`     | -                                                       |
