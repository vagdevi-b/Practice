#!/bin/bash
# Check the /etc/os-release file

if [[ -f /etc/os-release ]]; then
  source /etc/os-release
  flavor=$NAME
fi
echo "Linux Flavor: $flavor"

# Check if Java is installed

java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
if [[ -n "$java_version" ]]; then
  echo "Java is installed. Version: $java_version"
else
  echo "Java is not installed."
fi

#Check if Jenkins is installed

jenkins_version=$(jenkins --version)
if [[ -n "$jenkins_version" ]]; then
  echo "Jenkins is installed. Version: $jenkins_version"
else
  echo "Jenkins is not installed."
fi

# Function to install Jenkins on Debian-based distributions
install_jenkins_debian() {
  sudo apt update
  sudo apt install -y openjdk-11-jdk
  wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
  sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
  sudo apt update
  sudo apt install -y jenkins
}

# Function to install Jenkins on Red Hat-based distributions
install_jenkins_redhat() {
  sudo yum install -y java-11-openjdk-devel
  sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
  sudo yum upgrade
  sudo yum install -y jenkins
}

# Install Jenkins based on the detected flavor
if [[ $flavor == *"Debian"* || $flavor == *"Ubuntu"* ]]; then
          install_jenkins_debian
  elif [[ $flavor == *"Red Hat"* || $flavor == *"CentOS"* ]]; then
            install_jenkins_redhat
      else
                echo "Unsupported Linux flavor: $flavor. Cannot install Jenkins."
fi

url="http://3.111.144.104:8080/login?from=%2F"
expected_status="200"

http_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")

if [ "$http_code" == "$expected_status" ]; then
  echo "Accessible with status code $expected_status"
else
  echo "Not accessible or has a different status code: $http_code"
fi
