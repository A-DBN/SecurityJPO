# Epitech Open Days Security Presentation Script

## Overview
This Bash script is designed for Epitech Open Days to facilitate the installation and uninstallation of various security tools on Linux systems. It automatically detects the Linux distribution and uses the appropriate package manager for operations.

## Requirements
- Linux Distribution: Debian/Ubuntu, Fedora, or Arch-based
- Internet Connection
- Sudo Privileges

## Script Features
- Automatically detects Linux distribution
- Supports installation and uninstallation of:
  - Nmap
  - John the Ripper
  - Hashcat
  - Linpeas
  - Gobuster
- Downloads essential wordlists like `rockyou.txt` and `common.txt`

## Installation & Execution
1. Clone the repository or download the script.
2. Make the script executable:
   ```bash
   chmod +x install.sh
    ```
3. Run the script
    ```
    ./install.sh
    ```

## Usage Instructions
Upon running the script, you will be prompted to choose between installing or uninstalling tools.

# Install tools
Enter your choice of tools to install by specifying their corresponding numbers, separated by spaces.

# Uninstall Tools
Similar to installation, choose the tools you wish to uninstall.

## Run Tools
Each `.sh` files except `install.sh` run one of the previous tool with a setup included except `nmap.sh` and `gobuster.sh` that requires an URL.

## Contact
Mail: antoine.dabin@epitech.eu or antoine1.dabin@epitech.eu

