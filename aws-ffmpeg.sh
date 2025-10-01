# - Connect to Your Instance via SSH.
    ssh -i "your-key.pem" <ubuntu>@<your-ec2-public-dns>
    # - Replace `your-key.pem` with your actual key file and `<ubuntu>` with your instance's username (e.g., `ec2-user`, `ubuntu`, etc.) and `<your-ec2-public-dns>` with your instance's public DNS address.

# - Update and Install FFmpeg.
    # - Before installing FFmpeg, update your package lists and upgrade existing packages to ensure you have the latest versions.
    # (Ubuntu)
        sudo apt update && sudo apt upgrade -y
        # `-y` flag automatically confirms the installation of updates.
    # (Amazon Linux)
        sudo yum update -y

    # - Install FFmpeg using the package manager.
    # (Ubuntu)
        sudo apt install ffmpeg -y
    # (Amazon Linux)
        sudo amazon-linux-extras enable epel
        sudo yum install ffmpeg -y

# - Verify the Installation.
    ffmpeg -version

# - Upload a Sample Video to S3.
# You can use the AWS CLI to upload a sample video file to your S3 bucket. Make sure you have the AWS CLI installed and configured with the necessary permissions.
    aws s3 cp sample.mp4 s3://your-bucket-name/input/sample.mp4
    # - Replace `sample.mp4` with the path to your local video file and `your-bucket-name` with your actual S3 bucket name.

# - Download the Video from S3 to Your EC2 Instance.
    aws s3 cp s3://your-bucket-name/input/sample.mp4 sample.mp4
    # - Replace `your-bucket-name` with your actual S3 bucket name. Your EC2 instance must have the necessary permissions to access the S3 bucket, aws CLI installed and configured.
    # - You can attach an IAM role to your EC2 instance with the necessary S3 permissions.

# - Convert the Video Using FFmpeg.
    ffmpeg -i sample.mp4 output.webm

# - Upload the Converted Video Back to S3.
    aws s3 cp output.webm s3://your-bucket-name/output/output.webm


# Other useful Linux and FFmpeg commands:
# - List files in the current directory:
    ls -la
# - Change directory:
    cd /path/to/directory
# - Get help with FFmpeg commands:
    ffmpeg -h
