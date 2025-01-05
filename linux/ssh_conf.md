# Configuring SSH

## Step 1: SSH Keys

### Default SSH Key Files
In the `~/.ssh` directory, look for the following files:
- `id_dsa` / `id_dsa.pub`
- `id_rsa` / `id_rsa.pub`

The `.pub` file is the public key, and the other file is the private key.

### Generating SSH Keys
If these files are missing (or the `.ssh` directory doesn't exist):
```bash
ssh-keygen
```

Or generate an RSA key with specific parameters:
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

To change the password on an existing key:
```bash
ssh-keygen -p
```
The program will ask for the location of the key file (e.g., `.ssh/id_rsa`).

#### Password Management
- To avoid entering a password each time, leave the password empty or use `ssh-agent`.
- If using a password, it is recommended to include the `-o` option for enhanced security.

#### Sharing Public Keys
Each user must share their public key (`.pub` file) with the server administrator. The contents of the public key file can be copied and sent via email.


## Step 2: SSH Agent

### Enable SSH Agent
Start the SSH agent:
```bash
eval $(ssh-agent -s)
```

### Authorize SSH Keys
Add a private key to the SSH agent:
```bash
ssh-add ~/.ssh/id_rsa
```

### Verify Keys
List added keys:
```bash
ssh-add -l
```

### Remove All Keys
```bash
ssh-add -D
```

## SSH Server Configuration

### Add SSH Keys to Server
Add the public key to the server:
```bash
.ssh/authorized_keys
```

### Using a Non-Standard Port
Copy the key to a server on a specific port:
```bash
ssh-copy-id '-p 443 user@server'
```

### General Key Copy
```bash
ssh-copy-id SERVER_NAME
```
The program will prompt for login and password.

### Disable Password Authentication
Edit the SSH server configuration file:
```bash
sudo vim /etc/ssh/sshd_config
```
Restart the SSH service:
```bash
sudo service ssh restart
```

## SSH Aliases

### Simplify SSH Commands
Edit the SSH configuration file:
```bash
vim ~/ssh/config
```

### Example Alias Configuration
```plaintext
Host alias
    Hostname alias.host_name
    User user_name
    Port 22
```

To log in as root:
```bash
ssh -o "User=root" alias
```

## Using SSH with Git

### Check Remote URL
```bash
git remote -v
```

### Switch from HTTPS to SSH
```bash
git remote set-url origin git_ssh
```