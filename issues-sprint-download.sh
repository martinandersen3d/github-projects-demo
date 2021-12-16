#!/bin/bash
LANG=en_US.UTF-8

cp issues-sprint.md issues-backup.md

git add -A
git commit -m "Issue Download"
git push

gh issue view 37 | tail -n +11 > issues-sprint.md
