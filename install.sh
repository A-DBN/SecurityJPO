#!/bin/bash

###
# This script is used to install/uninstall tools for the Security Presentation For Epitech Open Days.
# It is intended to be run on a Linux machine.
# Contact antoine1.dabin@epitech for any questions.
###


RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

INSTALL_CMD=""

function check_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if grep -qEi 'debian|ubuntu' /etc/os-release; then
            echo -e "${GREEN}Debian/Ubuntu detected${NC}"
            INSTALL_CMD="sudo apt-get install -y"
        elif grep -qi 'fedora' /etc/os-release; then
            echo -e "${GREEN}Fedora detected${NC}"
            INSTALL_CMD="sudo dnf install -y"
        elif grep -qi 'arch' /etc/os-release; then
            echo -e "${GREEN}Arch Linux detected${NC}"
            INSTALL_CMD="sudo pacman -S --noconfirm"
        else
            echo -e "${RED}KO, allowed distributions: Fedora/Debian/Ubuntu/Arch${NC}"
            exit 1
        fi
    else
        echo -e "${RED}Linux OS not detected${NC}"
        exit 1
    fi
}

function check_installation() {
    local package=$1
    if command -v $package &> /dev/null; then
        echo -e "${GREEN} OK${NC}"
    else
        yay -S --noconfirm $package > /dev/null 2>&1
        if command -v $package &> /dev/null; then
            echo -e "${GREEN} OK${NC}"
        else
            echo -e "${RED} KO${NC}"
        fi
    fi
}

function install_package() {
    if ! command -v $1 &> /dev/null; then
        echo -n "Installing $1..."
        $INSTALL_CMD $1 > /dev/null 2>&1
        check_installation $1
    else
        echo -e "${YELLOW}$1 already installed${NC}"
    fi
}

function install_Linpeas() {
    local linpeas_path="/usr/local/bin/linpeas"

    if [ ! -f "$linpeas_path" ]; then
        echo -n "Downloading Linpeas..."
        curl -L -o linpeas.sh https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh > /dev/null 2>&1

        if [ -s linpeas.sh ]; then
            chmod +x linpeas.sh
            sudo mv linpeas.sh $linpeas_path
            echo -e "${GREEN} OK${NC}"
        else
            echo -e "${RED} KO - Failed to download Linpeas${NC}"
            return 1
        fi
    else
        echo -e "${YELLOW}Linpeas already installed${NC}"
    fi
}

function check_uninstall() {
        if ! command -v $package &> /dev/null; then
            echo -e "${GREEN} OK${NC}"
        else
            echo -e "${RED} KO${NC}"
        fi
}

function uninstall_package() {
    local package=$1

    if command -v apt-get &> /dev/null; then
        echo -n "Removing $package..."
        sudo apt-get remove --purge "$package" -y > /dev/null 2>&1
        check_uninstall $package
    elif command -v yum &> /dev/null; then
        echo -n "Removing $package..."
        sudo yum remove "$package" -y > /dev/null 2>&1
        check_uninstall $package
    elif command -v dnf &> /dev/null; then
        echo -n "Removing $package..."
        sudo dnf remove "$package" -y > /dev/null 2>&1
        check_uninstall $package
    elif command -v pacman &> /dev/null; then
        echo -n "Removing $package..."
        sudo pacman -R "$package" --noconfirm > /dev/null 2>&1
        check_uninstall $package
    else
        echo -e "${RED}No suitable package manager found for uninstalling $package.${NC}"
    fi
}

function uninstall_leanpeas() {
    local linpeas_path="/usr/local/bin/linpeas"
    if [ -f "$linpeas_path" ]; then
        echo -n "Removing Linpeas..."
        sudo rm "$linpeas_path"
        echo -e "${GREEN} OK${NC}"
    else
        echo -e "${YELLOW}Linpeas is not installed${NC}"
    fi
}

function cleanup() {
    echo "Select the tools you want to uninstall. Enter the numbers separated by spaces (e.g., 1 2 3):"
    echo "1) nmap"
    echo "2) John the Ripper"
    echo "3) Hashcat"
    echo "4) Linpeas"
    echo "5) Gobuster"
    echo "6) All"
    echo "7) Exit"

    read -p "Enter selections: " input

    if [[ $input == *"1"* ]]; then
        uninstall_package "nmap"
    fi
    if [[ $input == *"2"* ]]; then
        uninstall_package "john"
    fi
    if [[ $input == *"3"* ]]; then
        uninstall_package "hashcat"
    fi
    if [[ $input == *"4"* ]]; then
        uninstall_leanpeas
    fi
    if [[ $input == *"5"* ]]; then
        uninstall_package "gobuster"
    fi
    if [[ $input == *"6"* ]]; then
        uninstall_package "nmap"
        uninstall_package "john"
        uninstall_package "hashcat"
        uninstall_package "gobuster"
        uninstall_leanpeas
        rm rockyou.txt common.txt
    fi
}

function install_files() {
    local script_dir=$(dirname "$(realpath "$0")")

    if [ -f "$script_dir/rockyou.txt" ]; then
        echo -e "${YELLOW}rockyou.txt already available${NC}"
    fi

    if [ -f "$script_dir/common.txt" ]; then
        echo -e "${YELLOW}common.txt already available${NC}"
    fi

    echo -n "Downloading rockyou.txt..."
    curl -L -o rockyou.txt https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt > /dev/null 2>&1
    if [[ -f "$script_dir/rockyou.txt" ]]; then
        echo -e "${GREEN} OK${NC}"
    else
        echo -e "${RED} KO${NC}"
    fi

    echo -n "Downloading common.txt..."
    curl -o common.txt https://raw.githubusercontent.com/v0re/dirb/master/wordlists/common.txt > /dev/null 2>&1
    if [[ -f "$script_dir/common.txt" ]]; then
        echo -e "${GREEN} OK${NC}"
    else
        echo -e "${RED} KO${NC}"
    fi
}

function choose_install() {
    echo "Select the tools you want to install. Enter the numbers separated by spaces (e.g., 1 2 3):"
    echo "1) nmap"
    echo "2) John the Ripper"
    echo "3) Hashcat"
    echo "4) Linpeas"
    echo "5) Gobuster"
    echo "6) All"
    echo "7) Install Rockyou.txt and common.txt"
    echo "8) Exit"

    read -p "Enter selections: " input
    IFS=' ' read -r -a selections <<< "$input"

    for selection in "${selections[@]}"; do
        case $selection in
            1) install_package "nmap" ;;
            2) install_package "john" ;;
            3) install_package "hashcat" ;;
            4) install_Linpeas ;;
            5) install_package "gobuster" ;;
            6) 
                install_package "nmap"
                install_package "john"
                install_package "hashcat"
                install_package "gobuster"
                install_Linpeas
                ;;
            7) install_files ;;
            *) echo -e "${RED}Invalid selection: $selection${NC}" ;;
        esac
    done
}

function main() {
    echo -n "Detecting OS..."
    check_os

    echo "Choose an action:"
    echo "1) Install tools"
    echo "2) Uninstall tools"
    read -p "Enter your choice (1 or 2): " choice

    case $choice in
        1)
            choose_install
            ;;
        2)
            cleanup
            ;;
        *)
            echo -e "${RED}Invalid choice. Exiting.${NC}"
            exit 1
            ;;
    esac
}

main