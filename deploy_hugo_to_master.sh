#! /bin/bash

set -eux 

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

git checkout master

msg="rebuilding site `date`"
git pull
git merge hugo

if [ $# -eq 1  ]
    then msg="$1"
fi

# Build the project. 
hugo -d docs

rm -rf `ls|egrep -v docs`
cp CNAME docs/
mv -f ./docs/* ./

# Add changes to git.
git add .

# Commit changes.

git commit -m "$msg"

# Push source and build repos:
git push origin master
