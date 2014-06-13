#!/usr/bin/env bash

npm install
export PATH=$(npm bin):$PATH

mkdir -p gh-pages
gitbook build -o gh-pages/deploy deploy
gitbook build -o gh-pages/admin admin
gitbook build -o gh-pages/use use
cp index.html gh-pages/
