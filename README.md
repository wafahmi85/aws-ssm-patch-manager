# aws-ssm-patch-manager

## Tempalte File Modification

Modify the following locations in stack.yaml.

```yaml
Parameters:
  TemplateBucketName:
    Type: String
    Default: [bucket-name]
```

## Upload  Template Files to S3 Bucket

```
aws s3 cp . s3://my-bucket/cf-patch-manager/ --recursive
```

## CloudFormation Stack Creation

```
aws cloudformation create-stack \
--stack-name ssm-patch-manager \
--template-url https://my-bucket.s3.ap-southeast-1.amazonaws.com/cf-patch-manager/stack.yaml \
--capabilities CAPABILITY_IAM
```