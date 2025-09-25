#!/bin/bash

DATE=$(date +%Y-%m-%d)

BACKUP_FILE="app-data-backup-$DATE.tar.gz"


SOURCE_DIR="app-data"


BACKUP_DIR="backups"


mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

echo "ﭗﺸﺘﯿﺑﺎﻧ<200c>ﮕﯾﺮﯾ ﺏﺍ ﻡﻮﻔﻘﯿﺗ ﺎﻨﺟﺎﻣ ﺵﺩ: $BACKUP_DIR/$BACKUP_FILE"
