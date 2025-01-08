# Server Management and Networking Guide

## Networking

### Check Current Connections
List current connections and their states:
```bash
netstat -tuln
```

Display network interfaces and their IPs:
```bash
ip addr
```

Ping a host to check connectivity:
```bash
ping example.com
```

Traceroute to analyze network paths:
```bash
traceroute example.com
```

### Manage Firewall Rules
List current firewall rules:
```bash
sudo iptables -L -v -n
```

Add a rule to allow SSH:
```bash
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

Save rules permanently:
```bash
sudo iptables-save > /etc/iptables/rules.v4
```

## File and Archive Management

### Create a Compressed Archive
Compress a directory into a tar.gz archive:
```bash
tar -czvf archive_name.tar.gz /path/to/directory
```

Extract a tar.gz archive:
```bash
tar -xzvf archive_name.tar.gz
```

List contents of a tar.gz archive:
```bash
tar -tzvf archive_name.tar.gz
```

### Copy Files Securely
Copy a file to a remote server using SCP:
```bash
scp /path/to/local/file user@remote_host:/path/to/remote/destination
```

Copy a directory to a remote server:
```bash
scp -r /path/to/local/directory user@remote_host:/path/to/remote/destination
```

Retrieve a file from a remote server:
```bash
scp user@remote_host:/path/to/remote/file /path/to/local/destination
```

## Process Management

### View Running Processes
List running processes:
```bash
ps aux
```

Filter processes by name:
```bash
ps aux | grep process_name
```

### Manage Processes
Kill a process by PID:
```bash
kill PID
```

Force kill a process:
```bash
kill -9 PID
```