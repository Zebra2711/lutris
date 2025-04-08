#!/bin/sh

# if the git directory doesn't exist, don't gather data to avoid overwriting, unless
# the version file is missing altogether (otherwise compiling will fail)
if [ ! -d ./.git ]; then
    if [ -f ./lutris/version.py ]; then
        exit 0
    fi
fi

cp -fr ./version.in ./lutris/version.py

HASH=${HASH-$(git rev-parse HEAD)}
BRANCH=${BRANCH-$(git branch --show-current)}
MESSAGE=${MESSAGE-$(git show -s --format=%s)}
DATE=${DATE-$(git show -s --format=%cd --date=local)}
TAG=${TAG-$(git describe --tags)}
COMMITS=${COMMITS-$(git rev-list --count HEAD)}
VERSION=${VERSION-$(git describe --tags | cut -d'-' -f1)}

sed -i -e "s#@HASH@#${HASH}#" ./lutris/version.py
sed -i -e "s#@BRANCH@#${BRANCH}#" ./lutris/version.py
sed -i -e "s#@MESSAGE@#${MESSAGE}#" ./lutris/version.py
sed -i -e "s#@DATE@#${DATE}#" ./lutris/version.py
sed -i -e "s#@TAG@#${TAG}#" ./lutris/version.py
sed -i -e "s#@COMMITS@#${COMMITS}#" ./lutris/version.py
sed -i -e "s#@VERSION@#${VERSION}#" ./lutris/version.py
