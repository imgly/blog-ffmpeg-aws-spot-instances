# AWS FFmpeg Guide 🚀

This repository contains scripts and examples to accompany the article *Running FFmpeg on AWS Spot Instances*.
It demonstrates how to set up AWS, install FFmpeg, and process videos at scale while keeping costs low. Read more on the [blog here](https://img.ly/blog/how-to-run-ffmpeg-on-aws-spot-instances-for-scalable-low-cost-video-processing/).
---

## 📖 Overview

In this repo, you’ll find:

- Scripts for installing FFmpeg, uploading/downloading files to S3, and running FFmpeg jobs.
- Infrastructure templates (IAM policy + EC2 user-data script).
- Examples for Spot Instances and AWS Lambda usage.
- Step-by-step guides for transcoding workflows.

This makes it easier to **reproduce the guide** in practice and adapt it for your own workflows.

---

## 🗂 Repository Structure

```
aws-ffmpeg-guide/
│
├── README.md                  # Main documentation (this file)
├── scripts/                   # Helper scripts for setup and jobs
│   ├── install_ffmpeg.sh
│   ├── upload_to_s3.sh
│   ├── download_from_s3.sh
│   └── run_ffmpeg.sh
│
├── examples/
│   ├── transcode_example.md   # Walkthrough: uploading, processing, saving
│   ├── transcode_example.sh   # Single script for processing
│   └── lambda_thumbnail/      # AWS Lambda example for lightweight FFmpeg tasks
│       └── index.js
│
├── infrastructure/
│   ├── ec2_spot_user_data.sh  # Auto-install FFmpeg, AWS CLI on EC2 launch
│   └── iam_policy.json        # Example IAM role for S3 access
│
├── .gitignore
└── LICENSE
```

---

## ⚡ Quickstart

### 1. Launch an EC2 Spot Instance
From the AWS Console → EC2 → Launch Instance → choose **Ubuntu 22**.
Enable **Spot Instance** under *Advanced details → Purchasing option*.

### 2. Connect via SSH
```bash
ssh -i "your-key.pem" <username>@<your-instance-public-dns>
```

### 3. Clone this repo to the instance
```bash
git clone https://github.com/your-repo-name/your-repo.git
cd your-repo
```

### 4. Install FFmpeg
⚠️ If you used the user data file from /infrastructure, then you can skip this step.
```bash
chmod +x scripts/install_ffmpeg.sh
./scripts/install_ffmpeg.sh
```

### 4. Upload Video to S3
```bash
./scripts/upload_to_s3.sh sample.mp4 your-bucket-name
```

### 5. Download & Process
```bash
./scripts/download_from_s3.sh your-bucket-name sample.mp4
./scripts/run_ffmpeg.sh sample.mp4 output.webm
./scripts/upload_to_s3.sh output.webm your-bucket-name
```

---

## ☁️ Spot Instances vs Lambda

- **AWS Lambda** → best for small jobs (e.g. thumbnails, short clips).
- **EC2 Spot Instances** → best for heavy, long-running jobs.

Rule of thumb:
- Quick & lightweight → Lambda
- Large & restartable → Spot

See `examples/lambda_thumbnail/` for a Lambda thumbnail function.

---

## 🛡 Handling Spot Interruptions

- Break videos into smaller chunks (`-ss` and `-t` with FFmpeg).
- Store partial results in S3 immediately.
- Orchestrate jobs with **SQS** or **Step Functions** for scalability.

---

## 🔮 Next Steps

- Try different EC2 instance families (C5 for CPU, G4dn for GPU).
- Automate pipelines with SQS/Step Functions.
- Explore [CE.SDK](https://img.ly/creative-sdk) if you need an **in-browser editor** to complement backend processing.

---

## 📜 License
MIT License. Free to use and adapt.

---

## 🙌 Credits
Authored as a companion repo for the guide on **Running FFmpeg on AWS Spot Instances**.
