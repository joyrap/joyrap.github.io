#! /bin/bash

set -eux 

echo -e "Publish to blog.xiebiao.com!\n"

# git submodule add git@github.com:joyrap/joyrap.github.io.git publish
# Build the project. 
#git submodule add git@joyrap.github.com:joyrap/joyrap.github.io.git publish

# push docs to `joyrap.github.io`
git add -A
git commit -m "Update"
git  push origin master




