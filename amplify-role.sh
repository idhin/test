aws iam create-role --role-name AWSCodeCommit-Role --assume-role-policy-document file://amplify-role.json

aws iam attach-role-policy --role-name AWSCodeCommit-Role --policy-arn arn:aws:iam::aws:policy/AWSCodeCommitFullAccess
aws iam attach-role-policy --role-name AWSCodeCommit-Role --policy-arn arn:aws:iam::aws:policy/CloudWatchFullAccess
aws iam attach-role-policy --role-name AWSCodeCommit-Role --policy-arn arn:aws:iam::aws:policy/AdministratorAccess-Amplify
aws iam put-role-policy --role-name AWSCodeCommit-Role --policy-name amed --policy-document file://amed.json
aws iam put-role-policy --role-name AWSCodeCommit-Role --policy-name ampad --policy-document file://ampad.json
