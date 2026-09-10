---
layout: page
title: "Module 08 — Normal Workload Reproduction"
---

# Module 08 — Normal Workload Reproduction

[← Controlled Stress Tests](07-controlled-stress-testing.md) | [Home](../index.md) | [Next: Bootable USB Diagnostics →](09-bootable-usb-diagnostics.md)

## Goal

Determine whether the problem depends on a particular combination of real applications.

Synthetic stress tests are useful, but the most important workload is the one the PC actually has to run.

Keep HWiNFO logging enabled when practical.

---

# Workload Ladder

Run these as separate sessions when directed.

## A — Idle

```text
Windows desktop only
```

No game, OBS, or VTube Studio.

Question:

**Can the PC fail while doing almost nothing?**

---

## B — Normal Desktop

```text
Discord
+
browser/video
+
normal desktop applications
```

No game.

---

## C — Game Only

Use a game that is normally played, such as:

- Marvel Rivals
- PEAK
- another frequently played co-op/multiplayer game

Do not run OBS or VTube Studio for this specific test.

---

## D — Game + Discord

```text
Game
+
Discord voice
```

This is useful because friends may also tell us whether the PC remains connected during a black screen.

---

## E — Game + OBS

```text
Game
+
OBS local recording
```

Local recording is enough for the first test unless live streaming itself is suspected.

Record:

- encoding mode
- whether NVENC is being used
- approximate resolution/frame rate if known

---

## F — Game + VTube Studio / Tracking

```text
Game
+
VTube Studio
+
tracking input
```

---

## G — Full Normal Streaming Workload

Eventually reproduce the real use case:

```text
Marvel Rivals / PEAK / another normal game
+
Discord
+
OBS
+
VTube Studio / tracking
+
normal audio chain
+
capture devices
+
browser/chat
```

This is often more diagnostically valuable than running a benchmark for hours.

---

# Journal Each Workload

Use a simple table:

| Start | Workload | HWiNFO Log | Result | Failure Time |
|---|---|---|---|---|
| | Idle | | | |
| | Desktop | | | |
| | Game only | | | |
| | Game + Discord | | | |
| | Game + OBS | | | |
| | Game + VTube | | | |
| | Full workload | | | |

---

# Things to Notice Before Failure

Write down if the failure immediately follows:

- loading a game/map
- alt-tabbing
- starting/stopping OBS
- switching OBS scenes
- beginning local recording
- starting VTube Studio
- plugging/unplugging tablet or capture hardware
- monitor waking from sleep
- browser video playback
- Discord screen share
- a game resolution/fullscreen change
- PC sitting idle for a long period

A repeated trigger is extremely valuable.

---

# Success Does Not Mean "Problem Solved"

Example:

> Marvel Rivals ran for three hours today without crashing.

Good evidence.

It does **not** prove the machine is fixed if it has been intermittent for months.

Journal successful sessions too. They help establish frequency.

[Next: Bootable USB Diagnostics →](09-bootable-usb-diagnostics.md)
