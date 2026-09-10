---
layout: page
title: "Module 01 — Record the System Baseline"
---

# Module 01 — Record the System Baseline

[← Start Here](00-start-here.md) | [Home](../index.md) | [Next: Software Toolkit →](02-software-toolkit.md)

## Goal

Create a snapshot of the PC while it is working. If something later changes, we have a reference.

Create:

```text
Desktop
└── PC-Diagnostics
    ├── Baseline
    ├── Incidents
    ├── HWiNFO
    └── Screenshots
```

The included [`Collect-System-Baseline.ps1`](../scripts/Collect-System-Baseline.ps1) can collect much of this automatically.

---

# A. Write Down the Hardware

Record what is known:

| Item | Current Value |
|---|---|
| CPU | AMD Ryzen 7 5800X |
| Removed CPU | AMD Ryzen 9 5900X |
| GPU | NVIDIA GeForce RTX 4070 Super 12GB |
| RAM | 64GB DDR4 |
| Motherboard | ______________________________ |
| PSU | ______________________________ |
| Windows edition | ______________________________ |
| Windows version/build | ______________________________ |
| Main NVMe model | ______________________________ |
| Monitor 1 | ______________________________ |
| Monitor 2 | ______________________________ |
| Capture device(s) | ______________________________ |
| Drawing tablet | ______________________________ |
| Webcam/tracking device | ______________________________ |

Do not open the PSU or remove hardware just to fill this table in. Unknown entries can stay unknown.

---

# B. Record the Windows Version

Press:

`Windows + R`

Type:

```text
winver
```

Take a screenshot and save it to:

```text
Desktop\PC-Diagnostics\Baseline
```

---

# C. Save System Information

Press:

`Windows + R`

Type:

```text
msinfo32
```

Choose:

**File → Save**

Save as:

```text
Desktop\PC-Diagnostics\Baseline\MSInfo32.nfo
```

---

# D. Save DirectX / Display Information

Press:

`Windows + R`

Type:

```text
dxdiag
```

Choose:

**Save All Information**

Save as:

```text
Desktop\PC-Diagnostics\Baseline\DxDiag.txt
```

---

# E. Device Manager Snapshot

Right-click Start → **Device Manager**.

Look for devices with:

- yellow warning triangle
- unknown device
- disabled-device arrow
- obvious error status

Take screenshots if anything looks unusual.

Do **not** uninstall devices during this baseline step.

---

# F. Reliability Monitor Baseline

Press:

`Windows + R`

Type:

```text
perfmon /rel
```

Take screenshots showing the most recent several days.

Save them under:

```text
Desktop\PC-Diagnostics\Baseline
```

This gives us a history from before the next incident.

---

# G. Event Viewer Baseline

Press:

`Windows + R`

Type:

```text
eventvwr.msc
```

Navigate to:

**Windows Logs → System**

Do not try to fix every warning or error.

Windows regularly logs harmless warnings. The important part is whether specific events line up with the black-screen time.

---

## Completion Checklist

- [ ] PC-Diagnostics folders created
- [ ] Hardware list recorded
- [ ] Winver screenshot saved
- [ ] MSInfo32 saved
- [ ] DxDiag saved
- [ ] Device Manager checked
- [ ] Reliability Monitor screenshots saved
- [ ] Baseline script run if requested

[Next: Software Toolkit →](02-software-toolkit.md)
