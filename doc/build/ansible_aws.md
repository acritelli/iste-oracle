# Deploying into AWS using the provided Ansible script

## Overview

An Ansible automation script is provided in this repository to deploy Oracle Database 12c Release 2. The following documentation provides the steps necessary to run this script in AWS.

This script has been tested locally on CentOS 7 and in AWS using the Amazon Linux version specified in [this documentation](./create_instance.md)

## Pre-flight configuration

The steps below are necessary to sufficiently bootstrap the AMI so that Ansible can run.

1. Log in as the `ec2-user`
2. Install git: `sudo yum install -y git`
3. Install Ansible. At time of writing, Ansible was only available in Amazon Linux via the Python package manager (pip): 
  * `sudo yum install -y python-pip`
  * `sudo pip install ansible`
4. Clone the repository. It's recommended that this be done in `/tmp` to avoid permissions issue with the Oracle installer, which must run as the `oracle` user. The rest of htese instructions assume that you are working from `/tmp`
  * `cd /tmp`
  * `git clone https://github.com/acritelli/iste-oracle.git`
5. If the distribution being used doesn't have a swapfile, then create one using the instructions [here](https://aws.amazon.com/premiumsupport/knowledge-center/ec2-memory-swap-file/)

## Upload Oracle 12c

The Oracle 12c installer must be downloaded and placed into the appropriate directory so that Ansible can call it.

1. Download Oracle 12c Release 2 from the [official Oracle website](https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html)
  * Download the Linux x86-64 zip file
2. Upload the zip file to the instance
3. Unzip the file: `unzip linuxx64_12201_database.zip`
4. Move the database directory to the "files" directory in the Ansilbe repository.
  * `mv database /tmp/iste-oracle/files/database`

# Run the script

The ansible script can now be run: `sudo ansible-playbook deployOracle.yml`

# Cleanup

1. Delete the ansible directory: `rm -rf /tmp/iste-oracle`
2. If desired, clear out the authorized_keys: `echo > /home/ec2-user/.ssh/authorized_keys`
3. The AMI can now be created per the [official AWS instructions](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/Creating_EBSbacked_WinAMI.html)