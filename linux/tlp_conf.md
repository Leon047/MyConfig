# TLP: Power Management for Laptop Batteries


## Installation

1. To install TLP on your system:
```bash
sudo add-apt-repository ppa:linrunner/tlp
```
2.
```bash
sudo apt-get update
```
3.
```bash
sudo apt-get install tlp tlp-rdw
```

## Configuration Files

TLP settings can be edited in:
- `/etc/default/tlp`
- `/etc/tlp.conf`

## Starting TLP

Start the TLP service:
```bash
sudo tlp start
```

## Check TLP Status

To verify if TLP is running:
```bash
sudo systemctl status tlp
```

## System Information

### General System Info
```bash
sudo tlp-stat -s
```

### PCI Devices Info
```bash
sudo tlp-pcilist
```

### USB Devices Info
```bash
sudo tlp-usblist
```

### Display Current Configuration
```bash
sudo tlp-stat -c
```

### Display All System Information
```bash
sudo tlp-stat
```

### Thermal Information
```bash
sudo tlp-stat -t
```

### Processor Information
```bash
sudo tlp-stat -p
```

### Battery Information
```bash
sudo tlp-stat -b
```

To continuously monitor battery information:
```bash
watch sudo tlp-stat -b
```