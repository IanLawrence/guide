#!/usr/bin/env bash

set -xe

export PATH=$(npm bin):$PATH

gitbook_build() {
  mkdir -p $TARGET
  gitbook build -o $TARGET/deploy $SRC/deploy
  gitbook build -o $TARGET/admin $SRC/admin
  gitbook build -o $TARGET/use $SRC/use
  gitbook build -o $TARGET/api $SRC/api
  cp $SRC/index.html $TARGET/
}

# Build master
SRC=. TARGET=gh-pages gitbook_build

# Build v1.2.1
mkdir -p tmp/v1.2.1
git clone --quiet --branch=v1.2.1 git://github.com/rapidftr/guide.git tmp/v1.2.1
SRC=tmp/v1.2.1 TARGET=gh-pages/v1.2.1 gitbook_build
