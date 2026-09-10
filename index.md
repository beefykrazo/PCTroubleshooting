---
layout: page
title: PC Black-Screen Troubleshooting Runbook
permalink: /
---

# PC Black-Screen Troubleshooting Runbook

This guide is for diagnosing an intermittent Windows PC problem where the system may black-screen, freeze, lose video, restart, or become unstable.

The current goal is **evidence first**. Do not replace several parts at once and do not reinstall Windows simply because the problem is frustrating. We want to determine what still works during a failure, what Windows recorded, and which controlled tests reproduce the issue.

The PC is currently operating with a **Ryzen 7 5800X** installed. The **Ryzen 9 5900X is removed** and should remain out of the machine until remote support specifically asks for a hardware change.

Normal use includes games such as **Marvel Rivals, PEAK, and other multiplayer/co-op friendslop-style games**, plus Discord, OBS, VTube Studio/tracking, drawing software, browsers, and related streaming peripherals.

## Troubleshooting Levels

| Level | Meaning | Examples |
|---|---|---|
| 🟢 **Level 0 — Observe** | No stress testing or configuration changes | Journaling, noting failure time, Reliability Monitor |
| 🟢 **Level 1 — Baseline** | Safe information gathering while Windows is idle | HWiNFO, GPU-Z, CrystalDiskInfo, Event Viewer |
| 🟡 **Level 2 — Controlled Tests** | Deliberately exercises components and may reproduce the fault | Windows Memory Diagnostic, OCCT CPU/Memory/GPU |
| 🟠 **Level 3 — Bootable Tests** | Tests outside normal Windows | MemTest86, live diagnostic USB |
| 🔴 **Level 4 — Hardware Changes** | Physical component isolation | RAM stick isolation, GPU reseat, PSU/board replacement |

**Do not jump levels just because a lower-level test passes.** A passing test narrows the problem; it does not automatically prove every component is healthy.

---

# Table of Contents

## Phase A — Prepare Before the Next Failure

1. [Start Here & Safety](modules/00-start-here.md)
2. [Record the System Baseline](modules/01-system-baseline.md)
3. [Software Toolkit: What to Install and Why](modules/02-software-toolkit.md)
4. [Set Up the Paper + Text Journals](modules/03-journaling.md)

## Phase B — Catch the Failure

5. [What to Do During a Black Screen](modules/04-black-screen-response.md)
6. [Collect Windows Evidence After Reboot](modules/05-windows-evidence.md)

## Phase C — Test the PC While It Is Working

7. [Windows-Side Idle Diagnostics](modules/06-idle-windows-diagnostics.md)
8. [Controlled Stress Testing](modules/07-controlled-stress-testing.md)
9. [Normal Workload Reproduction](modules/08-normal-workload-testing.md)

## Phase D — Escalate Only If Needed

10. [Bootable USB Diagnostics](modules/09-bootable-usb-diagnostics.md)
11. [Hardware Escalation](modules/10-hardware-escalation.md)
12. [Results & Symptom Cheat Sheet](modules/11-results-cheat-sheet.md)

## Printable / Copy-Paste Resources

- [Incident Report Template](templates/incident-report.md)
- [Daily Journal Template](templates/daily-journal.md)
- [`Collect-BlackScreen-Diagnostics.ps1`](scripts/Collect-BlackScreen-Diagnostics.ps1)
- [`Collect-System-Baseline.ps1`](scripts/Collect-System-Baseline.ps1)

---

# The Core Rule

Every useful incident should give us:

```text
WHAT WAS RUNNING
        +
APPROXIMATE OR EXACT FAILURE TIME
        +
WHAT STILL WORKED
        +
WHAT STOPPED WORKING
        +
HOW THE MACHINE RECOVERED
        +
WINDOWS LOGS
        +
SENSOR LOGS
```

"PC crashed again" confirms that the problem still exists.

"10:17 PM, Marvel Rivals + Discord + OBS, both monitors lost signal, Discord continued, friends could still hear me, Caps Lock worked, graphics reset beeped but did not restore video, forced power-off required" is diagnostic evidence.

---

## Current Rule

For now:

> **Use the computer normally, record abnormal behavior, and collect evidence before changing hardware or reinstalling software.**
