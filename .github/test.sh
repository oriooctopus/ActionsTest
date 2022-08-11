typeofvar () {

    local type_signature=$(declare -p "$1" 2>/dev/null)

    if [[ "$type_signature" =~ "declare --" ]]; then
        printf "string"
    elif [[ "$type_signature" =~ "declare -a" ]]; then
        printf "array"
    elif [[ "$type_signature" =~ "declare -A" ]]; then
        printf "map"
    else
        printf "none"
    fi

}

# git diff --diff-filter=ACMRD --name-only 7c73e5aed106123ebc3587f83134238f0ac7a664..8c388a85b59994709c6b2f5214fc42f16224ec12

# branch=$(git rev-parse --abbrev-ref HEAD)

# mainbranch=$(git remote show origin | grep HEAD | sed -e "s/^.*: //")

changedFiles=$(git diff --diff-filter=ACMRD --name-only ${GITHUB_EVENT_BEFORE}..${GITHUB_EVENT_AFTER})
# changedFiles='.github/test.sh test.txt'


echo 'the type before'
typeofvar changedFiles
echo 'the type after'

# echo 'before'
# echo $changedFiles
# echo 'after'


IFS=', ' read -r -a array <<< "$changedFiles"

for element in "${array[@]}"
do
  echo 'in'
  echo "$element"
done
echo 'done'

