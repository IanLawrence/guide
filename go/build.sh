#!/usr/bin/env bash

set -xe

export PATH=$(npm bin):$PATH

mkdir -p gh-pages
gitbook build -o gh-pages/deploy deploy
gitbook build -o gh-pages/admin admin
gitbook build -o gh-pages/use use
gitbook build -o gh-pages/api api
cp index.html gh-pages/
