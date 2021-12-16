#!/bin/bash
LANG=en_US.UTF-8

git add -A
git commit -m "Issue Upload"
git push

gh issue edit 37 --body-file issues-sprint.md
