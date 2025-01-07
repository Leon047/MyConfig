# MySQL Setup and Optimization Guide

## Installation

### Step 1: Install MySQL Server
Install the MySQL server:
```bash
sudo apt install mysql-server -y
```

### Step 2: Install Development Libraries
```bash
sudo apt install libmysqlclient-dev
```

### Step 3: Install Python MySQL Libraries
```bash
sudo apt install -y python3-mysqldb
```

### Step 4: Start and Enable MySQL Service
Start the MySQL service and enable it on boot:
```bash
sudo systemctl enable --now mysql
```

### Step 5: Secure MySQL Installation
Set a root password and secure the installation:
```bash
sudo mysql_secure_installation
```

### Step 6: Install PyMySQL for Python
Install PyMySQL to use MySQL with Python:
```bash
pip install pymysql
```

## Basic Database Management

### Login to MySQL
Log in to the MySQL CLI as root:
```bash
sudo mysql -u root -p
```

### Create a Database
```sql
CREATE DATABASE dbname;
```

### View All Databases
```sql
SHOW DATABASES;
```

### Select a Database
```sql
USE dbname;
```

### Change Root Password
```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'dbpassword';
```

Or use the native password method:
```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'new-password';
```

### SQLAlchemy Database URI
```python
SQLALCHEMY_DATABASE_URI='mysql+pym
```