---
layout: page
title: "Module 07 — Controlled Stress Testing"
---

# Module 07 — Controlled Stress Testing

[← Idle Diagnostics](06-idle-windows-diagnostics.md) | [Home](../index.md) | [Next: Normal Workload Testing →](08-normal-workload-testing.md)

## Goal

Deliberately exercise one subsystem at a time so a failure tells us something useful.

## Before Every Stress Test

1. Save all work.
2. Close unrelated applications.
3. Start HWiNFO sensor logging.
4. Write the test start time in the journal.
5. Do not leave an unfamiliar stress test unattended.
6. Stop if temperatures or behavior become obviously abnormal.
7. Record whether the test **passed, reported errors, black-screened, froze, rebooted, or powered off**.

Do not change BIOS tuning between tests.

---

# Suggested Test Order

```text
CPU
 ↓
Memory
 ↓
GPU VRAM
 ↓
GPU 3D
 ↓
Normal workload combinations
 ↓
Combined Power test ONLY if directed
```

If a test fails, stop and report it rather than immediately continuing through every remaining test.

---

# Test A — OCCT CPU

Purpose:

- CPU cores
- cache
- CPU power/thermal behavior
- general CPU stability

Suggested initial run:

- OCCT CPU test
- default/sensible settings
- approximately 15–30 minutes for the first pass

Record:

```text
Start:
End:
OCCT errors:
Maximum CPU temperature:
Black screen?:
Freeze?:
Restart?:
Other:
```

A short pass does not prove the CPU is perfect. It is the first controlled checkpoint.

---

# Test B — OCCT Memory

Purpose:

- system RAM
- CPU memory controller
- motherboard memory path
- memory stability under Windows

Suggested initial run:

- 30–60 minutes
- leave enough memory free for Windows

Record any OCCT error immediately.

If errors occur, do not start changing RAM voltage or timings without direction.

---

# Test C — OCCT VRAM

Purpose:

- exercise RTX 4070 Super video memory
- detect some classes of VRAM instability

Suggested initial run:

- 20–30 minutes

Record:

- errors
- GPU temperature
- GPU hotspot
- black-screen behavior
- driver resets

---

# Test D — OCCT GPU / 3D

Purpose:

- exercise GPU core
- load PCIe/GPU driver path
- reproduce graphics-specific failures

Suggested initial run:

- 20–30 minutes

Watch HWiNFO and OCCT for errors.

If the display disappears but Discord/audio remain alive, use the same black-screen checklist from Module 04 before forcing the machine off.

---

# Test E — Longer CPU Confirmation

Only if requested.

Possible tools:

- longer OCCT CPU run
- Prime95
- other directed CPU validation

Prime95 can produce an unusually heavy CPU/FPU workload and should not be treated as a casual benchmark.

---

# Test F — OCCT Power / Combined CPU + GPU

## ⚠️ Engineer-Directed Test

Do **not** run this casually.

OCCT's Power-style workload intentionally stresses CPU and GPU at the same time. That can be useful when investigating:

- PSU instability
- motherboard power delivery
- transient/load failures
- failures that only happen when the whole system is busy

It may also reproduce an abrupt shutdown very quickly if the power path is unstable.

Before running:

- remote support should specifically request it
- HWiNFO logging should be active
- all work should be saved
- the system should be physically observed

If the system powers off, do not repeatedly rerun the test over and over.

---

# Stress-Test Result Matrix

| Test | Pass | Software Error | Black Screen | Freeze | Restart/Power Loss |
|---|---:|---:|---:|---:|---:|
| OCCT CPU | ☐ | ☐ | ☐ | ☐ | ☐ |
| OCCT Memory | ☐ | ☐ | ☐ | ☐ | ☐ |
| OCCT VRAM | ☐ | ☐ | ☐ | ☐ | ☐ |
| OCCT GPU/3D | ☐ | ☐ | ☐ | ☐ | ☐ |
| Longer CPU test | ☐ | ☐ | ☐ | ☐ | ☐ |
| OCCT Power | ☐ | ☐ | ☐ | ☐ | ☐ |

---

# Interpretation Examples

### CPU fails, GPU tests pass

CPU/platform/RAM/power path becomes more interesting.

### Memory test reports reproducible errors

RAM, memory controller, motherboard, or memory settings become more interesting.

### GPU/VRAM test alone causes black screens

GPU, NVIDIA driver, PCIe path, power to GPU, or motherboard slot/path becomes more interesting.

### Every individual test passes but full workload crashes

The interaction between components, total power load, device drivers, peripherals, or real-world workload becomes more important.

### Combined Power test causes instant power loss

PSU/power delivery becomes more suspicious, but this is not by itself absolute proof of a bad PSU.

[Next: Normal Workload Testing →](08-normal-workload-testing.md)
