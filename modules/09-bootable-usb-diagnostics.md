---
layout: page
title: "Module 09 — Bootable USB Diagnostics"
---

# Module 09 — Bootable USB Diagnostics

[← Normal Workload Testing](08-normal-workload-testing.md) | [Home](../index.md) | [Next: Hardware Escalation →](10-hardware-escalation.md)

## Goal

Test hardware without relying on the installed Windows environment.

This section is optional and only becomes necessary if Windows-side evidence is inconclusive or hardware remains suspicious.

Remote support may prepare and ship the flash drives so they arrive ready to boot.

---

# Suggested USB Kit

```text
USB #1 — MEMORY TEST
USB #2 — LIVE DIAGNOSTICS
USB #3 — WINDOWS RECOVERY / SUPPORT
```

Each USB should be physically labeled.

Do not use these drives for ordinary storage.

---

# USB #1 — MemTest86

Official site:

https://www.memtest86.com/download.htm

MemTest86 boots independently of Windows.

It exercises:

- system RAM
- CPU memory controller
- motherboard memory path
- memory configuration stability

Modern MemTest86 releases are intended for UEFI systems.

## How to Run It

1. Save all Windows work.
2. Shut the PC down completely.
3. Insert the USB labeled **MEMORY TEST**.
4. Turn the computer on.
5. Open the motherboard's one-time boot menu.
6. Select the UEFI USB entry.
7. Start the default MemTest86 test.
8. Take a phone photo when the test begins.
9. Allow the requested number of passes to complete.
10. Photograph the final result.

For a deeper check, remote support may request an overnight/multi-pass run.

---

# If MemTest86 Reports Errors

Take a clear photo immediately.

Record:

```text
Date:
Start time:
Pass number:
Test number if shown:
Total errors:
```

Even **one reproducible memory error matters**.

Do not automatically conclude that the RAM stick itself is bad.

Errors can result from:

- DIMM
- motherboard
- CPU memory controller
- memory settings
- electrical/power instability

The next step will isolate those possibilities.

---

# USB #2 — Live Diagnostic Environment

A live Linux or diagnostic environment can answer an important question:

```text
Does the computer also become unstable
when the installed Windows system is not running?
```

If used:

1. boot the USB
2. select a **Try / Live** option
3. do **not** install over Windows
4. follow only the requested tests

### Why this helps

If:

```text
Windows repeatedly fails
but
live USB remains stable
```

software, drivers, or the Windows/storage environment becomes more interesting.

If the PC also freezes or loses video outside Windows, hardware becomes more suspicious.

---

# USB #3 — Windows Recovery / Support

This may contain:

- Windows installation/recovery media
- known-good driver packages
- diagnostic utilities
- copies of scripts
- configuration notes
- recovery files

Having a Windows installer USB does **not** mean Windows should be reinstalled immediately.

Do not erase/reinstall Windows unless explicitly instructed.

---

# Boot Menu Notes

Before shipping USBs, remote support should document:

```text
Motherboard model:
Boot-menu key:
Expected USB label:
Expected UEFI boot entry:
Secure Boot notes if any:
```

Fill in:

| Item | Value |
|---|---|
| Boot menu key | |
| USB #1 label | |
| USB #2 label | |
| USB #3 label | |
| Special instructions | |

---

# Photograph Anything Unexpected

Phone photos are encouraged for:

- MemTest86 results
- BIOS messages
- boot-device menus
- error screens
- unexpected reboot screens
- recovery messages

Make sure text and error numbers are readable.

[Next: Hardware Escalation →](10-hardware-escalation.md)
