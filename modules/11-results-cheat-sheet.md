---
layout: page
title: "Module 11 — Results & Symptom Cheat Sheet"
---

# Module 11 — Results & Symptom Cheat Sheet

[← Hardware Escalation](10-hardware-escalation.md) | [Home](../index.md)

This page is a **triage guide**, not a component-conviction chart.

A single symptom rarely proves a specific part is bad.

---

# During a Black Screen

| Observation | What It Suggests |
|---|---|
| Discord continues and friends still hear microphone | Windows may still be alive; graphics/device path becomes more interesting |
| Caps Lock toggles but monitors are black | OS may still be responsive |
| `Win+Ctrl+Shift+B` restores video | Windows graphics/driver path becomes strongly interesting |
| Graphics-reset beep occurs but display does not return | Windows may be alive but graphics recovery failed |
| Audio loops/stutters and keyboard is frozen | Broader system lockup more likely |
| PC completely powers off | PSU/power delivery, protection event, board, or severe hardware problem becomes more interesting |
| PC reboots itself | BugCheck, watchdog, power loss, hardware fault, or driver failure possible |
| Only one monitor fails | display cable/monitor/output path becomes more relevant |
| Both monitors show No Signal simultaneously | GPU/output/driver/system failure more relevant |

---

# Controlled Tests

| Result | Next Suspicion |
|---|---|
| OCCT CPU repeatedly errors | CPU/platform/RAM/power |
| OCCT Memory errors | RAM/IMC/motherboard/settings |
| Windows Memory Diagnostic errors | memory subsystem needs isolation |
| MemTest86 errors | memory subsystem needs isolation outside Windows |
| OCCT VRAM errors | GPU VRAM/GPU stability |
| OCCT GPU alone black-screens | GPU/driver/PCIe/GPU power path |
| Individual tests pass, full streaming workload fails | interaction, total power, drivers, peripherals, real workload |
| Combined Power test causes abrupt shutdown | PSU/power path more suspicious |
| Live USB also freezes | hardware suspicion increases |
| Windows fails but live environment remains stable | Windows/driver/storage/software becomes more interesting |

---

# Event Log Clues

## WHEA-Logger

Potential hardware-level error.

Depending on details it may point toward:

- CPU/cache
- memory hierarchy
- interconnect
- PCIe device/path

The exact WHEA record matters.

---

## nvlddmkm / Display

Makes the NVIDIA graphics stack more interesting.

Possible causes can still include:

- driver
- GPU
- PCIe instability
- power delivery
- motherboard

---

## Kernel-Power 41

Usually means Windows detected an unclean previous shutdown.

It does **not** by itself prove that the PSU failed.

---

## BugCheck

Windows recorded a stop/crash condition.

Look for a minidump or MEMORY.DMP.

---

# Storage Clues

Watch for:

- stornvme/disk errors
- repeated controller resets
- Critical Warning in NVMe SMART
- Media/Data Integrity Errors
- filesystem scan problems

A storage issue can crash applications or Windows, but storage does not automatically explain every black-display symptom.

---

# Best Incident Example

```text
INCIDENT 004
September 12
10:17 PM

PC uptime: about 5 hours.

Running:
Marvel Rivals
Discord
OBS
VTube Studio
Chrome

Both monitors suddenly reported No Signal.

Discord audio continued.
Friends could still hear me.
Game audio stopped.
Caps Lock still toggled.
Win+Ctrl+Shift+B produced a beep but did not restore video.
Fans sounded normal.
PC never rebooted itself.
Forced shutdown required.

After boot:
Reliability Monitor showed Hardware Error around 10:17 PM.
Diagnostic ZIP collected.
HWiNFO CSV saved.
```

That is excellent troubleshooting data.

---

# The Goal

We are not trying to guess the failed component from one incident.

We are building a repeatable evidence chain:

```text
symptom
  ↓
timestamp
  ↓
system responsiveness
  ↓
Windows logs
  ↓
sensor history
  ↓
controlled reproduction
  ↓
one-variable hardware isolation
```
