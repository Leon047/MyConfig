# Configuring UFW (Uncomplicated Firewall)

## Steps to Configure UFW

### Open Configuration Directory
```bash
sudo vim /etc/default/ufw
```

### Check the Status of UFW
```bash
sudo ufw status
```

For a verbose status report:
```bash
sudo ufw status verbose
```

### Enable or Disable UFW
To enable UFW with the default rules:
```bash
sudo ufw enable
```

To disable UFW:
```bash
sudo ufw disable
```

### List Available Applications
```bash
sudo ufw app list
```

> Note: By default, incoming connections are denied, with exceptions outlined in the output of:
```bash
sudo ufw show raw
```

### Set Default Policies
Deny incoming connections and allow outgoing:
```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

### Allow Connections
Allow common services:

# Port 22
```bash
sudo ufw allow ssh
```
# Port 80
```bash  
sudo ufw allow http
```
# Port 443
```bash
sudo ufw allow https     
```

Allow connections from a specific IP:
```bash
sudo ufw allow from 203.0.113.4 to any port 22
```

Allow a range of ports:
```bash
sudo ufw allow 6000:6007/tcp
```
or

```bash
sudo ufw allow 6000:6007/udp
```

### Deny Connections
Deny a specific service:
```bash
sudo ufw deny <name>
```

### Delete Rules
To delete an allowed or denied rule:

Allow
```bash
sudo ufw delete allow <name>
```
Deny
```bash
sudo ufw delete deny <name>
```

### Reset Rules
Check rules by number:
```bash
sudo ufw status numbered