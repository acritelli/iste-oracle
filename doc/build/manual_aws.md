# Deploying into AWS using a manual installation procedure

## Overview

These instructions provide the steps necessary to manually install Oracle database in AWS. These instructions are necessary if the provided Ansible script is not used, or if manual installation is simply preferred.

## Basic VM Configuration

1. Disable SELinux by editing `/etc/selinux/config` and restarting.

2. Fully patch the operating system: 
```
yum update -y
```

3. If using CentOS, install the EPEL repository: 
```
yum install -y epel-release
```

4. Install all necessary packages. These include dependencies for Oracle database and tools that are useful for the end user, such as tmux and vim: 
```
yum install -y vim tmux bind-utils net-tools xorg-x11-xauth xorg-x11-apps xorg-x11-utils xorg-x11-fonts-Type1 unzip smartmontools compat-libcap1 libstdc++-devel sysstat gcc-c++ ksh libaio-devel libselinux-python
```

5. Oracle requires a swap space to be created. Check to see if a swap space exists with the `swapon` command. If no swapfile exists, then create one using the instructions [here](https://aws.amazon.com/premiumsupport/knowledge-center/ec2-memory-swap-file/)

6. Enable X11 forwarding in `/etc/ssh/sshd_config`:
```
X11Forwarding yes
X11DisplayOffset 10
```

6. Restart the SSH service for the changes to take effect:
```
systemctl restart sshd
```

7. Create a group for Oracle: 
```
groupadd oinstall
```

7. Create an Oracle user with the primary group oinstall: 
```
useradd -g oinstall oracle
```

8. Ensure that the Xauth file exists for the Oracle user: 
```
touch /home/oracle/.Xauthority
```

9.  Copy the `bash_profile` from the `files` in this repository and place it into the oracle home directory (`/home/oracle/.bash_profile`)

10. Download the Oracle database installation zip file and unzip it. These instructions will assume that it is unzipped to the `files` subdirectory in this repository.

11. Install the `cvuqdisk` package from the Oracle installation media:
```
rpm -Uvh ./files/database/rpm/cvuqdisk-1.0.10-1.rpm
```

12. Set the necessary environment variables for cvuqdisk by editing `/etc/environment` to include the following:
```
CVUQDISK_GRP=oinstall
```

13. Ensure that the `tmpfs` is mounted with RW and Execute options by editing `/etc/fstab` accordingly:
```
ec2-54-210-81-222.compute-1.amazonaws.com
```

14. Oracle database requires that transparent huge pages (THP) be disabled. Copy the `disable-thp.service` script from the `files` directory in this repository to `/etc/systemd/system/disable-thp.service`

15. Enable the thp-disable service:
```
systemctl daemon-reload
systemctl start thp-disable
systemctl enable thp-disable
```

16. THP must also be disabled in tuned. Copy the `tuned.conf` script from the `files` directory in this repository to `/etc/tuned/no-thp/tuned.conf`

17. Update the tuned profile:
```
tuned-adm profile no-thp
```

18. Update the necessary limits in `/etc/security/limits.conf` by ensuring that the lines below are present:
```
oracle  hard  nofile  65536
oracle  hard  nproc  16384
oracle  hard  nproc  16384
oracle  soft  stack  10240
oracle  hard  stack  32768
```

19. Add the necessary Oracle kernel parameters by copying the `97-oracle-database-sysctl.conf` file from the `files` directory in this repository to `/etc/sysctl.d/97-oracle-database-sysctl.conf`

20. Create the necessary Oracle directories:
```
mkdir -p /u01/app/oracle
mkdir -p /u01/app/oraInventory
mkdir -p /u01/app/oracle/product/121.1.2

chown -R oracle:oinstall /u01
```

21. Make the "mountpoint" directories:
```
mkdir -p /u01/oradata
mkdir -p /u02/oradata
mkdir -p /u03/oradata
mkdir -p /u04/oradata
mkdir -p /u05/oradata
mkdir -p /u06/oradata

chown -R oracle:oinstall /u0*
```

22. Run the Oracle installer, completing the installation prompts as appropriate:
```
./files/database/runInstaller
```

23. Run the post installation scripts:
```
/u01/app/oraInventory/orainstRoot.sh
/u01/app/oracle/product/12.2.0/dbhome_1/root.sh
```

24. There's a bug in RHEL/Java that causes the display of the Oracle GUI tools to be garbled. This is resolved by installing a different font package:
```
yum install -y dejavu-serif-fonts
```

25. Transfer all necessary scripts and files to `/home/oracle` and `/u03/labfiles` as appropriate.