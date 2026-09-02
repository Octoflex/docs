---
title: Technical decisions
description: Why OpenStack, why Kolla-Ansible, why Ceph and why these versions. The design decisions behind OctoFlex, with the reasoning.
tags:
  - octoflex
  - architecture
  - openstack
  - ceph
---

# Technical decisions

These are the decisions that define the platform, with the reasoning behind
each one. They are open to revision: if your case calls for something else, we
change it and document why.

## Why OpenStack

The starting requirement is a cloud **under the client's control**, without
depending on an external provider or on licences that can change price or owner.
That rules out public cloud and proprietary virtualisation.

Among the open alternatives, OpenStack is the only one covering compute,
networking, storage and multi-tenant identity as one integrated platform, with a
stable API and a community that has sustained it for over a decade.

**What was ruled out, and why:**

| Alternative | Reason for rejection |
| --- | --- |
| Proprietary virtualisation | It is precisely the dependency many clients want to leave behind. |
| Kubernetes alone | Solves containers, not infrastructure. Many workloads are still virtual machines, and the cluster itself needs something underneath. |
| Proxmox / oVirt | Fine for virtualisation, but without the multi-tenant model or the cloud API required where several departments or clients coexist. |
| Public cloud | Does not meet the control requirement, and frequently not the sustained-cost one either. |

OpenStack has a real cost: it is harder to operate. That complexity is exactly
what the [turnkey service](servicios.md) absorbs.

## Why Kolla-Ansible

OpenStack can be deployed in many ways. Kolla-Ansible runs each service in
containers and orchestrates the installation with Ansible.

| Method | Assessment |
| --- | --- |
| **Kolla-Ansible** *(chosen)* | Containerised services, declarative and version-controllable configuration, per-service upgrades that can be rolled back, active community. |
| OpenStack-Ansible | Solid and comparable. LXC containers rather than container images; less convenient for reproducing an identical environment. |
| Commercial distribution | Brings vendor support, at the cost of the very dependency the client wanted to escape. |
| Manual installation | Unmaintainable and unreproducible. |
| DevStack | A development tool. Not for production, as its own documentation states. |

The deciding factor is **reproducibility**: with Kolla-Ansible the deployment
configuration is a git repository. That repository is handed to the client, who
can rebuild the platform without us. It is what keeps "turnkey" from meaning
"black box".

## Why Ceph

Storage is where getting it wrong costs the most.

- **One platform for three needs**: block storage for instances (Cinder),
  S3-compatible object storage (RGW) and a file system (CephFS). No need to
  integrate three separate products.
- **Native OpenStack integration**: Cinder, Glance and Nova talk to Ceph
  directly. A volume is cloned copy-on-write, without moving data.
- **No proprietary array**: it grows by adding nodes, not by buying vendor
  expansions.
- **Self-healing**: losing a disk or a node is handled by the cluster itself,
  without manual intervention.

**When it is not the answer:** a very small deployment, with few nodes, does not
justify Ceph's complexity. If the sizing points that way, we will say so and
propose local storage or an existing array instead.

## Target versions

### OpenStack 2026.1 *Gazpacho*

It is a **SLURP** release (*Skip Level Upgrade Release Process*), and that is the
main reason for the choice.

OpenStack ships two releases a year, but only SLURP ones allow jumping straight
to the next SLURP. Starting from Gazpacho means **one upgrade a year instead of
two**, moving to 2027.1 *Indri* without going through 2026.2 *Hibiscus*. On a
production platform, that difference is one maintenance window fewer per year.

| Fact | Value |
| --- | --- |
| Released | 1 April 2026 |
| Status | Maintained |
| Estimated end of maintenance | 27 October 2027 |
| Next SLURP | 2027.1 *Indri* (March 2027) |

Kolla-Ansible currently supports 2025.1, 2025.2 and 2026.1, so the combination
is covered.

### Ceph Squid (19.2.x) as a minimum

Squid is the current stable series. We set **19.2.x or later** as a floor rather
than an exact version, so we can deploy the latest maintenance point available
at installation time.

Reef (18.2.x) is ruled out for new deployments: there is no reason to start a
project on a series that is already behind.

## How these decisions change

When a decision is revised, this page is updated stating what changed and why. A
decision without a date and a reason is not a documented decision, it is an old
opinion.

!!! warning "Not yet validated"

    OctoFlex is in its design phase. These decisions are reasoned but not yet
    tested against a production deployment. This warning will be removed once
    they are.
