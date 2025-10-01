#!/bin/bash

# Exit on error
set -e

# Check for required arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <source_file> <s3_bucket_name> <output_file>"
    exit 1
fi

SOURCE_FILE=$1
S3_BUCKET=$2
OUTPUT_FILE=$3

# Step 1: Upload file to S3
echo "Uploading $SOURCE_FILE to S3 bucket $S3_BUCKET..."
../scripts/upload_to_s3.sh "$SOURCE_FILE" "$S3_BUCKET"

# Step 2: Download file to EC2
FILE_NAME=$(basename "$SOURCE_FILE")
echo "Downloading $FILE_NAME from S3 bucket $S3_BUCKET to EC2..."
../scripts/download_from_s3.sh "$S3_BUCKET" "$FILE_NAME"

# Step 3: Run FFmpeg job
echo "Running FFmpeg job to transcode $FILE_NAME to $OUTPUT_FILE..."
../scripts/run_ffmpeg.sh "$FILE_NAME" "$OUTPUT_FILE"

# Step 4: Upload result back to S3
echo "Uploading $OUTPUT_FILE back to S3 bucket $S3_BUCKET..."
aws s3 cp "$OUTPUT_FILE" "s3://$S3_BUCKET/output/$OUTPUT_FILE"

echo "Transcoding process completed successfully!"