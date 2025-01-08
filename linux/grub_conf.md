# Configuring GRUB Bootloader

To enable the selection of operating systems during computer boot, you need to configure the bootloader. In Linux, GRUB is the default bootloader, which can be set up to allow OS selection at boot time.

## Steps to Configure GRUB

1. **Open the GRUB configuration file:**
   ```bash
   sudo vim /etc/default/grub
   ```

2. **Set the timeout for the OS selection menu:**
   Locate the line `GRUB_TIMEOUT` and set the desired time (in seconds). For example:
   ```bash
   GRUB_TIMEOUT=10
   ```

3. **Update the GRUB configuration:**
   ```bash
   sudo update-grub
   ```

### Troubleshooting

If changing `GRUB_TIMEOUT` does not make the OS selection menu appear, the following steps might help:

- Ensure both operating systems are installed on separate disk partitions.
- Verify that both operating systems are installed in the same boot mode (either UEFI or BIOS). Different modes prevent visibility between systems.

#### Check if GRUB detects another OS:
```bash
sudo os-prober
```

If no results are returned, GRUB may not recognize the other operating system.

#### Reinstall GRUB:
```bash
sudo grub-install /dev/sda
```
*Assuming GRUB is installed on the hard drive `/dev/sda`.*

#### Verify GRUB configuration:
Open the GRUB configuration file to check if it includes Windows:
```bash
sudo vim /boot/grub/grub.cfg
```

### Manually Add Windows Configuration

If `sudo os-prober` detects Windows but `sudo grub-mkconfig -o /boot/grub/grub.cfg` does not add it to GRUB, you may need to modify `/etc/grub.d/40_custom` to include Windows.

1. **Edit the `40_custom` file:**
   ```bash
   sudo vim /etc/grub.d/40_custom
   ```

2. **Add the following lines:**
   ```bash
   menuentry "Windows 10" {
       search --set=root --fs-uuid XXXX-XXXX  # Replace XXXX-XXXX with the UUID of the Windows partition
       chainloader /EFI/Microsoft/Boot/bootmgfw.efi
   }
   ```

3. **Find the UUID of the Windows partition:**
   ```bash
   sudo blkid
   ```

4. **Update GRUB:**
   ```bash
   sudo update-grub
   ```

## Fix Dual-Boot Issues

To repair dual-boot configurations, you can use the `boot-repair` tool:

1. Add the Boot Repair repository:
   ```bash
   sudo add-apt-repository ppa:yannubuntu/boot-repair
   ```

2. Update the package list:
   ```bash
   sudo apt update
   ```

3. Install and run Boot Repair:
   ```bash
   sudo apt install -y boot-repair && boot-repair