---
layout: page
title: "Module 04 — What to Do During a Black Screen"
---

# Module 04 — What to Do During a Black Screen

[← Journaling](03-journaling.md) | [Home](../index.md) | [Next: Windows Evidence →](05-windows-evidence.md)

## Goal

Determine whether **video failed** or the **entire computer failed**.

Do not immediately hold the power button unless there is an electrical safety issue.

---

# Step 1 — Write Down the Time

Use the paper journal.

```text
FAILURE TIME: __________________
```

Approximate to the nearest minute if necessary.

---

# Step 2 — Listen

Can you still hear:

- Discord voices?
- game audio?
- music/video?
- Windows notification sounds?
- looping/stuttering audio?

Record exactly what happened.

---

# Step 3 — Ask Friends What They See

If you are in Discord:

- Can they still hear your microphone?
- Do you remain connected?
- Do you disconnect after several seconds?
- Did screen sharing continue?

Record the answer afterward.

If friends can still hear you while both monitors are black, Windows may still be running.

---

# Step 4 — Test Caps Lock / Num Lock

Press Caps Lock several times.

If the keyboard has an indicator:

```text
[ ] Light still toggles normally
[ ] Light is frozen
[ ] Keyboard has no indicator
[ ] Unsure
```

This is not perfect proof, but it is a useful clue about whether Windows is still responsive.

---

# Step 5 — Request a Windows Graphics Reset

Press together:

```text
Windows + Ctrl + Shift + B
```

Possible outcomes:

```text
[ ] Picture returned
[ ] Heard a beep / screen flickered, but picture stayed black
[ ] Nothing happened
[ ] Unsure
```

Try it once or twice.

Do not repeatedly mash the shortcut.

---

# Step 6 — Try Ctrl + Alt + Delete

Press:

```text
Ctrl + Alt + Delete
```

Record:

```text
[ ] Security screen appeared
[ ] Screen flickered/changed
[ ] Nothing happened
[ ] Unsure
```

---

# Step 7 — Observe the Monitors

Look for:

```text
[ ] "No Signal"
[ ] Black picture but monitor still thinks it has a signal
[ ] Frozen final image
[ ] One monitor failed, one remained working
[ ] Both failed
[ ] Monitor repeatedly connects/disconnects
```

---

# Step 8 — Observe the PC Without Opening It

Record:

```text
[ ] Fans sound normal
[ ] Fans suddenly became very loud
[ ] Fans stopped
[ ] RGB reset
[ ] USB devices appeared to reconnect
[ ] PC restarted itself
[ ] PC stayed powered on
[ ] PC completely powered off
```

---

# Step 9 — Recovery

If the picture returns by itself, record that.

If not:

1. Press the normal power button once.
2. Give Windows a chance to perform a normal shutdown.
3. If the machine is completely frozen and will not respond, hold the power button until it switches off.

Record:

```text
[ ] Recovered by itself
[ ] Graphics reset recovered it
[ ] Ctrl+Alt+Delete recovered it
[ ] Normal power-button shutdown worked
[ ] Forced power-off required
[ ] PC restarted itself
```

---

# Why These Questions Matter

### Black screens + Discord keeps working

More suspicious of:

- GPU
- NVIDIA driver
- PCIe/device path
- display output
- Windows graphics stack

### Everything freezes simultaneously

More suspicious of a system-level problem involving:

- motherboard
- PSU/power delivery
- RAM
- CPU
- severe driver/kernel failure

These are clues, not final diagnoses.

---

# Immediately After Reboot

Do not immediately launch the game again.

Go to:

[Module 05 — Collect Windows Evidence](05-windows-evidence.md)

and collect the incident evidence first.
