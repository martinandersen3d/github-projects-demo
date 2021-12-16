#!/bin/bash
LANG=en_US.UTF-8

gh issue view 37 | tail -n +11 > issues-sprint.md
