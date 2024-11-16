#!/bin/sh

set -ex
git fetch --all
git checkout -b automated-pr-change
git config --global user.name "Forgejo Bot"
git config --global user.email "forgejo@users.noreply.git.araj.me"
if [[ -n "$(git status --porcelain)" ]]; then
    git add proxmox/
    git commit -m "Add changed host records"
    git push --force-with-lease origin automated-pr-change
    curl -X 'POST' \
    'https://git.araj.me/api/v1/repos/maxking/dns-utils/pulls' \
    -H 'accept: application/json' \
    -H 'Authorization: token ${{ secrets.FORGEJO_PAT }}' \
    -H 'Content-Type: application/json' \
    -d '{
    "assignee": "maxking",
    "base": "main",
    "body": "Update PR for DNS records",
    "head": "automated-pr-change",
    "title": "Automated PR for DNS records"
    }'
else
    echo "No changes to commit"
fi

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
