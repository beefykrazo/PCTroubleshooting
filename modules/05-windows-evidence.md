---
layout: page
title: "Module 05 — Collect Windows Evidence"
---

# Module 05 — Collect Windows Evidence After Reboot

[← Black-Screen Response](04-black-screen-response.md) | [Home](../index.md) | [Next: Idle Diagnostics →](06-idle-windows-diagnostics.md)

## Goal

Capture logs before troubleshooting actions change the environment.

Write down:

```text
Failure time: __________
Reboot time: __________
Incident #: __________
```

---

# 1. Reliability Monitor

Press:

```text
Windows + R
```

Run:

```text
perfmon /rel
```

Find the failure date/time.

Look for:

- Hardware error
- Windows failure
- application failure
- unexpected shutdown
- NVIDIA-related entry

Take screenshots around the failure time.

Do not try to interpret every red X yourself.

---

# 2. Run the Black-Screen Collection Script

Use:

[`Collect-BlackScreen-Diagnostics.ps1`](../scripts/Collect-BlackScreen-Diagnostics.ps1)

Run PowerShell as Administrator and execute the script.

It creates an incident folder and ZIP containing:

- System.evtx
- Application.evtx
- recent System events
- WHEA-related events
- NVIDIA / Display events
- Kernel-Power / BugCheck events
- Windows Reliability records
- MSInfo32
- DxDiag
- Minidumps when present
- LiveKernelReports when present
- information about MEMORY.DMP when present

Send the ZIP together with the paper/text journal notes.

---

# 3. Event Viewer — What We Care About

Press:

```text
Windows + R
```

Run:

```text
eventvwr.msc
```

Go to:

**Windows Logs → System**

Events of interest near the failure time may include:

- **WHEA-Logger**
- **nvlddmkm**
- **Display**
- **BugCheck**
- **Kernel-Power**
- **EventLog**
- PCI Express / hardware errors

The timestamp matters more than the color of the icon.

---

# Important: Kernel-Power Event ID 41

You may see **Kernel-Power 41** after a forced shutdown.

It generally tells us:

> Windows detected that the previous shutdown was not clean.

If you had to hold the power button because the machine froze, Event 41 is expected.

It does **not** automatically mean the power supply caused the failure.

We still record it because it helps establish the incident timeline.

---

# 4. Look for LiveKernelReports

The collection script checks:

```text
C:\Windows\LiveKernelReports
```

These can be especially useful when Windows remained partially alive during a GPU or kernel-level hang.

Do not delete these files before they are collected.

---

# 5. Look for Crash Dumps

The script checks:

```text
C:\Windows\Minidump
C:\Windows\MEMORY.DMP
```

A dump may exist even if the screen disappeared before you saw a normal blue-screen message.

---

# 6. Preserve Evidence Before "Fixing"

Before logs are collected, avoid:

- DDU
- driver reinstall
- Windows reinstall
- BIOS reset
- BIOS flash
- deleting dump files
- PC cleanup software
- registry cleaners
- swapping multiple components

Those may become legitimate later steps. First preserve what the machine recorded.

---

## Incident Package Checklist

For each major failure, try to have:

```text
Incident-###/
├── paper journal notes/photo
├── text journal entry
├── Reliability Monitor screenshot
├── BlackScreen-*.zip
└── HWiNFO CSV log if one was running
```

[Next: Idle Diagnostics →](06-idle-windows-diagnostics.md)
