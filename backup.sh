#! /usr/bin/zsh

on_error() {
    curl -d "vaultwarden backup failed" https://ntfy.rileymathews.com/home-server-alerts
}

set -e
trap 'on_error' ERR

source /home/rileymathews/server/vaultwarden/.envrc.secret
cd $DIR
echo "backing up sqlite db"
sqlite3 data/db.sqlite3 ".backup '$DIR/data/db-backup.sqlite3'"
echo "backing up to restic repo"
restic backup ./data 

curl -d "vaultwarden backup finished" https://ntfy.rileymathews.com/home-server-alerts
