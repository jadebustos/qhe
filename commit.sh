#!/bin/bash

jupyter-book build . 2>&1 | grep -iE "warning|error|missing"

git add . ; LANG=C git commit -S -m "$1" ; git push

git checkout main

git merge dev

git push

git checkout dev
