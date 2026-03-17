#!/bin/bash

set -e

# -------- Detect OS --------
OS="$(uname)"

# -------- Install Homebrew if missing --------
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing..."

    if [[ "$OS" == "Linux" ]]; then
        sudo apt update
        sudo apt install build-essential curl file git -y
    fi

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [[ "$OS" == "Linux" ]]; then
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    else
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

echo ""
echo "Available Tools to Install:"
echo "1) kubectl"
echo "2) cf-cli"
echo "3) gardenctl"
echo "4) yq"
echo "5) helm"
echo "6) jq"
echo "7) k9s"
echo "8) git"
echo ""

read -p "Enter tool numbers (comma separated): " choices

IFS=',' read -ra SELECTED <<< "$choices"

for i in "${SELECTED[@]}"; do
  case $i in
    1) brew install kubectl ;;
    2) brew install cloudfoundry/tap/cf-cli ;;
    3) brew install gardenctl ;;
    4) brew install yq ;;
    5) brew install helm ;;
    6) brew install jq ;;
    7) brew install k9s ;;
    8) brew install git ;;
    *) echo "Invalid option: $i" ;;
  esac
done

echo ""
echo "Installation Complete."