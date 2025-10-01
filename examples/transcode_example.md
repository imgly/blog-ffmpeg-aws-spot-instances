# Example: Transcoding a Video

1. Upload file to S3:

    ```./scripts/upload_to_s3.sh assets/sample.mp4 your-bucket-name```


2. Download file to EC2:

    ```./scripts/download_from_s3.sh your-bucket-name sample.mp4```

3. Run FFmpeg job:

    ```./scripts/run_ffmpeg.sh sample.mp4 output.webm```

4. Upload result back to S3:

    ```aws s3 cp output.webm s3://your-bucket-name/output/output.webm```


The following script will do the all above mentioned steps in a sinlge command:
    ```./transcode.sh ../assets/sample.mp4 your-bucket-name ../output.webm```