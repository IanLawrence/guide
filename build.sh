#!/usr/bin/env bash

if [[ $TRAVIS_PULL_REQUEST != 'false' ]]; then
  echo "Pull request, skipping..."
  exit 1
fi

export PATH=$(npm bin):$PATH
rm -Rf gh-pages

git config --global user.email "travis@travis-ci.org"
git config --global user.name "travis-ci"
git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/rapidftr/guide.git gh-pages

set -xe
cd gh-pages
git rm -rfq *

( cd ../contributor && gitbook build -o ../gh-pages/contributor )
( cp ../index.html .)

git add -f .
git commit --amend -q -m "Built $TRAVIS_COMMIT"
git push -fq origin gh-pages

cd ..
rm -Rf gh-pages
