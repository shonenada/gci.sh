#!/usr/bin/env bash

set -e

EDITOR=${EDITOR:-"vi"}

TMP_FILE=".git-commit.diff"

diff=$(git diff --staged | sed -e $'s/diff --git/\\\ndiff --git/g')

if [ -z "$diff" ]
then
    echo "No file(s) staged."
    exit 1
fi

printf "\n\n# Please input commit message\n" > $TMP_FILE
echo "$diff" >> $TMP_FILE

$EDITOR $TMP_FILE

msg=$(head -1 $TMP_FILE)

if [ -z "$msg" ]
then
    echo "No commit message, aborting commit."
    rm $TMP_FILE
    exit 1
fi

git commit -m "$msg"

rm $TMP_FILE
