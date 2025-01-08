# Django Setup Guide

## Installation

To install Django:
```bash
pip install django --upgrade
```

## Starting a New Project

Create a new Django project:
```bash
python -m django startproject project_name
```

## Creating an App

To create a new Django app:
```bash
python manage.py startapp app_name
```

## Database Migrations

Generate migration files for database changes:
```bash
python manage.py makemigrations
```

Apply the migrations:
```bash
python manage.py migrate
```

## Running the Development Server

Start the development server:
```bash
python manage.py runserver
```

## Creating a Superuser

Create a superuser for accessing the Django admin panel:
```bash
python manage.py createsuperuser
```

## Using the Django Shell

Open the interactive Django shell:
```bash
python manage.py shell
```

## Configuring the Database

Modify the `DATABASES` section in `settings.py` to configure your database:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'django_db',
        'USER': 'user_name',
        'PASSWORD': 'password',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}
```

## Setting Up Templates

Configure the `TEMPLATES` section in `settings.py` to include your template directory:
```python
TEMPLATES = [
    {
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
    }
]
```

Use the `{% extends 'index.html' %}` tag to extend templates.

## Managing Static Files

Configure static file settings in `settings.py`:
```python
STATIC_URL = '/static/'
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'static')
]
```

In your HTML files, load static files:
```html
{% load static %}
<link rel="stylesheet" href="{% static 'css/home_page.css' %}">
```

## Database Dumps and Imports

### Dump the Entire Database
```bash
python manage.py dumpdata --indent 2 > db.json
```

### Dump Specific App Models
```bash
python manage.py dumpdata --indent 2 admin > admin.json
```

### Dump Specific Tables
```bash
python manage.py dumpdata --indent 2 admin.logentry > admin_logentry.json
```

### Exclude Specific Tables
```bash
python manage.py dumpdata --indent 2 --exclude auth.permission > db.json
```

### Import Data
Restore data from a dump file:
```bash
python manage.py loaddata db.json
```

### Handling Integrity Errors
Exclude `contenttypes` and `auth.permissions` when dumping data:
```bash
python manage.py dumpdata --exclude auth.permission --exclude contenttypes > db.json
```