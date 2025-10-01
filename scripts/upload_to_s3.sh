#!/bin/bash
# ==================================================
# upload_to_s3.sh
# A helper script to upload a sample video to an S3 bucket
# ==================================================

# Usage check
if [ $# -ne 2 ]; then
    echo "Usage: $0 <local-file> <bucket-name>"
    echo "Example: $0 sample.mp4 my-video-bucket"
    exit 1
fi

LOCAL_FILE=$1
BUCKET_NAME=$2

# Upload to S3 under the 'input' folder
echo "Uploading $LOCAL_FILE to s3://$BUCKET_NAME/input/ ..."
aws s3 cp "$LOCAL_FILE" "s3://$BUCKET_NAME/input/$(basename "$LOCAL_FILE")"

# Confirm success
if [ $? -eq 0 ]; then
    echo "✅ Upload successful: s3://$BUCKET_NAME/input/$(basename "$LOCAL_FILE")"
else
    echo "❌ Upload failed. Check your AWS CLI configuration and bucket permissions."
fi
