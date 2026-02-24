
---

# Developer Environment Setup (MacOS / WSL / Linux)

This repository provides a **single-command onboarding setup** to install commonly used cloud-native CLI tools required for working with:

* Kubernetes clusters
* SAP BTP landscapes
* Gardener environments
* Cloud Foundry runtimes
* AWS environments

The setup is intended to standardize developer machines across the team and eliminate manual installation steps.

---

## Supported Platforms

* MacOS
* Native Linux
* WSL (Ubuntu recommended)

---

## Tools Available for Installation

The installer provides an interactive prompt allowing users to choose which tools to install from the following list:

| Tool      | Purpose                    |
| --------- | -------------------------- |
| kubectl   | Kubernetes CLI             |
| cf-cli    | Cloud Foundry CLI          |
| gardenctl | Gardener landscape access  |
| aws-cli   | AWS command line interface |
| helm      | Kubernetes package manager |
| yq        | YAML processor             |
| jq        | JSON processor             |
| k9s       | Kubernetes terminal UI     |
| git       | Version control            |

Users may install only the tools required for their specific use case.

---

## What This Setup Does

* Installs Homebrew automatically if not present
* Configures required environment PATH
* Detects already installed CLIs and skips them
* Installs only selected tools
* Installs latest available versions by default
* Avoids overwriting existing working setups

---

## Pre-Requisites (Linux / WSL)

Ensure the following packages are available:

```bash
sudo apt update
sudo apt install build-essential curl file git -y
```

---

## Usage

### 1. Clone the Repository

```bash
git clone <repo-url>
cd <repo-name>
```

---

### 2. Provide Execution Permission

Run this once:

```bash
chmod +x install.sh
```

---

### 3. Run the Installer

```bash
./install.sh
```

---

### 4. Select Required Tools

Example input:

```text
Enter tool numbers (comma separated): 1,2,4
```

The installer will:

* Check if selected CLIs already exist
* Install only the missing tools
* Skip the rest

---

## Post Installation

If any installed commands are not immediately recognized, reload the shell environment:

```bash
source ~/.bashrc
```

Or restart the terminal session.

---

## Notes

* The installer installs the **latest available versions** of selected tools.
* Existing installations (from brew / apt / snap / manual binaries) will not be modified.
* The setup is intended for development environments interacting with Kubernetes, Cloud Foundry, Gardener, and related SAP BTP runtimes.

---
