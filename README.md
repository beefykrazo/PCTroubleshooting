PC Black-Screen Troubleshooting Runbook

A modular troubleshooting guide for documenting and diagnosing an intermittent black-screen / instability issue on a Windows gaming and streaming PC.

The guide is designed for two people working remotely:

PC user: performs clearly documented checks and records what happens.

Remote support: reviews logs, decides which test comes next, and interprets results.

Start with index.md.

Repository Layout

.
├── index.md
├── modules/
│   ├── 00-start-here.md
│   ├── 01-system-baseline.md
│   ├── 02-software-toolkit.md
│   ├── 03-journaling.md
│   ├── 04-black-screen-response.md
│   ├── 05-windows-evidence.md
│   ├── 06-idle-windows-diagnostics.md
│   ├── 07-controlled-stress-testing.md
│   ├── 08-normal-workload-testing.md
│   ├── 09-bootable-usb-diagnostics.md
│   ├── 10-hardware-escalation.md
│   └── 11-results-cheat-sheet.md
├── templates/
│   ├── incident-report.md
│   └── daily-journal.md
└── scripts/
    ├── Collect-BlackScreen-Diagnostics.ps1
    └── Collect-System-Baseline.ps1


