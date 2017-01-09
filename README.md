# Dockerfile for AWS CLI

This is an alpine based docker image with AWS CLI installed.

## How to Use:

If you are running it on an EC2 instance, you can do it without configuring the AWS CLI, provided that the role of the instance has permision to execute the AWS CLI command
```
docker run -it stakater/awscli aws ec2 describe-instances --region us-west-2
```

If you are running it from somewhere else, you'll need to configure AWS CLI, for that, you can configure it on the host machine and map the `~/.aws` directory inside the container

```
docker run -it -v /home/stakater/.aws:/root/.aws stakater/awscli aws ec2 describe-instances --region us-west-2
```

In case you want to download something from AWS and make it available on the host machine as well, you can map the working directory of the container on the host machine.

```
docker run -it -v /home/stakater/Downloads/awscli_downloads:/aws stakater/awscli aws s3 cp http://myS3Bucket/myFile .
```