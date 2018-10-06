# Create a new AWS Instance

Create an AWS Instance with the specifications below. Note that the initial AWS Instance and AMI must be created in the US West Oregon region. This is due to a bug with the official CentOS 7 public image. At the time of writing, the CentOS 7 public image still contained references to the AWS Marketplace CentOS Image. This prevents any derived AMIs from being listed publicly. The solution is to create the AMI in an unaffected region (i.e. US West Oregon) and copy it to the desired region (i.e. US East N. Virginia).

|   Parameter   |                          Value                          |
| ------------- | ------------------------------------------------------- |
| Region        | US West (Oregon)                                        |
| AMI           | CentOS Linux 7 x86_64 HVM EBS 1708_11.01 (ami-02c71d7a) |
| Instance Type | t2.medium                                               |
| Storage       | 25 GiB root volume, Delete on Termination               |

## Capturing the AMI

Amazon provides documentation about how to capture an AMI from an instance. The only notable difference is that the AMI must be captured in US West Oregon and then copied over to the desired region (US East N. Virginia).