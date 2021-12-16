#!/bin/bash
LANG=en_US.UTF-8

gh issue list --json number,title |  jq -r '.[] | "#\(.number)\t\(.title)"' > issues-list.md


# Output:
#37     Sprint and Backlog
#32     cccc
#24     merge me into dev
#16     can i move automatic to "in progress" in project
#12     checkmarks to show progress
#11     bug lalalala
#8      I found a bug3
#7      I found a bug2
#6      I found a bug
#5      [3pt] Four
#4      [1pt]Issue Three
#1      [5pt] one issue


