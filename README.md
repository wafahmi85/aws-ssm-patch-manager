# aws-ssm-patch-manager


<img width="600" alt="image" src="https://user-images.githubusercontent.com/108646116/220481806-8736bbbe-9836-401b-bed8-3c6800724d24.png">


## Template File Modification

Modify the following locations in stack.yaml.

```yaml
Parameters:
  TemplateBucketName:
    Type: String
    Default: [bucket-name]

Prefix:
    Type: String
    Default: [project-name]

  MailAddress:
    Type: String
    Default: [email]
```

## Upload  Template Files to S3 Bucket

```
aws s3 cp . s3://<bucket-name>/cf-patch-manager/ --recursive
```

## CloudFormation Stack Creation

```
aws cloudformation create-stack \
--stack-name ssm-patch-manager \
--template-url https://<bucket-name>.s3.ap-southeast-1.amazonaws.com/cf-patch-manager/stack.yaml \
--capabilities CAPABILITY_IAM
```

## CloudFormation Stack Update

```
aws cloudformation update-stack \
--stack-name ssm-patch-manager \
--template-url https://<bucket-name>.s3.ap-southeast-1.amazonaws.com/cf-patch-manager/stack.yaml \
--capabilities CAPABILITY_IAM
```

## CloudFormation Stack Deletion

```
aws cloudformation delete-stack \
--stack-name ssm-patch-manager \
--template-url https://<bucket-name>.s3.ap-southeast-1.amazonaws.com/cf-patch-manager/stack.yaml \
--capabilities CAPABILITY_IAM
```
