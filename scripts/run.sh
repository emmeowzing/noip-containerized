#! /bin/bash
# Entrypoint of container - query and update your public IP.

printf "Entering query loop..."

CURRENT_IP="$(curl -s ifconfig.me)"

while true; do
    sleep "$INTERVAL"

    QUERIED_PUBLIC_IP="$(curl -s ifconfig.me)"

    if [ "$QUERIED_PUBLIC_IP" != "$CURRENT_IP" ]; then
        printf "Updating remote IP to changed IP: %s from former IP %s\\n" "$QUERIED_PUBLIC_IP" "$CURRENT_IP"
        curl -s --user "$USERNAME:$PASSWORD" "https://dynupdate.no-ip.com/nic/update?hostname=$HOSTNAME&myip=$QUERIED_PUBLIC_IP"
    fi
done
