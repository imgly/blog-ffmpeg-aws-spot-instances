#!/bin/bash
# ==================================================
# ec2_spot_user_data_ubuntu.sh
# User-data script for Ubuntu 22 EC2 instances
# Installs AWS CLI v2 + FFmpeg automatically at launch
# ==================================================

# Update and upgrade system
apt-get update -y
apt-get upgrade -y

# Install unzip, curl, and dependencies
apt-get install -y unzip curl software-properties-common

# Install AWS CLI v2
if ! command -v aws &> /dev/null; then
    echo "Installing AWS CLI v2..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    ./aws/install
fi

# Install FFmpeg from Ubuntu repos
echo "Installing FFmpeg..."
apt-get install -y ffmpeg

# Verify installations
echo "Verifying installations..."
aws --version
ffmpeg -version
