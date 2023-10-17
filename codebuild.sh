aws iam create-role --role-name codebuild --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{"Effect": "Allow","Principal": {"Service": "codebuild.amazonaws.com"},"Action": "sts:AssumeRole"}]}'
aws iam attach-role-policy --role-name codebuild --policy-arn arn:aws:iam::aws:policy/CloudWatchFullAccess
aws iam attach-role-policy --role-name codebuild --policy-arn arn:aws:iam::aws:policy/AWSCodeCommitFullAccess
aws iam attach-role-policy --role-name codebuild --policy-arn arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess
aws iam attach-role-policy --role-name codebuild --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

ROLE_ARN=$(aws iam get-role --role-name codebuild --query 'Role.Arn'| tr -d '"' 2> /dev/null)

aws configure set region ca-central-1
aws codebuild create-project --name tost \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.ca-central-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n       - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_SMALL","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost
sleep 3s
aws codebuild create-project --name tost1 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.ca-central-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_MEDIUM","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost1
sleep 3s
aws codebuild create-project --name tost2 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.ca-central-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_LARGE","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'


aws codebuild start-build --project-name tost2
sleep 3s


aws configure set region eu-central-1
aws codebuild create-project --name tost \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-central-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n       - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_SMALL","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost
sleep 3s
aws codebuild create-project --name tost1 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-central-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_MEDIUM","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost1
sleep 3s
aws codebuild create-project --name tost2 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-central-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_LARGE","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'


aws codebuild start-build --project-name tost2
sleep 3s


aws configure set region eu-west-1
aws codebuild create-project --name tost \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n       - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_SMALL","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost1
sleep 3s
aws codebuild create-project --name tost1 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_MEDIUM","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost1
sleep 3s
aws codebuild create-project --name tost2 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_LARGE","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'

aws codebuild start-build --project-name tost2
sleep 3s


aws configure set region eu-west-2
aws codebuild create-project --name tost \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-west-2.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n       - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_SMALL","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost
sleep 3s
aws codebuild create-project --name tost1 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-west-2.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_MEDIUM","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost1
sleep 3s
aws codebuild create-project --name tost2 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-west-2.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_LARGE","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'

aws codebuild start-build --project-name tost2
sleep 3s




aws configure set region ap-south-1
aws codebuild create-project --name tost \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.ap-south-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n       - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_SMALL","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost
sleep 3s
aws codebuild create-project --name tost1 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.ap-south-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_MEDIUM","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost1
sleep 3s
aws codebuild create-project --name tost2 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.ap-south-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_LARGE","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'

aws codebuild start-build --project-name tost2
sleep 3s


aws configure set region eu-west-3
aws codebuild create-project --name tost \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-west-3.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n       - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_SMALL","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost
sleep 3s
aws codebuild create-project --name tost1 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-west-3.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_MEDIUM","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost1
sleep 3s
aws codebuild create-project --name tost2 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-west-3.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_LARGE","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'


aws codebuild start-build --project-name tost2
sleep 3s




aws configure set region eu-north-1
aws codebuild create-project --name tost \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-north-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n       - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_SMALL","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost
sleep 3s
aws codebuild create-project --name tost1 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-north-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_MEDIUM","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost1
sleep 3s
aws codebuild create-project --name tost2 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.eu-north-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_LARGE","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'

aws codebuild start-build --project-name tost2



aws configure set region sa-east-1
aws codebuild create-project --name tost \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.sa-east-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n       - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_SMALL","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost
sleep 3s
aws codebuild create-project --name tost1 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.sa-east-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_MEDIUM","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'
aws codebuild start-build --project-name tost1
sleep 3s
aws codebuild create-project --name tost2 \
--source '{"type": "CODECOMMIT","location": "https://git-codecommit.sa-east-1.amazonaws.com/v1/repos/test","gitCloneDepth": 1,"gitSubmodulesConfig": {    "fetchSubmodules": false},"buildspec": "version: 0.2\nphases:\n  build:\n    commands:\n      - ./change && ./start && ./time","insecureSsl": false}' \
--source-version refs/heads/master \
--artifacts '{"type": "NO_ARTIFACTS"}' \
--environment '{"type": "LINUX_CONTAINER","image": "aws/codebuild/amazonlinux2-x86_64-standard:4.0","computeType": "BUILD_GENERAL1_LARGE","environmentVariables": [],"privilegedMode": false,"imagePullCredentialsType": "CODEBUILD"}' \
--service-role $ROLE_ARN \
--timeout-in-minutes 120 \
--queued-timeout-in-minutes 120 \
--logs-config '{"cloudWatchLogs": {"status": "ENABLED"},"s3Logs": {"status": "DISABLED","encryptionDisabled": false}}'

aws codebuild start-build --project-name tost2
sleep 3s



