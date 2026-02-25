# CodeShield 🛡️

> **One-liner:** A lightweight, multi-threaded C engine that ingests system logs, scores threat patterns using sliding time-windows, and fires real-time alerts — built for speed, built for detection.

CodeShield is a multi-threaded C-based log analysis and scoring engine designed to detect suspicious activity patterns from system or application logs. It ingests logs, analyzes events, scores threats, and generates alerts using a modular pipeline architecture.

---

## 📁 Project Structure

```
hack_vsc/
├── alert.c            # Alert generation and logging
├── alert_log.txt      # Generated alert output
├── analyzer.c         # Core analysis logic
├── codeshield.exe     # Compiled Linux ELF binary (name retained)
├── compile.bat        # Windows compile script
├── generate_logs.c    # Test log generator
├── generate_logs.exe  # Compiled log generator binary
├── hashmap.c          # Custom hashmap implementation
├── ingestion.c        # Log ingestion & parsing
├── main.c             # Program entry point
├── Makefile           # Linux build automation
├── sample_logs.txt    # Sample input logs
├── scorer.c           # Threat scoring logic
├── structures.h       # Shared data structures
└── window.c           # Sliding time-window analysis
```

---

## ⚙️ Build Instructions (Linux)

### Requirements
- GCC
- POSIX threads (`pthread`)

### Compile using Makefile
```bash
make
```

### Or compile manually
```bash
gcc -o codeshield alert.c analyzer.c hashmap.c ingestion.c main.c scorer.c window.c -lpthread
```

### Run
```bash
./codeshield
```

> **Note:** On Linux, binaries must be executed with `./` — even if the file is named `.exe`, it is a standard ELF executable and works natively on Linux.

---

## 🪟 Windows Build (Optional)

Use the provided batch file:
```bat
compile.bat
```
Requires MinGW or a compatible GCC environment.

---

## 🧠 How It Works (Pipeline)

```
[Logs] → [Ingestion] → [Parser] → [Time-Window] → [Scorer] → [Alerts]
```

1. **Log Ingestion** — Reads logs from text files or generated sources (`ingestion.c`)
2. **Parsing & Structuring** — Converts raw logs into structured events (`structures.h`)
3. **Time-Window Analysis** — Groups events using sliding windows for pattern detection (`window.c`)
4. **Scoring Engine** — Assigns threat scores based on behavior frequency and severity (`scorer.c`)
5. **Alert System** — Writes alerts to `alert_log.txt` (`alert.c`)

---

## 🧪 Testing

Generate test logs:
```bash
gcc generate_logs.c -o generate_logs && ./generate_logs
```

Then analyze them:
```bash
./codeshield
```

---

## 👥 Team

| Name | Roll Number | Role | Responsibilities |
|---|---|---|---|
| **Rakesh G** | 2401201064 | 👑 Team Lead & Core Engine Dev | Project architecture, `main.c`, `analyzer.c`, integration, final build & submission |
| **Aditya Shibu** | 2401201047 | ⚠️ Scoring & Alert Systems Dev | `scorer.c`, `window.c`, `alert.c`, `generate_logs.c`, testing and validation |
| **Ujjwal Chauhan** | 2401201059 | 🔍 Ingestion & Data Pipeline Dev | `ingestion.c`, `hashmap.c`, `structures.h`, log parsing and data structuring |

---

## 📌 Notes

- The `.exe` extension is cosmetic on Linux; the binary is a standard ELF executable.
- Designed for learning, prototyping, and hackathon use.
- Easily extensible for real-time log streams or SIEM integration.

---

## 🚀 Future Improvements

- Real-time log streaming
- JSON log support
- Configurable rule engine
- REST API output
- Dashboard integration

---

## 📜 License

MIT License © 2025 Rakesh G, Aditya Shibu, Ujjwal Chauhan
