# Gunicorn Setup Guide

## Installation

Install Gunicorn using pip:
```bash
sudo pip install gunicorn
```

## Testing Gunicorn

To test if Gunicorn can serve your project:
```bash
gunicorn --bind 0.0.0.0:8000 myproject.wsgi
```

## Gunicorn Configuration File

Create or edit a Gunicorn configuration file (e.g., `gunicorn_conf.py`):
```bash
vim /home/user/project/project/gunicorn_conf.py
```
Example content:
```python
import multiprocessing

command = '/home/name/project/env/bin/gunicorn'
pythonpath = '/home/name/project'
bind = '127.0.0.1:8001'
workers = multiprocessing.cpu_count() * 2 + 1
threads = 2
worker_class = 'gthread'
user = 'user'
limit_request_fields = 32000
limit_request_field_size = 0
raw_env = 'DJANGO_SETTINGS_MODULE=project.settings'
accesslog = '/var/log/gunicorn/access.log'
errorlog = '/var/log/gunicorn/error.log'
loglevel = 'info'
```

### Key Improvements:
- Automatically calculate the number of workers based on available CPUs.
- Added support for threaded workers using `gthread`.
- Configured access and error logs for better monitoring.

## Gunicorn Start Script

Create a script to start Gunicorn (e.g., `start_gunicorn.sh`):
```bash
vim ~/project/bin/start_gunicorn.sh
```
Example content:
```bash
#!/bin/bash
source /home/user/project/env/bin/activate
source /home/user/project/setenv.sh
exec gunicorn -c "/home/user/project/project/gunicorn_conf.py" project.wsgi
```

Make the script executable:
```bash
chmod +x /home/user/project/bin/start_gunicorn.sh
```

## Using Nginx

For production environments, configure Nginx to work with Gunicorn. Example Nginx configuration:
```nginx
server {
    listen 80;
    server_name yourdomain.com;

    location / {
        proxy_pass http://127.0.0.1:8001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

## Using Systemd (Recommended)

### Step 1: Create a Systemd Service File
```bash
sudo vim /etc/systemd/system/gunicorn.service
```
Example content:
```ini
[Unit]
Description=gunicorn daemon
After=network.target

[Service]
User=user
Group=group
WorkingDirectory=/home/user/project
ExecStart=/home/user/project/env/bin/gunicorn --workers 3 --bind unix:/home/user/project/gunicorn.sock project.wsgi:application

[Install]
WantedBy=multi-user.target
```

### Step 2: Start and Enable Gunicorn
Start:
```bash
sudo systemctl start gunicorn
```
Enable:
```bash
sudo systemctl enable gunicorn
```

## Using Supervisor (Optional)

Though Systemd is the recommended way, Supervisor can be used to manage Gunicorn processes:

1. Install Supervisor:
   ```bash
   sudo apt install supervisor
   ```

2. Create a Supervisor configuration file for your project:
   ```bash
   vim /etc/supervisor/conf.d/myproject.conf
   ```
   Example content:
   ```ini
   [program:gunicorn]
   command=/home/name/project/bin/start_gunicorn.sh
   user=username
   process_name=%(program_name)s
   numprocs=1
   autostart=true
   autorestart=true
   redirect_stderr=true
   ```

3. Manage Supervisor:

   Stop:
   ```bash
   sudo service supervisor stop
   ```
   Start:
   ```bash
   sudo service supervisor start
   ```
   Reread:
   ```bash
   sudo supervisorctl reread
   ```
   Update:
   ```bash
   sudo supervisorctl update
   ```
   Rrestart all:
   ```bash
   sudo supervisorctl restart all
   ```