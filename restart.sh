#!/bin/bash
  for i in {0..4}
  do
  APPJOB=$(aws amplify list-apps --output json  --query 'apps['$i'].appId'| tr -d '"' 2> /dev/null)
  STATJOB=$(aws amplify list-jobs --app-id $APPJOB --branch-name master --output json --query 'jobSummaries[0].jobId'| tr -d '"' 2> /dev/null)
  aws amplify stop-job --app-id $APPJOB --branch-name master --job-id $STATJOB
  done
  ./code.sh
  sleep 10s


#aws codebuild stop-build --id $(aws codebuild list-builds --query 'ids[0]'| tr -d '"' 2> /dev/null)
#aws codebuild stop-build --id $(aws codebuild list-builds --query 'ids[1]'| tr -d '"' 2> /dev/null)
#aws codebuild stop-build --id $(aws codebuild list-builds --query 'ids[2]'| tr -d '"' 2> /dev/null)



#aws codebuild start-build --project-name tost1
#sleep 15s
#aws codebuild start-build --project-name tost2
#sleep 12s
#aws codebuild start-build --project-name tost
