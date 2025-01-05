# Configuring Python `pip`


## Creating a `requirements.txt` File

1. Generate a list of installed packages:
   ```bash
   pip freeze
   ```

2. Save the list to `requirements.txt`:
   ```bash
   pip freeze > requirements.txt
   ```

3. To include only local packages:
   ```bash
   pip freeze --local
   ```

## Upgrading the `requirements.txt` File

1. Install the `pip-tools` package:
   ```bash
   pip install pip-tools
   ```

2. Update dependencies with:
   ```bash
   pip-dump
   ```

## Installing from `requirements.txt`

To install dependencies listed in the `requirements.txt` file:
```bash
pip install -r requirements.txt
```