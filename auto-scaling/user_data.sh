#!/bin/bash
set -ex   # Debug mode (print commands as they run)

echo "Updating packages..."
sudo apt update -y

echo "Installing Apache..."
sudo apt install apache2 -y

echo "Creating index.html..."
echo "<h1>Welcome to My Web Server</h1>" | sudo tee /var/www/html/index.html

echo "Starting Apache..."
sudo systemctl start apache2
sudo systemctl enable apache2

echo "User data script execution complete." >> /tmp/user_data.log
