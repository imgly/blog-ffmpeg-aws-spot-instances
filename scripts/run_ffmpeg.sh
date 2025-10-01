#!/bin/bash
# ==================================================
# run_ffmpeg.sh
# A helper script to process a video with FFmpeg
# ==================================================

# Usage check
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input-file> <output-file>"
    echo "Example: $0 sample.mp4 output.webm"
    exit 1
fi

INPUT_FILE=$1
OUTPUT_FILE=$2

# Run FFmpeg job
echo "Running FFmpeg: converting $INPUT_FILE to $OUTPUT_FILE ..."
ffmpeg -i "$INPUT_FILE" "$OUTPUT_FILE"

# Confirm success
if [ $? -eq 0 ]; then
    echo "✅ FFmpeg job completed successfully: $OUTPUT_FILE"
else
    echo "❌ FFmpeg job failed. Check logs above."
fi
