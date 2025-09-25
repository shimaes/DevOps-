# DevOps-
Learning DevOps 
# Bash & Linux Fundamentals: Learning and Automation Projects

This repository is a collection of small scripts and projects created to learn and master the fundamental concepts of the **Bash** command line and the **Linux** operating system. The goal of these projects is not just to learn commands, but to use them to solve practical, real-world problems.

## Key Concepts Learned

Throughout this learning journey, the focus has been on the following concepts:

* **File & Directory Management**: Using commands like `touch`, `cp`, `mv`, and `rm` to organize data.
* **Directory Navigation**: Using `cd` and `ls` to move around and view the file system.
* **Data Handling**: Using `echo` and `cat` to create and read file content.
* **Automation**: Combining commands to create executable and self-running scripts.

## Project: Automated Backup Script

My first hands-on project was building a simple script to automate the process of backing up data. This script automatically creates a compressed and timestamped backup of a folder, which is a common task in DevOps engineering.

**This script demonstrates:**

1.  Getting the current date to use in the backup filename.
2.  Creating a destination folder if it does not already exist.
3.  Archiving and compressing a source directory using the powerful `tar` command.

**Script Content (`backup_script.sh`):**

```bash
#!/bin/bash

# This script automatically backs up a folder.

# Get the current date for the file name
DATE=$(date +%Y-%m-%d)

# Backup file name
BACKUP_FILE="app-data-backup-$DATE.tar.gz"

# Source directory to back up
SOURCE_DIR="app-data"

# Backup directory
BACKUP_DIR="backups"

# Check if the backup directory exists and create it if not
mkdir -p "$BACKUP_DIR"

# Archive and compress the source directory using the tar command
tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

# پروژه‌های Bash و لینوکس: آموزش و اتوماسیون

این ریپازیتوری مجموعه‌ای از اسکریپت‌ها و پروژه‌های کوچک است که برای یادگیری و تسلط بر اصول بنیادین خط فرمان **Bash** و سیستم عامل **لینوکس** ایجاد شده است. هدف از این پروژه‌ها، نه تنها آشنایی با دستورات، بلکه استفاده از آن‌ها برای حل مسائل واقعی در دنیای فناوری اطلاعات است.

## مفاهیم کلیدی یادگرفته شده

در این مسیر یادگیری، بر روی مفاهیم زیر تمرکز شده است:

* **مدیریت فایل و پوشه**: استفاده از دستوراتی مانند `touch`, `cp`, `mv`, `rm` برای سازماندهی داده‌ها.
* **پیمایش دایرکتوری**: استفاده از `cd`, `ls` برای حرکت و مشاهده محتوای سیستم فایل.
* **مدیریت داده**: استفاده از `echo`, `cat` برای ایجاد و خواندن محتوای فایل‌ها.
* **اتوماسیون**: ترکیب دستورات برای ایجاد اسکریپت‌های قابل اجرا و خودکار.

## پروژه: اسکریپت پشتیبان‌گیری خودکار

اولین پروژه عملی من، ساخت یک اسکریپت ساده برای خودکارسازی فرآیند پشتیبان‌گیری از داده‌هاست. این اسکریپت به طور خودکار یک نسخه فشرده و زمان‌بندی‌شده از یک پوشه را تهیه می‌کند که یک وظیفه معمول در مهندسی DevOps است.

**اهداف این اسکریپت:**

1.  دریافت تاریخ فعلی و استفاده از آن در نام فایل پشتیبان.
2.  ساخت یک پوشه مقصد برای ذخیره نسخه‌های پشتیبان در صورت عدم وجود.
3.  آرشیو و فشرده‌سازی پوشه مبدأ با استفاده از دستور قدرتمند `tar`.

**محتوای اسکریپت (`backup_script.sh`):**

```bash
#!/bin/bash

# این اسکریپت به صورت خودکار از یک پوشه پشتیبان‌گیری می‌کند.

# دریافت تاریخ امروز برای نام‌گذاری فایل
DATE=$(date +%Y-%m-%d)

# نام فایل پشتیبان
BACKUP_FILE="app-data-backup-$DATE.tar.gz"

# نام پوشه اصلی که می‌خواهیم از آن پشتیبان بگیریم
SOURCE_DIR="app-data"

# نام پوشه پشتیبان‌گیری
BACKUP_DIR="backups"

# بررسی و ساخت پوشه پشتیبان‌گیری در صورت عدم وجود
mkdir -p "$BACKUP_DIR"
اجرای اسکریپت
chmod +x backup_script.sh
./backup_script.sh

بررسی نتیجه: حالا با ls محتویات پوشه backups رو بررسی کن. باید یک فایل به نام app-data-backup-2025-09-24.tar.gz (با تاریخ روز) داخلش ببینی!
# فشرده‌سازی و پشتیبان‌گیری با استفاده از دستور tar
tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

echo "پشتیبان‌گیری با موفقیت انجام شد: $BACKUP_DIR/$BACKUP_FILE"

echo "Backup successful: $BACKUP_DIR/$BACKUP_FILE"
