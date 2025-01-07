# MongoDB Setup Guide

## Step 1: Import the MongoDB Public Key

For Ubuntu systems, import the MongoDB GPG key to verify downloads:
```bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
```
> **Note:** If you encounter invalid signatures, the `--recv` value may need updating to `EA312927`. Refer to the [StackOverflow discussion](https://stackoverflow.com/questions/34733340/mongodb-gpg-invalid-signatures) for more details.

## Step 2: Add MongoDB Repository

Add the MongoDB repository to your APT sources:
```bash
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
```

Refresh the local package database:
```bash
sudo apt-get update
```

## Step 3: Install MongoDB

Install the official MongoDB package:
```bash
sudo apt install -y mongodb-org
```

Alternatively, you can install the unofficial Ubuntu package:
```bash
sudo apt install -y mongodb
```
> **Warning:** Unofficial Ubuntu packages may conflict with the official MongoDB packages.

## Step 4: Start and Manage MongoDB Service

### Start MongoDB
Start the MongoDB service:
```bash
sudo systemctl start mongod
```

### Check Status
Verify that MongoDB is running:
```bash
sudo systemctl status mongod
```

### Stop MongoDB
Stop the service when needed:
```bash
sudo systemctl stop mongod
```

### Restart MongoDB
Restart the MongoDB service:
```bash
sudo systemctl restart mongod
```

### Enable/Disable Auto-Start
Enable MongoDB to start on boot:
```bash
sudo systemctl enable mongod
```
Disable auto-start on boot:
```bash
sudo systemctl disable mongod
```

## Install MongoDB Compass (Optional)

Download and install MongoDB Compass for a graphical interface:
```bash
wget https://downloads.mongodb.com/compass/mongodb-compass_1.24.1_amd64.deb
sudo dpkg -i mongodb-compass_1.24.1_amd64.deb
```

## Python Integration with PyMongo

### Install PyMongo
Install the PyMongo driver for MongoDB:
```bash
pip install pymongo
```

### Install dnspython
For using `mongodb+srv://` URIs:
```bash
pip install dnspython
```

## Usage Notes

### Check MongoDB Connection
Run the following command to verify the connection:
```bash
mongo --eval 'db.runCommand({ connectionStatus: 1 })'
```