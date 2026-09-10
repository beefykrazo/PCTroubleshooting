---
layout: page
title: "Module 10 — Hardware Escalation"
---

# Module 10 — Hardware Escalation

[← Bootable USB Diagnostics](09-bootable-usb-diagnostics.md) | [Home](../index.md) | [Next: Results Cheat Sheet →](11-results-cheat-sheet.md)

## Goal

Change hardware only after the evidence suggests which variable should be isolated.

The current machine remains on the Ryzen 7 5800X unless instructed otherwise.

The removed Ryzen 9 5900X can be tested separately on another known-good AM4 platform without taking the current PC away from its user.

---

# One Change at a Time

Good diagnostic change:

```text
Known current configuration
        ↓
change ONE RAM condition
        ↓
retest
```

Bad diagnostic change:

```text
new GPU
+ different RAM
+ BIOS update
+ new driver
+ PSU cable changes
+ Windows reinstall
```

If the problem disappears after six simultaneous changes, we still do not know what was wrong.

---

# Possible Future Isolation Steps

These are examples, **not instructions to perform them now**.

## RAM Isolation

Possible sequence:

1. disable memory overclock/XMP if directed
2. test at default settings
3. test one DIMM
4. test the other DIMM
5. test specific slots

Used when memory testing reports errors or WHEA evidence points toward memory/platform instability.

---

## GPU / Display Isolation

Possible sequence:

- reseat GPU
- verify GPU power connectors
- remove extension/adaptor variables where practical
- test another PCIe slot only if electrically appropriate
- test known-good display cable
- test one monitor
- clean-install driver only after logs are preserved
- test known-good GPU if necessary

---

## PSU / Power Isolation

A suspect PSU should not be opened.

Possible isolation:

- use a known-good quality PSU
- use only that PSU's own modular cables
- remove cable extensions during diagnosis
- retest controlled workloads

**Never mix modular PSU-side cables from different PSU models unless the manufacturer explicitly specifies compatibility.**

---

## Motherboard Isolation

If CPU, RAM, GPU, and PSU are validated elsewhere but the original machine remains unstable, the motherboard becomes increasingly suspicious.

Evidence may include:

- repeated POST failures
- PCIe-related WHEA events
- memory-channel behavior
- intermittent device loss
- instability with multiple known-good CPUs
- otherwise unexplained black screens

---

# CPU Isolation

The Ryzen 9 5900X can be tested in a separate known-good AM4 machine.

A good CPU validation should include more than one high-load benchmark:

```text
Known-good board / PSU / RAM
          ↓
Stock BIOS settings
          ↓
Memory test
          ↓
CPU stress
          ↓
per-core / mixed CPU tests
          ↓
idle period
          ↓
reboot cycles
          ↓
sleep / resume if useful
```

A CPU that survives load and idle-transition testing with zero WHEA errors on a known-good platform becomes much less suspicious.

---

# When to Stop Using the Current PC

Stop normal operation and escalate if the symptom changes into:

- repeated failure to POST
- several failures per day
- spontaneous complete power-offs
- repeated reboot loops
- storage/filesystem corruption
- electrical smell
- PSU clicking
- graphical corruption in BIOS/POST
- Windows no longer boots reliably
- the machine begins failing under very light use

A changing failure pattern is evidence too.

[Next: Results Cheat Sheet →](11-results-cheat-sheet.md)
