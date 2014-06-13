#!/usr/bin/env bash

if [[ $TRAVIS_PULL_REQUEST != 'false' ]]; then
  echo "Pull request, skipping..."
  exit 1
fi

echo "Reconstituting SSH key..."
echo -n $id_rsa_{00..30} >> ~/.ssh/id_travis_base64
base64 --decode --ignore-garbage ~/.ssh/id_travis_base64 > ~/.ssh/id_travis
chmod 600 ~/.ssh/id_travis
echo -e "Host github.com\n" >> ~/.ssh/config
echo -e "\tIdentityFile ~/.ssh/id_travis\n" >> ~/.ssh/config
echo -e "\tStrictHostKeyChecking no\n" >> ~/.ssh/config
echo -e "\tPasswordAuthentication no\n" >> ~/.ssh/config

echo "Cloning gh-pages..."
rm -Rf gh-pages
git config --global user.email "travis@travis-ci.org"
git config --global user.name "travis-ci"
git clone --quiet --branch=gh-pages git@github.com:rapidftr/guide.git gh-pages
(cd gh-pages && git rm -rfq *)

echo "Building book..."
./build.sh

cd gh-pages
echo "Pushing result..."
git add -f .
git commit --amend -q -m "Built $TRAVIS_COMMIT"
git push -fq origin gh-pages

echo "Cleaning up..."
rm -Rf ~/.ssh/id_travis*
