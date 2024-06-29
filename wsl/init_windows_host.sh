#!/bin/bash

# Get the IP address of the nameserver from /etc/resolv.conf
nameserver_ip=$(grep -m 1 '^nameserver' /etc/resolv.conf | awk '{print $2}')

# Check if the IP was found
if [ -z "$nameserver_ip" ]; then
    echo "No nameserver IP found in /etc/resolv.conf"
    exit 1
fi

# Define the hostname to map to the nameserver IP
hostname="windows"

# Backup the original /etc/hosts file
sudo cp /etc/hosts /etc/hosts.bak

# Remove any existing entry with the same hostname
sudo sed -i "/\b$hostname\b/d" /etc/hosts

# Add the new mapping to /etc/hosts
echo "$nameserver_ip $hostname" | sudo tee -a /etc/hosts > /dev/null
