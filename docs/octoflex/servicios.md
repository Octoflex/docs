---
title: Servicios
description: Nube privada llave en mano sobre OpenStack y Ceph, y asesoría cloud independiente. Qué incluye cada servicio y qué se entrega.
tags:
  - octoflex
  - servicios
---

# Servicios

Dos servicios, que se contratan juntos o por separado.

## Nube privada llave en mano

Diseñamos, desplegamos y ponemos en servicio una nube privada basada en
OpenStack y Ceph. El alcance por fases:

### 1. Análisis y dimensionado

Partimos de tus cargas reales, no de un catálogo de tallas.

- Inventario de lo que hay hoy: máquinas, consumo de CPU y memoria,
  almacenamiento en uso y su crecimiento, patrones de E/S.
- Requisitos que condicionan el diseño: retención de datos, ventanas de
  mantenimiento, objetivos de recuperación, obligaciones normativas.
- Dimensionado de cómputo, almacenamiento y red, con el margen de crecimiento
  acordado.

**Se entrega:** documento de arquitectura con el diseño concreto, lista de
materiales del hardware necesario y plan de despliegue por hitos.

### 2. Despliegue

- Preparación de los nodos y de la red física.
- OpenStack con Kolla-Ansible; Ceph con cephadm.
- Integración con lo que ya tengas: directorio de identidad, monitorización,
  copias de seguridad, gestión de tickets.
- Configuración versionada en un repositorio git desde el primer día.

**Se entrega:** entorno desplegado y el repositorio con la configuración, de
modo que el despliegue sea reproducible sin nosotros.

### 3. Puesta en servicio

Una nube recién instalada todavía no sirve para nada. Esta fase la deja lista:

- Proyectos, usuarios, roles y cuotas.
- Redes, direccionamiento y salida a internet.
- Catálogo de imágenes y tipos de instancia ajustados a tus cargas.
- Política de respaldo y prueba de restauración, ejecutada, no descrita.
- Pruebas de aceptación acordadas contigo antes de dar el entorno por bueno.

**Se entrega:** entorno en producción y el informe de las pruebas de aceptación.

### 4. Transferencia y formación

- Formación práctica al equipo que va a operar la plataforma.
- Documentación de *tu* instalación: topología real, decisiones tomadas,
  procedimientos de operación.
- Acompañamiento durante las primeras semanas de operación.

**Se entrega:** documentación de operación y equipo capaz de trabajar de forma
autónoma.

### Después de la entrega

La operación continuada es opcional y se define contigo. Puede ir desde soporte
puntual bajo demanda hasta operación completa. Lo que no hacemos es condicionar
la entrega a que nos contrates después: la plataforma es tuya y está construida
con software libre y configuración abierta.

## Asesoría cloud

Trabajo de consultoría que no exige desplegar nada:

<div class="grid cards" markdown>

- :material-compare-horizontal:{ .lg .middle } **Evaluación de alternativas**

    ---

    Nube pública, privada o híbrida, con números en la mano. Incluye el coste de
    operar, no sólo el de comprar.

- :material-swap-horizontal-bold:{ .lg .middle } **Salida de plataformas propietarias**

    ---

    Análisis de viabilidad y plan de migración desde virtualización propietaria,
    con las dependencias reales identificadas antes de empezar.

- :material-magnify-scan:{ .lg .middle } **Revisión de un OpenStack existente**

    ---

    Auditoría de una instalación en marcha: arquitectura, configuración,
    capacidad, respaldo y actualizabilidad. Informe con hallazgos priorizados.

- :material-cash-multiple:{ .lg .middle } **Optimización de costes**

    ---

    Revisión de consumo y dimensionado. A veces la conclusión es que no
    necesitas una nube privada; también lo diremos.

</div>

!!! note "Alcance y condiciones"

    Cada proyecto se dimensiona caso por caso. Los plazos, el alcance detallado
    y las condiciones de servicio se acuerdan por escrito antes de empezar.
    Escríbenos desde [Acerca de](../about.md) y lo hablamos.
