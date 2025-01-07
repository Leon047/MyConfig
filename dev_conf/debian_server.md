# Debian Server Setup for Django

## Step 1: Create a New User

Create a new user and grant sudo privileges:

```bash
adduser user_name
```
```bash
usermod -aG sudo user_name
```
```bash
su - user_name
```

Update and install essential packages:
```bash
sudo apt update
sudo apt install -y vim mosh zsh tmux ufw htop git curl wget unzip zip gcc build-essential make
```

## Step 2: Configure SSH

Edit the SSH configuration file:
```bash
sudo vim /etc/ssh/sshd_config
```

Add the following settings:
```plaintext
AllowUsers user_name
PermitRootLogin no
PasswordAuthentication no
```

Create the `.ssh` directory and add the public SSH key:
```bash
mkdir -p /home/user_name/.ssh && touch /home/user_name/.ssh/authorized_keys
```

```bash
vim .ssh/authorized_keys
```

Restart the SSH server and set a password for the new user:
```bash
sudo service ssh restart
```

```bash
sudo passwd user_name
```

## Step 3: Configure UFW (Firewall)

Edit the UFW configuration file:
```bash
sudo vim /etc/default/ufw
```

Allow necessary connections:

Port-22:
```bash
sudo ufw allow ssh
```
Port-80:
```bash
sudo ufw allow http
```
Port-443:
```bash
sudo ufw allow https
```
Port for mosh:
```bash
sudo ufw allow 60001
sudo ufw allow 60002
sudo ufw allow 60003
```

Enable UFW:
```bash
sudo ufw enable
```

## Step 4: Install Oh-My-Zsh

Install and configure Zsh:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
```

Add custom configurations to `.zshrc`:
```bash
export PATH=$PATH:/home/user_name/.python/bin
```

Set locale settings for Mosh compatibility:
```bash
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
```

## Step 5: Install Required Packages

Install essential development tools:
```bash
sudo apt install -y tree redis-server zlib1g-dev libbz2-dev libreadline-dev llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev liblzma-dev python3-dev python3-lxml libxslt-dev python3-imaging libffi-dev libssl-dev gnumeric libsqlite3-dev libpq-dev libjpeg-dev libfreetype6-dev libcurl4-openssl-dev supervisor
```

## Step 6: Install Python 3.11

Install `Python 3.11` using the deadsnakes PPA for simplicity:
```bash
sudo apt update
sudo apt install -y software-properties-common
```
```bash
sudo add-apt-repository ppa:deadsnakes/ppa
```
```bash
sudo apt update
sudo apt install -y python3.11 python3.11-venv python3.11-dev
```

Set `Python 3.11` as the default if necessary:
```bash
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
```

Upgrade pip:
```bash
python3.11 -m pip install -U pip
```
