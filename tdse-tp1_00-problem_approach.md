# Solución de COMA Electronics

El **Intelligent Parking Management System** de COMA Electronics es un sistema automatizado para la gestión de estacionamientos. La solución completa se compone de un servidor del sistema de estacionamiento, máquinas de entrada y salida, computadoras de peaje y estaciones de pago automático. 

En el caso del **Automated Parking System**, el flujo es el siguiente: un vehículo llega a la terminal de entrada, donde se presiona un botón y se emite un ticket o tarjeta con un número de serie, fecha y hora. Luego, se envía una señal de apertura a la barrera para permitir el ingreso. Antes de regresar al vehículo para salir, el cliente abona en un punto de pago central. Finalmente, en la terminal de salida, se lee el ticket pagado y se envía una señal a la barrera para que el vehículo se retire.

La **Parking Ticket Dispenser Machine (Entry)** cuenta con varios elementos de interacción con el usuario, tales como un display LCD de 7", un intercomunicador opcional, lector de tarjetas, botón de ayuda, ranura para tickets, botón para emitir tickets y avisos por voz.

# Implementación de Parking Ticket Dispenser Machine (Entry)

La implementación se basa en una estructura de aplicación modular dividida en tres etapas: escrutar, procesar y actuar. El objetivo es editar, verificar, validar, codificar y depurar el modelo de comportamiento disgregado en tres módulos: Sensores, Sistema y Actuadores. 

Estos módulos se comunican y sincronizan entre sí mediante el uso de mensajes . Para asegurar un comportamiento comunitario donde ningún módulo se apropie de la CPU, la implementación emplea una ejecución cíclica de tareas no bloqueantes cada 1 milisegundo (1mS) . Se establece que el código bloqueante es completamente inaceptable .

# Modelos de Comportamiento y Reemplazo Físico

Para describir el comportamiento, se enuncian modelos para cada uno de los módulos de código C del tipo temporizado (*Update by Time Code*, period = 1mS) :
* Para **escrutar** => Modelo **Sensor** .
* Para **procesar** => Modelo **System** .
* Para **actuar** => Modelo **Actuator** .

### Reemplazos Físicos para el Prototipo

De ser posible, para la validación del sistema se reemplazarán los componentes reales por equivalentes electrónicos simples :
* Se reemplazarán por **pulsadores e interruptores dip switch** (Digital Inputs) a los sensores reales . Puntualmente: Camera (llaves On_Off), Button (pulsador) y Sensor coil (llaves On_Off) .
* Se reemplazarán por **leds** (Digital Outputs) a los actuadores reales (Display, Printer, Barrier y Server) .
