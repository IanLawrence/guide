#!/usr/bin/env bash

export PATH=$(npm bin):$PATH
rm -Rf gh-pages

git config --global user.email "travis@travis-ci.org"
git config --global user.name "travis-ci"
git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/rapidftr/guide.git gh-pages

set -xe
cd gh-pages
git rm -rf ./contribute
( cd ../contribute && gitbook build -o ../gh-pages/contribute )

git add -f .
git commit -m "Built $TRAVIS_COMMIT"
git push -fq origin gh-pages
