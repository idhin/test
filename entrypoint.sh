#!/bin/bash

aws --version

aws configure set aws_access_key_id $ACCESS
aws configure set aws_secret_access_key $SECRET
aws configure set default.output text

git config --global user.name "GeeksforGeeks"
git config --global user.email "GFGexample@gmail.org"

./amplify-role.sh
sed -i "s/amplify/amplify-08/" amplify-app/config.json
./repo.sh
./jalan.sh
./update.sh

./ulang.sh
