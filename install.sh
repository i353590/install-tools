#!/bin/bash

set -e

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
fi

# -------- Setup Brew PATH (for current + future sessions) --------
if [[ "$OS" == "Linux" ]]; then
    BREW_ENV='eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
    echo $BREW_ENV >> ~/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
    BREW_ENV='eval "$(/opt/homebrew/bin/brew shellenv)"'
    echo $BREW_ENV >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# -------- CF Tap --------
brew tap cloudfoundry/tap || true

# -------- Install If Missing --------
install_if_missing () {
  if command -v $1 &> /dev/null
  then
    echo "$1 already exists. Skipping..."
  else
    echo "Installing $1..."
    brew install $2
  fi
}

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
echo "9) aws-cli"
echo ""

read -p "Enter tool numbers (comma separated): " choices

IFS=',' read -ra SELECTED <<< "$choices"

for i in "${SELECTED[@]}"; do
  case $i in
    1) install_if_missing kubectl kubectl ;;
    2) install_if_missing cf cf-cli ;;
    3) install_if_missing gardenctl gardenctl ;;
    4) install_if_missing yq yq ;;
    5) install_if_missing helm helm ;;
    6) install_if_missing jq jq ;;
    7) install_if_missing k9s k9s ;;
    8) install_if_missing git git ;;
    9) install_if_missing aws awscli ;;
    *) echo "Invalid option: $i" ;;
  esac
done

echo ""
echo "Installation Complete."
echo "If commands don't work immediately, run: source ~/.bashrc"