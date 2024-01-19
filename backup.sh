#! /usr/bin/zsh

source /home/rileymathews/.zshrc
echo "backing up sqlite db"
echo `which sqlite3`
sqlite3 data/db.sqlite3 ".backup './data/db-backup.sqlite3'"
echo "backing up to restic repo"
restic backup -r s3:https://37a8e358fee81bf1f20e08b6ffe72c1d.r2.cloudflarestorage.com:/vaultwarden-restic-repository .
