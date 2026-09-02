---
title: What is OctoFlex
description: OctoFlex delivers turnkey private clouds built on OpenStack and Ceph, with technical advisory throughout the whole lifecycle.
tags:
  - octoflex
  - private cloud
---

# What is OctoFlex

**OctoFlex delivers turnkey private clouds built on OpenStack and Ceph, with
technical advisory throughout the whole lifecycle.**

We do not sell access to a cloud of ours: we build yours, on your hardware or on
hardware we help you size, and hand it over running. From that point you can
operate it yourself, have us operate it, or anything in between.

## What "turnkey" means here

The engagement covers the full cycle, not an isolated phase:

<div class="grid cards" markdown>

- :material-clipboard-text-search-outline:{ .lg .middle } **Design**

    ---

    Sizing of compute, storage and networking based on your real workloads. The
    output is a concrete architecture, not a generic recommendation.

- :material-server-network:{ .lg .middle } **Deployment**

    ---

    OpenStack installed with Kolla-Ansible and Ceph with cephadm, with the
    configuration version-controlled and reproducible from day one.

- :material-tune:{ .lg .middle } **Service enablement**

    ---

    Projects, quotas, networks, images, flavors and backups. The cloud is handed
    over ready to take workloads, not merely installed.

- :material-school-outline:{ .lg .middle } **Handover**

    ---

    Training for the team that will operate it, plus documentation of your
    specific installation. The goal is that you do not depend on us day to day.

</div>

## Who it is for

Organisations that need cloud infrastructure **under their own control**:
because the data cannot leave their premises, because public cloud costs have
become hard to sustain, or because they want to move off a proprietary platform
without trading one lock-in for another.

Deployment size and shape vary a lot between clients. That is why the
[reference architecture](arquitectura.md) is framed as an example production
scenario to start from, not as a closed product.

## What it is built on

On open source software, with no proprietary layers in between:

| Component | Technology | Target version |
| --- | --- | --- |
| Cloud platform | [OpenStack](../doc/openstack/openstack_base.md) | 2026.1 *Gazpacho* |
| Storage | [Ceph](../doc/ceph/ceph_base.md) | Squid (19.2.x) or later |
| Deployment | Kolla-Ansible | branch matching the target release |

The reasoning behind each choice is documented in
[Technical decisions](decisiones.md).

!!! info "Project in design phase"

    OctoFlex is a new project. This documentation describes the architecture and
    services as they are being defined. Where a section describes something not
    yet validated in a real environment, it says so explicitly.
