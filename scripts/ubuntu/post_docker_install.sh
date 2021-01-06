#!/bin/bash

# Create Docker group & add user to it
sudo groupadd docker;
sudo usermod -aG docker "$USER";
newgrp docker;

# Enable Docker Daemon
sudo systemctl enable docker;
