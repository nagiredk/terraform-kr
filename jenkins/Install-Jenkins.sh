#!/bin/bash

set -e

echo "=== Updating system ==="
sudo dnf update -y

echo "=== Installing OpenJDK 17 ==="
sudo dnf install -y java-17-openjdk

echo "=== Verifying Java version ==="
java -version

echo "=== Adding Jenkins repo ==="
sudo curl --silent --location --output /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

echo "=== Installing Jenkins ==="
sudo dnf install -y jenkins

echo "=== Enabling and starting Jenkins ==="
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "=== Checking Jenkins status ==="
sudo systemctl status jenkins

echo "=== Configuring firewall ==="
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
firewall-cmd --list-ports
echo "=== Jenkins installation complete! ==="
echo "👉 Open your browser: http://<YOUR_SERVER_IP>:8080"
echo "👉 Initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
