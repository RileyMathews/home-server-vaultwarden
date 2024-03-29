#! /usr/bin/zsh

source /home/rileymathews/server/vaultwarden/.envrc.secret
cd $DIR
echo "backing up sqlite db"
sqlite3 data/db.sqlite3 ".backup '$DIR/data/db-backup.sqlite3'"
echo "backing up to restic repo"
restic backup ./data 
