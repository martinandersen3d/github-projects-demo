#!/bin/bash

# TODO: Check for git status
# If okay, switch to "Dev branch"
# TODO: git pull

# Remember to make .sh executable (righclick > options > executable)

# List Issue parameters:
# -L, --limit int          Maximum number of issues to fetch (default 30)
# -s, --state string       Filter by state: {open|closed|all} (default "open")
gh issue list --state open --limit 1500

echo '____________________________'
echo -n "WRITE THE NUMBER YOU WOULD LIKE TO WORK ON (Without the hashtag) : "
read issueId
echo "You have chosen issue with Id: #$issueId"
issueTitle=$(gh issue view $issueId | head -n 1)


# the title is printen with a prefix of "title: <issuename>",
# we use substring, to remove the first 7 letters.
issueTitle="${issueTitle:7}"  
echo "$substr"  

# Branch name has to be safe characters. This will convert non-safe characters to underscore "_"
issueTitle=$(sed -E 's/[^[:alnum:]]+/_/g' <<<"$issueTitle")

# if the issueTitle start with some underscores then remove them
while [ $(echo $issueTitle | head -c 1) == "_" ];
do
  issueTitle="${issueTitle:1}"  
done

echo '_______________________________'
echo "Do you want to create the branch: $issueTitle"
while true; do
    read -p "Press (y/n) then ENTER: " yn
    case $yn in
        [Yy]* ) echo "[ ✓ ] Creating branch: $issueTitle"; break;;
        [Nn]* ) echo "[ X ] Goodbye. See you soon.";  exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

git checkout -b $issueTitle
# TODO: catch error: "fatal: A branch named 'sgfdgdfgdf' already exists."


echo "[ ✓ ] Creating Commit";
git commit --allow-empty -m "Initial Branch Commit"

echo "[ ✓ ] Pushing branch to origin";
git push --set-upstream origin $issueTitle


# The title has to be exact "Fixes number", then it will auto link it to the issue.
echo "[ ✓ ] Creating a DRAFT pull request";
echo "[ ✓ ] Assigning current branch to Issue: #$issueId - $issueTitle";
gh pr create --project "Sprint_001_Automated_Kanban_with_reviews" --title "#$issueId - $issueTitle" --body "Fixes #$issueId - Do not change this line" --draft

# HACK: W
# gh issue close 10
# gh issue reopen 10