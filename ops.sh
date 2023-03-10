#!/bin/bash

while true
do
    read -p "Enter 'create', 'update' or 'delete' operation: " i
    lowerstr=$(echo $i | tr '[:upper:]' '[:lower:]')

    if [ "$lowerstr" == "create" ]
        then
            read -p "Enter your S3 bucket name: " bucket
            aws s3 sync . s3://${bucket}/cf-patch-manager/ --exclude ".git/*" --exclude "ops.sh" --delete
            aws cloudformation create-stack \
            --stack-name ssm-patch-manager \
            --template-url https://${bucket}.s3.ap-southeast-1.amazonaws.com/cf-patch-manager/stack.yaml \
            --capabilities CAPABILITY_IAM 
            break
    elif [ "$lowerstr" == "update" ]
        then
            read -p "Enter your S3 bucket name: " bucket
            aws s3 sync . s3://${bucket}/cf-patch-manager/ --exclude ".git/*" --exclude "ops.sh" --delete
            aws cloudformation update-stack \
            --stack-name ssm-patch-manager \
            --template-url https://${bucket}.s3.ap-southeast-1.amazonaws.com/cf-patch-manager/stack.yaml \
            --capabilities CAPABILITY_IAM 
            break
    elif [ "$lowerstr" == "delete" ]
        then
            aws cloudformation delete-stack \
            --stack-name ssm-patch-manager
            break
    else
        echo "\nPlease type correct operation again\n"
    fi
done