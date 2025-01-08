# Nginx Setup and Configuration Guide

## Installation

### Install Nginx
```bash
sudo apt update
sudo apt install nginx -y
```

### Start and Enable Nginx
Start and enable Nginx to run on system boot:
```bash
sudo systemctl start nginx
sudo systemctl enable nginx
```

### Check Nginx Status
Verify the status of Nginx:
```bash
sudo systemctl status nginx
```

## Basic Configuration

### Default Server Block
Edit the default server block configuration:
```bash
sudo vim /etc/nginx/sites-available/default
```
Example configuration:
```nginx
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name _;
    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

### Test Nginx Configuration
Test for syntax errors:
```bash
sudo nginx -t
```

### Reload Nginx
Apply configuration changes:
```bash
sudo systemctl reload nginx
```

## Adding a New Server Block

### Create a New Configuration File
Create a configuration file for your domain:
```bash
sudo vim /etc/nginx/sites-available/example.com
```
Example content:
```nginx
server {
    listen 80;
    listen [::]:80;

    server_name example.com www.example.com;
    root /var/www/example.com;

    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

### Enable the Server Block
Create a symbolic link to enable the configuration:
```bash
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
```

### Restart Nginx
Restart Nginx to apply the changes:
```bash
sudo systemctl restart nginx
```

## Advanced Configuration

### Gzip Compression
Enable Gzip compression for improved performance:
```bash
sudo vim /etc/nginx/nginx.conf
```
Add the following under the `http` block:
```nginx
gzip on;
gzip_disable "msie6";
gzip_vary on;
gzip_proxied any;
gzip_comp_level 6;
gzip_buffers 16 8k;
gzip_http_version 1.1;
gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
```

### Access and Error Logs
Customize log paths:
```nginx
access_log /var/log/nginx/example.com.access.log;
error_log /var/log/nginx/example.com.error.log;
```

## Secure Nginx with SSL

### Install Certbot
Follow instructions to install Certbot:
```bash
sudo apt install certbot python3-certbot-nginx -y
```

### Obtain SSL Certificates
Generate SSL certificates for your domain:
```bash
sudo certbot --nginx -d example.com -d www.example.com
```

### Automatic Renewal
Set up automatic certificate renewal:
```bash
sudo systemctl enable certbot.timer
```
Test the renewal process:
```bash
sudo certbot renew --dry-run
```