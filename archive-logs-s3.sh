#!/bin/bash

# Set the log directory and archive destination directory
LOG_DIR="/path/to/your/log dir"
ARCHIVE_DIR="path/to/your/archive/dir"   # Temporary local storage for archives
S3_BUCKET="your S3 Bucket name"             # Replace with your S3 bucket name

# Get the current date for the archive filename
DATE=$(date +"%Y-%m-%d")
ARCHIVE_FILE="logs_archive_$DATE.tar.gz"

# Create the archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Archive and compress the log files
tar -czf "$ARCHIVE_DIR/$ARCHIVE_FILE" -C "$LOG_DIR" .

# Check if the archive was created successfully
if [[ $? -eq 0 ]]; then
  echo "Logs archived successfully as $ARCHIVE_DIR/$ARCHIVE_FILE"
else
  echo "Failed to archive logs"
  exit 1
fi

# Upload the archive to S3
aws s3 cp "$ARCHIVE_DIR/$ARCHIVE_FILE" "s3://$S3_BUCKET/logs/$ARCHIVE_FILE"

# Check if the upload was successful
if [[ $? -eq 0 ]]; then
  echo "Archive uploaded to S3 successfully: s3://$S3_BUCKET/logs/$ARCHIVE_FILE"
  # Optionally, remove local archive after successful upload
  rm "$ARCHIVE_DIR/$ARCHIVE_FILE"
else
  echo "Failed to upload archive to S3."
fi
# === Exit Script Successfully ===
log_message "Script completed successfully"
exit 0
