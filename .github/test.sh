git log -n 5
# git diff --diff-filter=ACMRD --name-only 7c73e5aed106123ebc3587f83134238f0ac7a664..8c388a85b59994709c6b2f5214fc42f16224ec12

# branch=$(git rev-parse --abbrev-ref HEAD)
# mainbranch=$(git remote show origin | grep HEAD | sed -e "s/^.*: //")
# if [ "$branch" == "$mainbranch" ] && [ "$GITHUB_EVENT_BEFORE" ] ; then
#   git diff --diff-filter=ACMRD --name-only ${GITHUB_EVENT_BEFORE}..${GITHUB_EVENT_AFTER}
# else
#   git diff --name-only origin/${mainbranch}...
# fi
