#!/bin/bash
aws codecommit delete-repository --repository-name test
for i in {0..2}
do
APPID=$(aws amplify list-apps --output json  --query 'apps['$i'].appId'| tr -d '"' 2> /dev/null)
aws amplify delete-app --app-id $APPID

#sleep 15s
done
for i in {0..1}
do
APPID=$(aws amplify list-apps --output json  --query 'apps[0].appId'| tr -d '"' 2> /dev/null)
aws amplify delete-app --app-id $APPID

#sleep 15s
done

aws codebuild delete-project --name tost
aws codebuild delete-project --name tost1
aws codebuild delete-project --name tost2
