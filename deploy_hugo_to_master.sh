#! /bin/bash

set -eux 

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"


git checkout master

git pull
git merge -f  hugo

hugo -d docs
rm -rf `ls|egrep -v docs`
mv -f ./docs/* ./
git add -A
git commit -m "deploy"

# Push source and build repos:
git push origin master
