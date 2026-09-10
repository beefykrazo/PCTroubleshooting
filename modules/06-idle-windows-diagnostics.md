---
layout: page
title: "Module 06 — Windows-Side Idle Diagnostics"
---

# Module 06 — Windows-Side Idle Diagnostics

[← Windows Evidence](05-windows-evidence.md) | [Home](../index.md) | [Next: Controlled Stress Tests →](07-controlled-stress-testing.md)

## Goal

Collect health information while the computer is currently working, before deliberately stressing it.

These tests are arranged from least invasive to more involved.

---

# Test 1 — HWiNFO Baseline

Launch:

**HWiNFO → Sensors-only**

Let the PC sit at the Windows desktop for several minutes with no game running.

Record or screenshot:

- CPU temperature
- CPU package power
- CPU effective clocks
- GPU temperature
- GPU hotspot
- GPU power
- GPU clock
- system RAM use
- GPU VRAM use
- WHEA counters if shown

Save screenshots under:

```text
Desktop\PC-Diagnostics\Baseline
```

### Start a CSV Sensor Log

In the Sensors window, enable logging.

Save to:

```text
Desktop\PC-Diagnostics\HWiNFO\YYYY-MM-DD-HWiNFO.csv
```

Leave this running during later controlled tests when practical.

---

# Test 2 — CrystalDiskInfo

Open CrystalDiskInfo.

For each internal SSD/NVMe:

1. select the drive
2. take a screenshot
3. record the displayed Health Status
4. record temperature

Do not run a disk benchmark yet.

We want health information first.

Pay special attention if the application reports:

- Caution
- Bad
- Critical Warning
- Media/Data Integrity Errors
- abnormal temperature

Send screenshots rather than guessing at the meaning.

---

# Test 3 — GPU-Z Baseline

Open GPU-Z.

Take screenshots of:

- Graphics Card tab
- Sensors tab while idle

Record:

- NVIDIA driver version
- Bus Interface
- exact GPU identification

If remote support asks, GPU-Z can also be used to check whether the PCIe link changes correctly under load.

---

# Test 4 — Windows System File Verification

Open **Terminal / PowerShell as Administrator**.

Run:

```cmd
sfc /verifyonly
```

This verifies protected Windows system files without requesting repairs.

Save the result in the journal.

Possible outcomes:

```text
[ ] No integrity violations
[ ] Problems reported
[ ] Command failed
```

Do not automatically run repair commands unless directed.

---

# Test 5 — Windows Component Store Scan

Administrator Terminal:

```cmd
DISM /Online /Cleanup-Image /ScanHealth
```

This checks the Windows component store.

Record the final result.

Do not jump directly to `/RestoreHealth` unless requested.

---

# Test 6 — Online Filesystem Scan

Administrator Terminal:

```cmd
chkdsk C: /scan
```

This performs an online scan rather than immediately scheduling an offline repair.

Record the result.

If Windows says repairs are required, send the exact message to remote support before scheduling a repair.

---

# Test 7 — Reliability History Review

Run:

```text
perfmon /rel
```

Look back over the previous several weeks if history is available.

We are looking for patterns such as:

- recurring Hardware Error entries
- repeated Windows failures
- repeating game crashes
- NVIDIA failures
- dates where instability became more frequent

Take screenshots rather than trying to summarize a large history from memory.

---

# Test 8 — Event Viewer Review

Run:

```text
eventvwr.msc
```

Check **Windows Logs → System**.

Do not count all red/yellow events.

Instead look for repeated providers such as:

- WHEA-Logger
- nvlddmkm
- Display
- disk / stornvme
- BugCheck

Remote support can examine the exported logs in detail.

---

# Test 9 — Windows Memory Diagnostic

This test requires a reboot but does not require a USB drive.

Save all work first.

Press:

```text
Windows + R
```

Run:

```text
mdsched
```

Choose:

**Restart now and check for problems**

Windows Memory Diagnostic normally begins with its Standard test.

If instructed to perform the longer test:

1. press **F1** while the memory diagnostic is running
2. select **Extended**
3. press **F10** to apply

After Windows boots again, record the reported result.

If the notification disappears or is missed, the result can be retrieved from Event Viewer.

### Important

A clean Windows Memory Diagnostic is useful but does **not** replace a longer bootable MemTest86 run if memory remains suspicious.

---

# Baseline Results Table

Fill this in:

| Test | Result | Notes |
|---|---|---|
| HWiNFO idle | ☐ Pass ☐ Concern | |
| CrystalDiskInfo | ☐ Pass ☐ Concern | |
| GPU-Z baseline | ☐ Saved | |
| `sfc /verifyonly` | ☐ Clean ☐ Issue | |
| DISM ScanHealth | ☐ Clean ☐ Issue | |
| `chkdsk C: /scan` | ☐ Clean ☐ Issue | |
| Reliability review | ☐ Saved | |
| Event logs | ☐ Saved | |
| Windows Memory Diagnostic | ☐ Pass ☐ Errors | |

---

# Stop and Report If

Stop testing and send results if:

- Windows Memory Diagnostic reports errors
- CrystalDiskInfo reports a critical storage condition
- WHEA errors start rapidly increasing
- the system black-screens during these light tests
- the system unexpectedly powers off

Otherwise proceed only when directed to:

[Module 07 — Controlled Stress Testing](07-controlled-stress-testing.md)
