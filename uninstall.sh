#!/bin/bash

set -e

echo "Starting cleanup..."

# -------- Ensure Brew Exists --------
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Nothing to uninstall."
    exit 0
fi

# -------- Uninstall If Exists --------
uninstall_if_exists () {
  if command -v $1 &> /dev/null
  then
    echo "Uninstalling $1..."
    brew uninstall $2 || true
  else
    echo "$1 not found. Skipping..."
  fi
}

# -------- Tools to Remove --------
uninstall_if_exists kubectl kubectl
uninstall_if_exists cf cf-cli
uninstall_if_exists gardenctl gardenctl
uninstall_if_exists yq yq
uninstall_if_exists helm helm
uninstall_if_exists jq jq
uninstall_if_exists k9s k9s
uninstall_if_exists aws awscli

echo ""
echo "Cleanup complete."
echo "Git and Homebrew were preserved."