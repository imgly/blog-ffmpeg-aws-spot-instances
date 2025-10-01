#!/bin/bash
# ==================================================
# install_ffmpeg.sh
# A helper script to update the system and install FFmpeg
# Works for both Ubuntu and Amazon Linux
# ==================================================

echo "Starting FFmpeg installation..."

# Check if system is Ubuntu/Debian
if [ -f /etc/debian_version ]; then
    echo "Detected Ubuntu/Debian system."
    echo "Updating package lists and upgrading existing packages..."
    sudo apt update && sudo apt upgrade -y   # -y auto-confirms

    echo "Installing FFmpeg..."
    sudo apt install ffmpeg -y

# Check if system is Amazon Linux
elif [ -f /etc/amazon-linux-release ]; then
    echo "Detected Amazon Linux system."
    echo "Updating existing packages..."
    sudo yum update -y

    echo "Enabling EPEL repository and installing FFmpeg..."
    sudo amazon-linux-extras enable epel
    sudo yum install ffmpeg -y

# If unsupported OS
else
    echo "Unsupported OS. Please install FFmpeg manually."
    exit 1
fi

# Verify installation
echo "Verifying FFmpeg installation..."
ffmpeg -version
