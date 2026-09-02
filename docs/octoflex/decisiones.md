---
title: Decisiones técnicas
description: Por qué OpenStack, por qué Kolla-Ansible, por qué Ceph y por qué estas versiones. Las decisiones de diseño de OctoFlex, argumentadas.
tags:
  - octoflex
  - arquitectura
  - openstack
  - ceph
---

# Decisiones técnicas

Estas son las decisiones que definen la plataforma, con el razonamiento detrás
de cada una. Están abiertas a revisión: si tu caso pide otra cosa, se cambia y
se documenta el porqué.

## Por qué OpenStack

El requisito de partida es una nube **bajo control del cliente**, sin depender
de un proveedor externo ni de licencias que puedan cambiar de precio o de dueño.
Eso descarta la nube pública y la virtualización propietaria.

Entre las alternativas abiertas, OpenStack es la única que cubre cómputo, red,
almacenamiento e identidad multi-inquilino como una plataforma integrada, con
API estable y una comunidad que lleva más de una década sosteniéndola.

**Lo que se descartó y por qué:**

| Alternativa | Motivo del descarte |
| --- | --- |
| Virtualización propietaria | Es justo la dependencia de la que muchos clientes quieren salir. |
| Sólo Kubernetes | Resuelve contenedores, no infraestructura. Muchas cargas siguen siendo máquinas virtuales, y el propio clúster necesita algo debajo. |
| Proxmox / oVirt | Válidos para virtualización, pero sin el modelo multi-inquilino ni la API de nube que exige un entorno con varios departamentos o clientes. |
| Nube pública | No cumple el requisito de control ni, con frecuencia, el de coste sostenido. |

OpenStack tiene un coste real: es más complejo de operar. Esa complejidad es
precisamente lo que absorbemos en el [servicio llave en mano](servicios.md).

## Por qué Kolla-Ansible

OpenStack se puede desplegar de muchas maneras. Kolla-Ansible ejecuta cada
servicio en contenedores y orquesta la instalación con Ansible.

| Método | Valoración |
| --- | --- |
| **Kolla-Ansible** *(elegido)* | Servicios en contenedores, configuración declarativa y versionable, actualizaciones por servicio y reversibles, comunidad activa. |
| OpenStack-Ansible | Sólido y comparable. Contenedores LXC en lugar de imágenes de contenedor; menos cómodo para reproducir un entorno idéntico. |
| Distribución comercial | Aporta soporte del fabricante, a cambio de la dependencia de la que el cliente quería salir. |
| Instalación manual | Inviable de mantener y de reproducir. |
| DevStack | Herramienta de desarrollo. No es para producción, y su propia documentación lo dice. |

Lo determinante es la **reproducibilidad**: con Kolla-Ansible la configuración
del despliegue es un repositorio git. Ese repositorio se entrega al cliente, y
con él puede reconstruir su plataforma sin nosotros. Es lo que hace que "llave
en mano" no signifique "caja negra".

## Por qué Ceph

El almacenamiento es donde más caro sale equivocarse.

- **Una sola plataforma para tres necesidades**: bloque para las instancias
  (Cinder), objeto compatible con S3 (RGW) y sistema de ficheros (CephFS). Sin
  integrar tres productos distintos.
- **Integración nativa con OpenStack**: Cinder, Glance y Nova hablan con Ceph
  directamente. Un volumen se clona por copia en escritura, sin mover datos.
- **Sin cabina propietaria**: crece añadiendo nodos, no comprando ampliaciones
  al fabricante.
- **Recuperación automática**: la pérdida de un disco o de un nodo la resuelve
  el propio clúster, sin intervención manual.

**Cuándo no es la respuesta:** un despliegue muy pequeño, de pocos nodos, no
amortiza la complejidad de Ceph. Si el dimensionado apunta ahí, lo diremos y
propondremos almacenamiento local o una cabina existente.

## Versiones objetivo

### OpenStack 2026.1 *Gazpacho*

Es una release **SLURP** (*Skip Level Upgrade Release Process*), y ese es el
motivo principal de la elección.

OpenStack publica dos versiones al año, pero sólo las SLURP permiten saltar de
una a la siguiente SLURP directamente. Partir de Gazpacho significa **una
actualización al año en lugar de dos**, saltando a 2027.1 *Indri* sin pasar por
2026.2 *Hibiscus*. En una plataforma en producción, esa diferencia es una
ventana de mantenimiento menos al año.

| Dato | Valor |
| --- | --- |
| Publicada | 1 de abril de 2026 |
| Estado | Maintained |
| Fin de mantenimiento previsto | 27 de octubre de 2027 |
| Siguiente SLURP | 2027.1 *Indri* (marzo de 2027) |

Kolla-Ansible soporta hoy 2025.1, 2025.2 y 2026.1, así que la combinación está
cubierta.

### Ceph Squid (19.2.x) como mínimo

Squid es la serie estable actual. Fijamos **19.2.x o superior** como suelo, no
una versión exacta, para poder desplegar el último punto de mantenimiento
disponible en el momento de la instalación.

Reef (18.2.x) queda descartada para despliegues nuevos: no hay motivo para
empezar un proyecto en una serie que ya va por detrás.

## Cómo cambian estas decisiones

Cuando una decisión se revise, se actualiza esta página indicando qué cambió y
por qué. Una decisión sin fecha ni motivo no es una decisión documentada, es
una opinión antigua.

!!! warning "Pendiente de validar"

    OctoFlex está en fase de diseño. Estas decisiones están razonadas pero
    todavía no contrastadas contra un despliegue en producción. Esta advertencia
    desaparecerá cuando lo estén.
