# Virtualenv/Virtualenvwrapper

## Step 1: Create a Directory for Virtual Environments
```bash
cd
mkdir .virtualenvs
```

## Step 2: Install Required Tools

### Install pip3
```bash
sudo apt install python3-pip
```

### Install virtualenv
```bash
sudo pip3 install virtualenv
```

### Install virtualenvwrapper
```bash
sudo pip3 install virtualenvwrapper
```

## Step 3: Configure Virtualenvwrapper

### Locate the `virtualenvwrapper.sh` File
```bash
which virtualenvwrapper.sh
```

Or search for the file:
```bash
sudo find / -name virtualenvwrapper.sh 2>/dev/null
```

### Add Configuration to `.bashrc` or `.zshrc`
Add the following lines to configure Virtualenvwrapper:
```bash
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
source /path_to/virtualenvwrapper.sh
```

### Restart Shell Configuration File
```bash
source ~/.bashrc
```

## Using Virtualenv and Virtualenvwrapper

### List Available Virtual Environments
```bash
workon
```

### Create a New Virtual Environment
```bash
mkvirtualenv venv_name
```
Or specify a Python version:
```bash
mkvirtualenv virtenv_name -p /usr/bin/python3
```

### Create a Virtual Environment with a Project Directory
```bash
mkproject project_name
```

### Activate a Virtual Environment
```bash
workon virtenv_name
```

### Deactivate a Virtual Environment
```bash
deactivate
```

### Delete a Virtual Environment
```bash
rmvirtualenv venv_name
```