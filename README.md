# Open Source Audit Project: Git

**Student Name:** Nitya Vyas  
**Roll Number:** 24BEY10076  
**Slot:** B22  

---

## Introduction: Chosen Software (Git)
Git is a free and open-source distributed version control system designed to handle everything from small to massive projects with speed and efficiency. It was created by Linus Torvalds in 2005 for the development of the Linux kernel, and today it is the backbone of the modern software development ecosystem.

This repository contains the shell script components of my Open Source Audit Capstone Project, demonstrating practical Linux administration skills through the lens of Git.

---

## Setup and Execution Guide

Assume you are starting from a completely fresh Linux environment. Below is a comprehensive guide to setting up your environment, installing dependencies, configuring the repository, and successfully executing all five shell scripts.

### Step 1: Environment Setup
To run these scripts, you must be on a **Linux environment**. You can use:
- A local Linux installation (e.g., Ubuntu, Fedora, Debian).
- A virtual machine using VirtualBox or VMware.
- Windows Subsystem for Linux (WSL) if you are on Windows.

Ensure you have access to a terminal and possess basic `sudo` (root) privileges to install packages if needed.

### Step 2: Dependency Installation
Before executing the scripts, you must ensure that your system has the standard GNU core utilities and package managers installed. 

Open your terminal and run the following commands based on your distribution:

**For Debian/Ubuntu-based distributions:**
```bash
sudo apt update
sudo apt install -y coreutils bash awk sed du git
```

**For RHEL/Fedora-based distributions:**
```bash
sudo dnf install coreutils bash awk sed git rpm
```
*Note: Script 2 uses `dpkg` (Debian) or `rpm` (Red Hat) to verify packages. It will automatically detect your environment.*

### Step 3: Configuration & Cloning
Clone this repository to your local machine and navigate into the project directory:

```bash
git clone https://github.com/your-username/oss-audit-24BEY10076.git
cd oss-audit-24BEY10076/Audit_OSS
```

Before you can run the provided scripts, you must assign **execute permissions** to them. Run the following configuration command:
```bash
chmod +x *.sh
```

---

## Script Execution Instructions

### Script 1: System Identity Report
**Purpose:** Introduces the Linux system like a welcome screen. It dynamically detects your Linux distribution, kernel version, current user, system uptime, and dynamically states the OS open-source license.
**Execution:**
```bash
./1_system_identity.sh
```

### Script 2: FOSS Package Inspector
**Purpose:** Programmatically queries the system packages (via `dpkg` or `rpm`) to verify if the chosen software (**Git**) is installed. It retrieves its exact version and provides a short philosophical statement about it using a bash `case` statement.
**Execution:**
```bash
./2_package_inspector.sh
```

### Script 3: Disk and Permission Auditor
**Purpose:** Loops through critical system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) using a `for` loop to report their disk usage, owner, and precise permissions. It also runs a specialized verification against Git's configuration registry (e.g., `/etc/gitconfig`).
**Execution:**
```bash
./3_disk_auditor.sh
```

### Script 4: Log File Analyzer
**Purpose:** Using a `while-read` loop, this script ingests a system log file line by line, counts the occurrences of a specified keyword (like WARNING or ERROR), and outputs a summary along with a localized context tail. It features an interactive `do-while` style retry if you provide an invalid file path.
**Execution:**
You must provide a path to a log file as the first argument. You can optionally provide a keyword.
```bash
# General analysis using the default keyword "error":
./4_log_analyzer.sh /var/log/syslog

# Specialized analysis with a custom keyword:
./4_log_analyzer.sh /var/log/auth.log "failed"
```
*(Tip: On Fedora/RHEL, your logs might be in `/var/log/messages` instead!)*

### Script 5: Open Source Manifesto Generator
**Purpose:** This interactive program asks you three philosophical questions via the standard input (`read`) and immediately composes a personalized, interpolated open-source manifesto. It uniquely demonstrates standard output redirection by piping (`>`) the generated string into a localized `.txt` file automatically.
**Execution:**
```bash
./5_manifesto_generator.sh
```
*Simply answer the three questions in the terminal. Once finishing, verify the newly created `manifesto_<username>.txt` file.*
