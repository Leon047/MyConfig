# LetsEncrypt SSL Setup Guide

## Obtaining a Certificate

### Certbot Installation
Follow the instructions on [Certbot's official website](https://certbot.eff.org/) to obtain the correct setup for your system.

For Ubuntu, install Certbot using:
```bash
sudo apt install software-properties-common
```
```bash
sudo add-apt-repository ppa:certbot/certbot-build
```
```bash
sudo apt update
sudo apt install python-certbot-nginx
```

### Generate Strong Diffie-Hellman Parameters
Create a strong Diffie-Hellman key:
```bash
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 4096
```

### Create SSL Snippet
Create a snippet for SSL parameters:
```bash
sudo vim /etc/nginx/snippets/ssl-params.conf
```
Add the following:
```nginx
ssl_session_timeout 1d;
ssl_session_cache shared:SSL:10m;
ssl_session_tickets off;

ssl_dhparam /etc/ssl/certs/dhparam.pem;

ssl_protocols TLSv1.3;
ssl_ciphers ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305;
ssl_prefer_server_ciphers off;

add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload" always;
```

### Obtain SSL Certificate
Run Certbot to generate an SSL certificate:
```bash
sudo certbot --nginx certonly
```

## Nginx and SSL Configuration

### Redirect HTTP to HTTPS
Edit your Nginx configuration file:
```bash
sudo vim /etc/nginx/sites-available/example.com.conf
```
Add the following:
```nginx
server {
    listen 80;
    listen [::]:80;

    server_name example.com www.example.com;
    return 301 https://example.com$request_uri;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    server_name www.example.com;
    return 301 https://example.com$request_uri;

    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/example.com/chain.pem;

    include snippets/ssl-params.conf;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    server_name example.com;

    location = /favicon.ico { access_log off; log_not_found off; }
    location /static/ {
        root /home/mrleon/workDir; 
    }

    location / {
        proxy_pass unix:/var/run/myapp.sock;
        proxy_set_header X-Forwarded-Host $server_name;    
        proxy_set_header X-Real-IP $remote_addr;
        add_header P3P 'CP="ALL IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT"';
        add_header Access-Control-Allow-Origin *; 
    }

    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/example.com/chain.pem;

    include snippets/ssl-params.conf;
}
```

### Restart Nginx
Restart Nginx to apply changes:
```bash
sudo systemctl restart nginx
```