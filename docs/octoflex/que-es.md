---
title: Qué es OctoFlex
description: OctoFlex despliega nubes privadas llave en mano sobre OpenStack y Ceph, y acompaña con asesoría técnica durante todo el ciclo de vida.
tags:
  - octoflex
  - cloud privado
---

# Qué es OctoFlex

**OctoFlex despliega nubes privadas llave en mano sobre OpenStack y Ceph, y
acompaña con asesoría técnica durante todo el ciclo de vida.**

No vendemos acceso a una nube nuestra: construimos la tuya, sobre tu hardware o
sobre el que te ayudemos a dimensionar, y te la entregamos funcionando. A partir
de ahí puedes operarla tú, que la operemos nosotros, o cualquier punto
intermedio.

## Qué significa "llave en mano"

El proyecto cubre el ciclo completo, no una fase suelta:

<div class="grid cards" markdown>

- :material-clipboard-text-search-outline:{ .lg .middle } **Diseño**

    ---

    Dimensionado de cómputo, almacenamiento y red a partir de tus cargas reales.
    Salimos con una arquitectura concreta, no con una recomendación genérica.

- :material-server-network:{ .lg .middle } **Despliegue**

    ---

    Instalación de OpenStack con Kolla-Ansible y de Ceph con cephadm, con la
    configuración versionada y reproducible desde el primer día.

- :material-tune:{ .lg .middle } **Puesta en servicio**

    ---

    Proyectos, cuotas, redes, imágenes, tipos de instancia y respaldos. La nube
    se entrega lista para recibir cargas, no recién instalada.

- :material-school-outline:{ .lg .middle } **Transferencia**

    ---

    Formación al equipo que la va a operar y documentación de la instalación
    concreta. El objetivo es que no dependas de nosotros para el día a día.

</div>

## A quién va dirigido

A organizaciones que necesitan infraestructura de nube **bajo su control**:
porque el dato no puede salir de sus instalaciones, porque el coste de la nube
pública se ha vuelto difícil de sostener, o porque quieren salir de una
plataforma propietaria sin cambiar una dependencia por otra.

El tamaño y la forma del despliegue varían mucho entre clientes. Por eso la
[arquitectura de referencia](arquitectura.md) se plantea como un escenario
productivo de ejemplo del que partir, no como un producto cerrado.

## Sobre qué está construido

Sobre software libre, sin capas propietarias intermedias:

| Componente | Tecnología | Versión objetivo |
| --- | --- | --- |
| Plataforma de nube | [OpenStack](../doc/openstack/openstack_base.md) | 2026.1 *Gazpacho* |
| Almacenamiento | [Ceph](../doc/ceph/ceph_base.md) | Squid (19.2.x) o superior |
| Despliegue | Kolla-Ansible | rama de la release objetivo |

El porqué de cada una de estas elecciones está argumentado en
[Decisiones técnicas](decisiones.md).

!!! info "Proyecto en fase de diseño"

    OctoFlex es un proyecto nuevo. Esta documentación describe la arquitectura
    y los servicios tal y como se están definiendo. Cuando una sección
    describa algo todavía no validado en un entorno real, lo indicará
    explícitamente.
