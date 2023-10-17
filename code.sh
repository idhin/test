cd amplify-app
rm -rf .git
git init
git add .
git commit -m "web app"
git branch -m master
git status

git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true

git remote remove codecommit
REPO=$(aws codecommit get-repository --repository-name test --query 'repositoryMetadata.cloneUrlHttp'| tr -d '"' 2> /dev/null)
git remote add codecommit $REPO
git push codecommit master --force
