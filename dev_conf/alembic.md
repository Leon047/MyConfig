# Flask-Alembic Setup Guide

## Installation

### Step 1: Install Flask-Alembic
```bash
pip install Flask-Alembic
```

### Step 2: Create Alembic Configuration File

Create a configuration file for Alembic (usually named `alembic.ini`) in the root directory of your project. Below is an example of the `alembic.ini` file content:

<pre>
# alembic.ini
[alembic]
script_location = alembic

# Database connection string:
# sqlalchemy.url = driver://user:pass@localhost/dbname
sqlalchemy.url = sqlite:///your_database.db
</pre>

Replace `sqlite:///your_database.db` with your database connection URL.

### Step 3: Configure Flask-Alembic

Set up Flask-Alembic in your Flask application:

<pre>
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_alembic import Alembic

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///your_database.db'
db = SQLAlchemy(app)
alembic = Alembic()
alembic.init_app(app)
</pre>

Replace `'sqlite:///your_database.db'` with your database connection URL.

## Usage

### Create a New Migration
To generate a new migration, run the following command:
```bash
flask db migrate -m "Migration message"
```

### Apply Migrations
To apply the latest migrations, use:
```bash
flask db upgrade
```

### Rollback the Last Migration
To undo the last migration, use:
```bash
flask db downgrade
```