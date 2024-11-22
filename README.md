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

🛠 Setup Instructions
1. Clone the Repository
git clone https://github.com/username/aws-s3-log-archiver.git
cd aws-s3-log-archiver

2. Edit the Script
Open archive-logs-s3.sh and modify the following variables:

LOG_DIR="/path/to/logs"                  # Path to your logs directory
S3_BUCKET_NAME="your-s3-bucket-name"    # Name of the target S3 bucket

3. Set Permissions
Ensure the script is executable:

chmod +x archive-logs-s3.sh

4. Test the Script
Run the script manually to ensure it works:

./archive-logs-s3.sh

5. Automate with Cron
Schedule a cron job to run the script daily at 3 PM IST (9:30 AM UTC):

crontab -e

Add the following line:

30 9 * * * /path/to/aws-s3-log-archiver/archive-logs-s3.sh >> /path/to/aws-s3-log-archiver/logs/cron.log 2>&1

📋 Example Output
Script Execution Output:
Compressing logs...
Logs archived successfully: logs-2024-11-20.tar.gz
Uploading logs to S3...
Upload successful to s3://your-s3-bucket-name/logs-2024-11-20.tar.gz

Cron Job Log (cron.log):
[2024-11-20 09:30:01 UTC] Starting log archival process...
[2024-11-20 09:30:05 UTC] Logs archived successfully: logs-2024-11-20.tar.gz
[2024-11-20 09:30:07 UTC] Upload successful to S3 bucket: your-s3-bucket-name

📖 Customization
Change Log Directory: Modify the LOG_DIR variable.
Set Different S3 Bucket: Update the S3_BUCKET_NAME variable.
Add File Paths: Extend the tar command in the script.
🐛 Troubleshooting
Logs Directory Not Found: Verify directory existence and path in the script.
AWS CLI Not Configured: Ensure AWS CLI is installed and configured:
aws configure

Permission Denied:
Ensure script executability:
chmod +x archive-logs-s3.sh

Set appropriate log directory permissions:
chmod 755 /path/to/logs

Debugging Cron Jobs: Check system logs for cron execution:
grep CRON /var/log/syslog

💡 Future Enhancements
Support for multiple log directories.
Email notifications for successful or failed uploads.
Implement log retention policies in the S3 bucket.
🤝 Contributing
Contributions are welcome! Feel free to submit a pull request or open an issue for feature requests or bug reports.

