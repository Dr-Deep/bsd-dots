#!/usr/bin/env bash

DATE=$(date +%Y-%m-%d_%H-%M)

git add .
git commit -m "${DATE}"
git status
git push
