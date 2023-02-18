#!/bin/bash

while true
do
    read -p "Enter Operation: " i
    if [ "$i" == "create" ]
        then
            aws cloudformation create-stack \
            --stack-name ssm-patch-manager \
            --template-url https://fahmi-ap-southeast-1.s3.ap-southeast-1.amazonaws.com/cf-patch-manager/stack.yaml \
            --capabilities CAPABILITY_IAM 
            break
    elif [ "$i" == "update" ]
        then
            aws cloudformation update-stack \
            --stack-name ssm-patch-manager \
            --template-url https://fahmi-ap-southeast-1.s3.ap-southeast-1.amazonaws.com/cf-patch-manager/stack.yaml \
            --capabilities CAPABILITY_IAM 
            break
    elif [ "$i" == "delete" ]
        then
            aws cloudformation delete-stack \
            --stack-name ssm-patch-manager
            break
    else
        echo "Please type correct input again"
    fi
done