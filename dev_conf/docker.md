# Docker and Docker-Compose Setup Guide

## Installing Docker

### Step 1: Update Package List
Update the existing list of packages:
```bash
sudo apt update
```

### Step 2: Install Prerequisites
Install required packages for Docker:
```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

### Step 3: Add Docker's GPG Key
Add the official Docker GPG key:
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

### Step 4: Add Docker Repository
Add Docker's repository to APT sources:
```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
```

### Step 5: Install Docker
Update the package database and install Docker:
```bash
sudo apt update
sudo apt install docker-ce
```

### Step 6: Verify Docker Installation
Check that Docker is running:
```bash
sudo systemctl status docker
```

## Installing Docker-Compose

### Step 1: Download Docker-Compose
Run the command to download the stable release:
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

### Step 2: Set Executable Permissions
Apply executable permissions to the binary:
```bash
sudo chmod +x /usr/local/bin/docker-compose
```

### Step 3: Verify Installation
Test the installation:
```bash
docker-compose --version
```

## Usage

### Building and Running Containers

#### Build an Image
```bash
docker build -t app_name .
```

#### Run a Container
```bash
docker run -i -t app_name "any_command_and_socket"
```

#### Run a Container with Shell Access
```bash
docker run -t -i app /bin/sh
```

### Cleaning Up

#### Remove Unused Resources
```bash
docker system prune
```
Remove all unused data:
```bash
docker system prune -a
```

#### List and Remove Images
List all images:
```bash
docker images -a
```
Delete all images:
```bash
docker rmi $(docker images -a -q)
```

#### List and Remove Containers
List all containers:
```bash
docker ps -a -f status=exited
```
Remove all exited containers:
```bash
docker rm $(docker ps -a -f status=exited -q)
```

### Running Commands Inside Containers

#### Open a Shell Inside a Container
```bash
docker exec -ti container_id /bin/sh
```

#### Run a Command Inside a Container
```bash
docker exec -ti container_id command_name
```
