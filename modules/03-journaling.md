---
layout: page
title: "Module 03 — Paper + Text Journaling"
---

# Module 03 — Paper + Text Journaling

[← Software Toolkit](02-software-toolkit.md) | [Home](../index.md) | [Next: Black-Screen Response →](04-black-screen-response.md)

## Goal

Keep a record that still works even when Windows does not.

Use **both**:

1. a paper notebook / printed incident sheet
2. a text journal on the PC

---

# Paper Journal

Keep it within reach of the computer.

At minimum, write:

```text
DATE:
FAILURE TIME:
WHAT I WAS DOING:
WHAT KEPT WORKING:
WHAT STOPPED WORKING:
HOW I RECOVERED:
```

The exact failure time is extremely valuable because Windows logs use timestamps.

A short real-time note such as:

> 9:37 PM — Marvel Rivals — both screens black — Discord still talking

is enough to anchor the later investigation.

Use the printable [Incident Report Template](../templates/incident-report.md) for detailed incidents.

---

# Text Journal

Create:

```text
Desktop\PC-Diagnostics\PC-Journal.txt
```

Open it in Notepad.

Add new notes to the bottom.

Example:

```text
September 9

8:15 PM
Booted normally.

8:30 PM
Discord and browser open.

8:45 PM
Started Marvel Rivals.

9:37 PM
Both monitors went black.
Discord audio continued.
Game audio stopped.
Caps Lock still toggled.
Win+Ctrl+Shift+B beeped but did not restore video.
Forced shutdown required.

9:42 PM
PC booted normally.
Collected diagnostic ZIP.
```

---

# Daily Notes Even Without a Crash

Record unusual behavior such as:

- brief monitor signal loss
- black flash that recovers
- game suddenly stuttering
- Discord disconnecting
- USB devices reconnecting
- NVIDIA notification/error
- mouse freezing briefly
- robotic audio
- unusually slow shutdown
- failure to wake from sleep
- failed POST followed by a successful boot
- missing monitor after boot
- GPU fans suddenly racing
- unexpected restart
- blue screen
- game crash without a Windows crash

These may form a pattern before a major failure.

---

# Naming Incidents

Use simple numbers:

```text
Incident 001
Incident 002
Incident 003
```

Corresponding digital folder:

```text
Desktop\PC-Diagnostics\Incidents\Incident-003
```

Put screenshots, ZIP files, and notes for that event together.

---

## Completion Checklist

- [ ] Paper journal placed near PC
- [ ] PC-Journal.txt created
- [ ] Incident template available
- [ ] I know to record the failure time first
- [ ] I know small abnormal events are worth writing down

[Next: Black-Screen Response →](04-black-screen-response.md)
