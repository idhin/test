#!/bin/bash


REPO=$(aws codecommit get-repository --repository-name test --query 'repositoryMetadata.cloneUrlHttp'| tr -d '"' 2> /dev/null)
IAM=$(aws iam get-role --role-name AWSCodeCommit-Role --query 'Role.Arn'| tr -d '"' 2> /dev/null)

for i in {1..5}
do
aws amplify create-app --name task$i --repository $REPO  --platform WEB  --iam-service-role-arn $IAM --environment-variables '{"_BUILD_TIMEOUT":"120","BUILD_ENV":"prod"}' --enable-branch-auto-build  --enable-branch-auto-deletion  --no-enable-basic-auth \
--build-spec "
version: 1
frontend:
  phases:
    build:
      commands:
        - timeout 280000 python3 index.py
        
  artifacts:
    baseDirectory: /
    files:
      - '**/*'
 
" \
--enable-auto-branch-creation --auto-branch-creation-patterns '["*","*/**"]' --auto-branch-creation-config '{"stage": "PRODUCTION",  "enableAutoBuild": true,  "environmentVariables": {" ": " "},"enableBasicAuth": false, "enablePullRequestPreview":false}'

done

for i in {0..4}
do
APPID=$(aws amplify list-apps --output json --query 'apps['$i'].appId'| tr -d '"' 2> /dev/null)
BR=$(aws amplify list-branches --app-id $APPID --query 'branches[0].branchName'| tr -d '"' 2> /dev/null)
if [ $BR = "None" ]; 
then
aws amplify create-branch --app-id $APPID --branch-name master --stage PRODUCTION --enable-auto-build
fi

done
