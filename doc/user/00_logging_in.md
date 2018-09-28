# Logging in with an SSH Key

## Overview

The instructions below explain the process for logging into the AWS instance with the SSH key created during deployment.

## Logging in for the first time

The Amazon deployment process creates a user with the username `ec2-user`, but the labs involve working as the `oracle` user. To accomplish this, we need to allow the SSH key created during deployment to be used by the `oracle` user. The steps below assume that you are using a Mac or Linux machine to connect, but MobaXterm also has the ability to specify a key.

1. Log in for the first time as `ec2-user`. This assumes that you saved your key in the local working directory as "oracle.pem"
```
ssh ec2-user@<instance public dns> -X -i ./oracle.pem
```

2. Run the commands below to allow your private key to also be used for the `oracle` user:
```
sudo mkdir /home/oracle/.ssh
sudo cp /home/ec2-user/.ssh/authorized_keys /home/oracle/.ssh/authorized_keys
sudo chown -R oracle:oinstall /home/oracle/.ssh
```

3. Log out of your session as the `ec2-user`:
```
logout
```

4. Verify that you can log back in as the `oracle` user:
```
ssh oracle@<instance public dns> -X -i ./oracle.pem
```

5. You should now be successfully logged in as the `oracle` user.