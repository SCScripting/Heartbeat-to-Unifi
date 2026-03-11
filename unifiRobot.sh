#!/bin/bash

# Ethan Dykes
# Full automation for setting up Unifi Heartbeat via SSH and github grabs

cd /data/
# Grab the cronjob check
curl https://raw.githubusercontent.com/SCScripting/Unifi-Heartbeat-Cronjob-Script/refs/heads/main/25-add-cron-jobs.sh --output 25-add-cron-jobs.sh
echo "Enter Heartbeat: "
read heartbeat

# Creates the unique heartbeat cURL for the cronjob
mkdir cronjobs
touch /cronjobs/healthchecksio

cat << 'EOF' > /cronjobs/healthchecksio
* * * * * root curl -fsL "$heartbeat" >/dev/null 2>&1
EOF

chmod +x 25-add-cron-jobs.sh

# Execute
./25-add-cron-jobs.sh
