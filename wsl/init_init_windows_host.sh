
sudo tee /etc/systemd/system/update-hosts.service > /dev/null << 'EOF'
[Service]
Type=oneshot
ExecStart=/home/anton/init_windows_host.sh

[Install]
WantedBy=default.target
EOF
sudo systemctl daemon-reload
sudo systemctl enable update-hosts.service
# sudo systemctl start update-hosts.service
