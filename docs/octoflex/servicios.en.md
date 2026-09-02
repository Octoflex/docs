---
title: Services
description: Turnkey private cloud on OpenStack and Ceph, plus independent cloud advisory. What each service covers and what gets delivered.
tags:
  - octoflex
  - services
---

# Services

Two services, available together or separately.

## Turnkey private cloud

We design, deploy and commission a private cloud built on OpenStack and Ceph.
Scope, by phase:

### 1. Assessment and sizing

We start from your real workloads, not from a catalogue of sizes.

- Inventory of what exists today: machines, CPU and memory usage, storage in use
  and its growth, I/O patterns.
- Requirements that constrain the design: data retention, maintenance windows,
  recovery objectives, regulatory obligations.
- Sizing of compute, storage and networking, with the agreed headroom for
  growth.

**Delivered:** architecture document with the concrete design, bill of materials
for the required hardware, and a milestone-based deployment plan.

### 2. Deployment

- Node preparation and physical networking.
- OpenStack with Kolla-Ansible; Ceph with cephadm.
- Integration with what you already run: identity directory, monitoring,
  backups, ticketing.
- Configuration version-controlled in a git repository from day one.

**Delivered:** the deployed environment and the configuration repository, so the
deployment is reproducible without us.

### 3. Service enablement

A freshly installed cloud is not yet useful. This phase makes it so:

- Projects, users, roles and quotas.
- Networks, addressing and internet egress.
- Image catalogue and flavors matched to your workloads.
- Backup policy and a restore test — actually executed, not just described.
- Acceptance tests agreed with you before the environment is signed off.

**Delivered:** environment in production and the acceptance test report.

### 4. Handover and training

- Hands-on training for the team that will operate the platform.
- Documentation of *your* installation: real topology, decisions taken,
  operating procedures.
- Support during the first weeks of operation.

**Delivered:** operations documentation and a team able to work independently.

### After handover

Ongoing operation is optional and defined with you. It can range from on-demand
support to full managed operation. What we do not do is make the handover
conditional on hiring us afterwards: the platform is yours, built on open source
software with open configuration.

## Cloud advisory

Consulting work that does not require deploying anything:

<div class="grid cards" markdown>

- :material-compare-horizontal:{ .lg .middle } **Evaluating the alternatives**

    ---

    Public, private or hybrid cloud, with the numbers on the table. Includes the
    cost of operating, not only the cost of buying.

- :material-swap-horizontal-bold:{ .lg .middle } **Leaving proprietary platforms**

    ---

    Feasibility analysis and migration plan away from proprietary
    virtualisation, with the real dependencies identified before starting.

- :material-magnify-scan:{ .lg .middle } **Reviewing an existing OpenStack**

    ---

    Audit of a running installation: architecture, configuration, capacity,
    backup and upgradability. Report with prioritised findings.

- :material-cash-multiple:{ .lg .middle } **Cost optimisation**

    ---

    Review of consumption and sizing. Sometimes the conclusion is that you do
    not need a private cloud; we will say so too.

</div>

!!! note "Scope and terms"

    Every project is scoped case by case. Timelines, detailed scope and service
    terms are agreed in writing before work starts. Get in touch from
    [About](../about.md) and let's talk.
