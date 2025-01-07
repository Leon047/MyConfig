# PostgreSQL Setup and Usage Guide

## Installation

### Install PostgreSQL
Install the PostgreSQL server:
```bash
sudo apt install postgresql
```

Alternatively, install the server with development headers:
```bash
sudo apt install postgresql postgresql-server-dev-9.5
```

## Basic Setup

### Open the PostgreSQL Console
Open the PostgreSQL interactive terminal:
```bash
sudo -u postgres psql postgres
```

Alternatively:
```bash
psql
```

### Create a User
Create a new PostgreSQL user:
```sql
CREATE USER user_name WITH PASSWORD 'password';
ALTER ROLE user_name SET client_encoding TO 'utf8';
ALTER ROLE user_name SET default_transaction_isolation TO 'read committed';
ALTER ROLE user_name SET timezone TO 'UTC';
```

### Create a Database
Create a database owned by the new user:
```sql
CREATE DATABASE django_db OWNER user_name;
```

Grant additional privileges to the user:
```sql
GRANT ALL PRIVILEGES ON DATABASE django_db TO user_name;
```

## Usage Examples

### Restart PostgreSQL Service
Restart the PostgreSQL service:
```bash
sudo /etc/init.d/postgresql restart
```

### List Databases
View all databases:
```sql
\list
```

### Connect to a Database
Connect to a specific database:
```sql
\connect your_DB
```

### List Tables
List all tables in the current database:
```sql
\dt
```

### List Users
View all users:
```sql
\du
```

## Python Integration

### Install PostgreSQL Adapter for Python
Install the `psycopg2` adapter for PostgreSQL:
```bash
pip install psycopg2
```

Alternatively, install the binary version:
```bash
pip install psycopg2-binary
```

## Backup and Restore

### Create a SQL Dump
Use `pg_dump` to create a backup of your database:
```bash
pg_dump -h host -p port -U db_user db_name > file_name.sql
```

### Load a SQL Dump
Restore a database from a dump file:
```bash
psql -h hostname -d databasename -U username -f file.sql
```