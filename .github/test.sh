branch=$(git rev-parse --abbrev-ref HEAD)
mainbranch=$(git remote show origin | grep HEAD | sed -e "s/^.*: //")
if [ "$branch" == "$mainbranch" ] && [ "$GITHUB_EVENT_BEFORE" ] ; then
  git diff --diff-filter=ACMRD --name-only ${GITHUB_EVENT_BEFORE}..${GITHUB_EVENT_AFTER}
else
  git diff --name-only origin/${mainbranch}...
fi
