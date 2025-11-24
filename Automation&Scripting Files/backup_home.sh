#!/bin/bash
# backup_home.sh
# Description: Creates a backup of /home and deletes backups older than 7 days

BACKUP_DIR="/backup"
SOURCE_DIR="/home"
DATE=$(date +%F)
BACKUP_FILE="$BACKUP_DIR/home_backup_$DATE.tar.gz"

# Create backup directory if not exists
mkdir -p $BACKUP_DIR

# Create backup
tar -czf $BACKUP_FILE $SOURCE_DIR

echo "Backup created at $BACKUP_FILE"

# Delete backups older than 7 days
find $BACKUP_DIR -type f -name "home_backup_*.tar.gz" -mtime +7 -exec rm {} \;

echo "Old backups older than 7 days deleted."
