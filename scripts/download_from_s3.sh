#!/bin/bash
# ==================================================
# download_from_s3.sh
# A helper script to download a video from S3 to your Spot Instance
# ==================================================

# Usage check
if [ $# -ne 2 ]; then
    echo "Usage: $0 <bucket-name> <file-name>"
    echo "Example: $0 my-video-bucket sample.mp4"
    exit 1
fi

BUCKET_NAME=$1
FILE_NAME=$2

# Download from S3 input folder
echo "Downloading s3://$BUCKET_NAME/input/$FILE_NAME ..."
aws s3 cp "s3://$BUCKET_NAME/input/$FILE_NAME" "$FILE_NAME"

# Confirm success
if [ $? -eq 0 ]; then
    echo "✅ Download successful: $FILE_NAME saved locally."
else
    echo "❌ Download failed. Check your AWS CLI config, IAM role, and bucket permissions."
fi
