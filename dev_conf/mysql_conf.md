              			---=== MySQL ===---


# -- Install --
# 1
```
sudo apt install mysql-server -y
```

# 2
```
sudo apt install libmysqlclient-dev
```

# 3
```
sudo apt install -y python3-mysqldb
```

# 4 / start and enable the server with the command:
```
sudo systemctl enable --now mysql 
```

# add password 
```
sudo mysql_secure_installation
```

# install in env
```
pip install pymysql
```


# -- Create -- 
# 1
```
sudo mysql -u root -p
```

# 2
```
CREATE DATABASE dbname;
```

# 3
```
SHOW DATABASES;
```

# 4
```
USE dbname;
```

# 5
```
ALTER USER 'root'@'localhost' IDENTIFIED BY 'dbpassword';
```

# or

# write password, four or more only letters.
```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'new-password';
```

# DB URI
```
SQLALCHEMY_DATABASE_URI='mysql+pymysql://root:abc123@0.0.0.0/dbname'
```

# Restart mysql
```
service mysql restart
```



# MySQL Optimization Guide

This document provides a detailed guide on optimizing MySQL configuration for high performance and stability in production environments. Properly configuring MySQL is essential for ensuring fast, reliable, and consistent performance.

## Table of Contents
- [1. Memory Settings](#1-memory-settings)
  - [`innodb_buffer_pool_size`](#innodbbufferpoolsize)
  - [`innodb_log_buffer_size`](#innodblogbuffersize)
  - [`query_cache_size`](#querycachesize)
  - [`tmp_table_size` and `max_heap_table_size`](#tmptablesize-and-maxheaptablesize)
- [2. Connection Settings](#2-connection-settings)
  - [`max_connections`](#maxconnections)
  - [`wait_timeout` and `interactive_timeout`](#waittimeout-and-interactivetimeout)
  - [`thread_cache_size`](#threadcachesize)
- [3. InnoDB Settings](#3-innodb-settings)
  - [`innodb_file_per_table`](#innodbfilepertable)
  - [`innodb_flush_log_at_trx_commit`](#innodbflushlogattrxcommit)
  - [`innodb_flush_method`](#innodbflushmethod)
- [4. Logging and Diagnostics](#4-logging-and-diagnostics)
  - [`slow_query_log`](#slowquerylog)
  - [`log_error`](#logerror)
  - [`general_log`](#generallog)
- [5. Disk I/O Optimization](#5-disk-io-optimization)
  - [`innodb_io_capacity`](#innodbio_capacity)
  - [`sync_binlog`](#syncbinlog)
- [6. Caching and Buffering](#6-caching-and-buffering)
  - [`table_open_cache`](#tableopencache)
  - [`read_buffer_size` and `read_rnd_buffer_size`](#readbuffersize-and-readrndbuffersize)
- [7. Automation and Tools](#7-automation-and-tools)
- [8. Testing Changes Gradually](#8-testing-changes-gradually)

## 1. Memory Settings

### `innodb_buffer_pool_size`
- **Description:** Defines the size of the memory buffer used by InnoDB for caching data and indexes.
- **Recommendation:** Set this to 70-80% of the available RAM for a dedicated MySQL server.
- **Example:**
  ```ini
  innodb_buffer_pool_size = 4G
  ```

### `innodb_log_buffer_size`
- **Description:** Size of the buffer for transaction logs.
- **Recommendation:** Increase this to 16M or more if your server performs a lot of write-intensive operations.
- **Example:**
  ```ini
  innodb_log_buffer_size = 16M
  ```

### `query_cache_size` (MySQL 5.7 and below)
- **Description:** Cache for SELECT query results.
- **Recommendation:** Generally, set this to `0` since query caching can become a bottleneck as load increases.
- **Example:**
  ```ini
  query_cache_size = 0
  query_cache_type = 0
  ```

### `tmp_table_size` and `max_heap_table_size`
- **Description:** Limit the size of in-memory temporary tables.
- **Recommendation:** Increase these to 64M or more to minimize disk-based temporary tables.
- **Example:**
  ```ini
  tmp_table_size = 64M
  max_heap_table_size = 64M
  ```

## 2. Connection Settings

### `max_connections`
- **Description:** Maximum number of simultaneous client connections.
- **Recommendation:** Set depending on your load. Start with 200-300 and adjust as needed.
- **Example:**
  ```ini
  max_connections = 300
  ```

### `wait_timeout` and `interactive_timeout`
- **Description:** Time to wait before closing inactive connections.
- **Recommendation:** Set a low value (e.g., 30-60 seconds) to free up resources.
- **Example:**
  ```ini
  wait_timeout = 60
  interactive_timeout = 60
  ```

### `thread_cache_size`
- **Description:** Number of threads to keep in the cache for reuse.
- **Recommendation:** Set between 8-16 for busy servers.
- **Example:**
  ```ini
  thread_cache_size = 16
  ```

## 3. InnoDB Settings

### `innodb_file_per_table`
- **Description:** Each table has its own `.ibd` file.
- **Recommendation:** Enable this for better table space management.
- **Example:**
  ```ini
  innodb_file_per_table = 1
  ```

### `innodb_flush_log_at_trx_commit`
- **Description:** Controls how often transaction logs are written to disk.
- **Recommendation:**
  - `1` ensures maximum reliability (write at every commit).
  - `2` or `0` can increase performance but reduce reliability.
- **Example:**
  ```ini
  innodb_flush_log_at_trx_commit = 1
  ```

### `innodb_flush_method`
- **Description:** Defines the method for writing data to disk.
- **Recommendation:** Use `O_DIRECT` to bypass OS cache.
- **Example:**
  ```ini
  innodb_flush_method = O_DIRECT
  ```

## 4. Logging and Diagnostics

### `slow_query_log`
- **Description:** Logs slow queries for analysis.
- **Recommendation:** Enable it to identify and optimize slow queries.
- **Example:**
  ```ini
  slow_query_log = 1
  slow_query_log_file = /var/log/mysql-slow.log
  long_query_time = 2
  ```

### `log_error`
- **Description:** Path for logging errors.
- **Example:**
  ```ini
  log_error = /var/log/mysql-error.log
  ```

### `general_log`
- **Description:** Logs all queries (use only for debugging).
- **Example:**
  ```ini
  general_log = 0
  general_log_file = /var/log/mysql-general.log
  ```

## 5. Disk I/O Optimization

### `innodb_io_capacity`
- **Description:** Defines the maximum I/O operations per second.
- **Recommendation:** Set based on disk capabilities (e.g., 200 for HDD, 1000+ for SSD).
- **Example:**
  ```ini
  innodb_io_capacity = 1000
  ```

### `sync_binlog`
- **Description:** Controls how often binary logs are synced to disk.
- **Recommendation:** Set `1` for reliability or `0` for performance.
- **Example:**
  ```ini
  sync_binlog = 1
  ```

## 6. Caching and Buffering

### `table_open_cache`
- **Description:** Maximum number of simultaneously open tables.
- **Recommendation:** Increase to 2000 or more if many tables are used frequently.
- **Example:**
  ```ini
  table_open_cache = 2000
  ```

### `read_buffer_size` and `read_rnd_buffer_size`
- **Description:** Sizes of buffers for reading operations.
- **Recommendation:** Increase to improve sequential and random read performance.
- **Example:**
  ```ini
  read_buffer_size = 1M
  read_rnd_buffer_size = 4M
  ```

## 7. Automation and Tools
- Use tools like **Percona Toolkit** for configuration audits.
- Monitor parameters using **Percona Monitoring and Management (PMM)** or **Prometheus**.

## 8. Testing Changes Gradually
- Always test configuration changes in a staging environment.
- Benchmark performance using tools like **sysbench** before applying changes in production.

---

Properly configuring MySQL can greatly enhance database efficiency and stability. Start with these settings, and gradually fine-tune them based on your workload and hardware. If you have specific requirements or encounter challenges, feel free to reach out for more guidance!
