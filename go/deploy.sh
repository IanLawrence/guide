#!/usr/bin/env bash

echo "Reconstituting SSH key..."
echo $DEPLOY_KEY | sed 's/\\n/\'$'\n/g' > id_guide
chmod 600 id_guide

export GIT_SSH=$(pwd)/go/ssh.sh
export SSH_KEY=$(pwd)/id_guide

set -xe

echo "Cloning gh-pages..."
rm -Rf gh-pages
git config --global user.email "snap@snap-ci.org"
git config --global user.name "snap-ci"
git clone --quiet --branch=gh-pages git@github.com:rapidftr/guide.git gh-pages
(cd gh-pages && git rm -rfq *)

echo "Building site..."
go/build.sh

echo "Pushing result..."
cd gh-pages
git add --all --force .
git commit --amend --allow-empty -q -m "Built $SNAP_COMMIT_SHORT"
git push -fq origin gh-pages

echo "Cleaning up..."
rm -Rf ~/.ssh/id_guide*
