---
layout: page
title: "Module 02 — Software Toolkit"
---

# Module 02 — Software Toolkit

[← System Baseline](01-system-baseline.md) | [Home](../index.md) | [Next: Journaling →](03-journaling.md)

## Goal

Install only the tools that help us observe or test a specific subsystem.

Do not install five different "PC optimizer" or driver-cleaning utilities.

---

# Recommended Toolkit

| Tool | Install? | What It Does | Used For |
|---|---:|---|---|
| **HWiNFO64** | Yes | Hardware sensors and CSV logging | Temps, clocks, power, WHEA counters, pre-crash timeline |
| **OCCT** | Yes | Controlled CPU/RAM/GPU/system stress tests with error detection | Reproducing instability by subsystem |
| **CrystalDiskInfo** | Yes | Reads SSD/NVMe/HDD SMART health data | Storage health baseline |
| **GPU-Z** | Yes | Detailed GPU identification and PCIe/driver information | RTX 4070 Super baseline, PCIe link checks |
| **Windows Reliability Monitor** | Built in | Timeline of crashes and hardware/application failures | Incident correlation |
| **Windows Event Viewer** | Built in | Native Windows logs | WHEA, Display, NVIDIA, BugCheck, Kernel-Power |
| **Windows Memory Diagnostic** | Built in | Reboot-based Windows RAM test | Initial memory testing |
| **MemTest86** | USB later | Boots outside Windows and tests memory | Deeper RAM / memory-controller testing |
| **WinDbg** | Support-side / optional | Analyzes crash dumps | Minidump and kernel dump analysis |
| **Prime95** | Optional / directed | Heavy CPU/FPU and memory stress | Secondary CPU stability confirmation |

---

# 1. HWiNFO64 — Install

Official site:

https://www.hwinfo.com/download/

Install the current stable 64-bit Windows build.

### Why we use it

HWiNFO can watch:

- CPU temperature
- CPU clocks
- CPU package power
- GPU temperature
- GPU hotspot
- GPU power
- GPU clocks
- VRAM usage
- system RAM use
- motherboard sensors
- WHEA hardware-error counters when exposed

Most importantly, it can save those values to a CSV file while the PC is being used.

### Normal launch mode

Use:

**Sensors-only**

Do not change hardware settings through HWiNFO.

---

# 2. OCCT — Install

Official site:

https://occt.app/download.html

Use the current **stable** Windows release rather than a beta unless specifically instructed.

### Why we use it

OCCT lets us test components separately:

- CPU
- CPU + memory
- memory
- GPU 3D
- GPU VRAM
- combined power/load

This matters because:

```text
CPU test passes
Memory test passes
GPU test fails
```

is much more informative than simply knowing that a game crashed.

### Important

Do **not** start OCCT's combined **Power** test unless remote support specifically requests it.

That test intentionally loads CPU and GPU together and is more aggressive toward the PSU/power-delivery path.

---

# 3. CrystalDiskInfo — Install

Official project/download site:

https://crystalmark.info/en/download/

Install **CrystalDiskInfo Standard Edition**.

### Why we use it

It reads storage SMART/health information, including NVMe health data.

We care about:

- Health Status
- Temperature
- Critical Warning
- Media/Data Integrity Errors
- Available Spare
- Percentage Used
- unsafe shutdown counts
- obvious controller/device warnings

Do not panic because a drive has accumulated normal lifetime usage values. Save screenshots so remote support can interpret them.

---

# 4. GPU-Z — Install or Use Portable

Official site:

https://www.techpowerup.com/download/techpowerup-gpu-z/

### Why we use it

GPU-Z is a small GPU information utility.

We may use it to record:

- exact RTX 4070 Super model information
- NVIDIA driver version
- VBIOS
- bus interface
- PCIe link behavior
- sensor information

HWiNFO remains the main long-term sensor logger.

---

# 5. Built-In Windows Tools

No download is required for:

### Reliability Monitor

Run:

```text
perfmon /rel
```

### Event Viewer

Run:

```text
eventvwr.msc
```

### Windows Memory Diagnostic

Run:

```text
mdsched
```

### System Information

Run:

```text
msinfo32
```

### DirectX Diagnostic Tool

Run:

```text
dxdiag
```

---

# 6. Optional Support Tools

These are **not required for day-one troubleshooting**.

## WinDbg

Used to analyze Windows crash dumps.

Install command:

```powershell
winget install Microsoft.WinDbg
```

This is primarily useful for remote support rather than routine user operation.

## Prime95

Official site:

https://www.mersenne.org/download/

Useful as a secondary CPU/FPU/memory-controller stress test if OCCT results are inconclusive.

Do not run Prime95 torture tests unless instructed.

---

# Software We Are NOT Installing Just Yet

Avoid adding unnecessary variables such as:

- registry cleaners
- generic "driver updater" programs
- automatic overclocking utilities
- motherboard tuning suites unless needed
- multiple hardware-monitoring programs running simultaneously
- DDU unless specifically directed
- random benchmark packs from download mirrors

Use official vendor/project download pages wherever possible.

---

## Completion Checklist

- [ ] HWiNFO installed
- [ ] OCCT installed
- [ ] CrystalDiskInfo installed
- [ ] GPU-Z available
- [ ] I know Reliability Monitor is built into Windows
- [ ] I know Event Viewer is built into Windows
- [ ] I know Windows Memory Diagnostic is built into Windows
- [ ] I will not run OCCT Power or Prime95 unless directed

[Next: Journaling →](03-journaling.md)
