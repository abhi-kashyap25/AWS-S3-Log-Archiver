# AWS S3 Log Archiver 🔥
=====================================

**Automate Server Log Archiving to AWS S3**

This project streamlines the process of archiving server logs to an AWS S3 bucket, ensuring secure backup and easy access for future reference or compliance purposes. It supports both manual execution and automated daily uploads via AWS CLI and cron jobs.

## 🚀 Features

* **Log Archiving**: Compress logs into a timestamped tarball.
* **S3 Integration**: Upload archived logs to a specified AWS S3 bucket.
* **Automation**: Automate daily uploads with a cron job.
* **Error Handling**: Provides meaningful output for process failures (e.g., missing directories).
* **Customizable**: Easily configure log paths, S3 bucket names, and schedules.

## 🛠 Prerequisites

* **Linux Environment**: With Bash installed.
* **AWS CLI**: Configured with access to the target S3 bucket.
  - **Install AWS CLI**: Refer to the [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
  - **Configure AWS CLI**:
    ```bash
    aws configure
    ```
    Provide your Access Key, Secret Key, Region, and Output Format.

## 📦 Project Structure

```plaintext
aws-s3-log-archiver/
├── archive-logs-s3.sh        # Bash script for archiving and uploading logs
├── logs/                     # Directory for storing logs (e.g., cron execution logs)
└── README.md                 # Project documentation

