# 🛡️ SysSage — A Lightweight System Health Monitoring CLI Tool

> **A modular shell script that audits your system’s health right from the command line — no frills, no bloat.**

---

## 🚀 Project Purpose

SysSage is designed for developers, testers, and system engineers who want a **quick, readable, and customizable** health check of their Linux or WSL environments.

Whether you're prepping for a deployment, testing automation, or just maintaining system sanity — SysSage gets it done.

---

## ✨ Features

- 🔍 **Disk, Memory, and CPU Usage Monitoring**
- 🧪 **Modular Test Runner** for plug-and-play test scripts
- 🧾 **System Log Scanner** for error tracing
- 📂 **Auto-Generated Reports** with timestamps
- ⚙️ **Configurable Thresholds** *(future-ready)*
- 🧼 **Minimal Dependencies** — only standard Bash & Unix tools

---

## 🧰 Tech Stack

| Tool     | Purpose                        |
|----------|--------------------------------|
| `Bash`   | Scripting engine               |
| `grep`, `awk`, `df`, `free`, `uptime` | System metrics |
| `cron` *(optional)* | Scheduled health checks |
| `Git`    | Version control for modular builds |
| `WSL`/`Ubuntu` | Tested environment       |

---

## 📁 Folder Structure

## 📁 Folder Structure

```
SysSage/
├── health_check.sh           # 🧠 Main system monitoring script
├── tests/                    # 🧪 Custom sanity test scripts
│   ├── test_disk.sh
│   └── test_network.sh
├── logs/                     # 📁 Auto-generated health logs
├── config/                   # ⚙️ Thresholds & config (optional)
├── cronjob.txt               # ⏰ Example cron scheduling (optional)
└── README.md                 # 📘 You’re reading it now!
```


---

## ⚙️ Setup & Usage

```bash
# Clone the repo
git clone https://github.com/prakashharsh009/SysSage.git
cd SysSage

# Make the script executable
chmod +x health_check.sh

# Run the health check
./health_check.sh


📊 Sample Output

🔍 Checking disk usage...
🔍 Checking memory usage...
Memory used: 6% (518MB of 7793MB)
🔍 Checking CPU load average...
CPU Load Avg: 0.23, 0.12, 0.04
🔍 Scanning logs for recent errors...
2025-07-13T08:09:07 BEAST-Junior kernel: ERROR: getaddrinfo() failed
🔁 Running sanity test scripts...
✅ tests/test_disk.sh PASSED
✅ tests/test_network.sh PASSED
📁 Report saved to logs/system_report_2025-07-13_14-04-23.log
✅ SysSage Check Complete


🌐 Real-World Use Case

Inspired by a real-world need to:

“Run basic system health checks before builds, testing pipelines, or OS-level automation — especially inside lightweight Linux shells like WSL, where heavy monitoring tools aren't practical.”

Ideal for:
Local dev machines
CI environments
QA test systems
Internal servers

👤 Author
Harsh Prakash

🧠 “Tools that teach you how your system breathes are never small. They’re stepping stones toward engineering mastery.”
