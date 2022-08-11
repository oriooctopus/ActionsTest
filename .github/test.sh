# If any changes are made to this path, please also adjust coreComponentLibraryPaths
# in alfred/src/main/scala/alfred/processors/FileUtils.scala
#
# TODO: SPARK-143849 - once aura-ui migration is complete, investigate
# if we should centralize this
coreComponentPaths=(
  "src/rubrik/spark-ui/src/Libs/AuraDesignSystem"
  "src/rubrik/spark-ui/src/shared/core"
  "src/rubrik/aura-ui"
  "src/rubrik/spark-ui/src/Platform/Wizard"
  "src/rubrik/spark-ui/icons"
  "src/rubrik/spark-ui/illustrations"
  "src/rubrik/spark-ui/src/theme"
  "src/rubrik/spark-ui/src/styles"
  "src/rubrik/spark-ui/src/images"
  "src/rubrik/spark-ui/src/Libs/Components"
)

function trigger_pipeline {
  curl "https://polaris-builds.stark.rubrik.com/buildByToken/buildWithParameters?job=ChromaticVisualRegressionsCheck&token=CHROMATIC_TRIGGER&User-Agent=Mozilla/5.0"
}

# changedFiles=$(git diff --diff-filter=ACMRD --name-only ${GITHUB_EVENT_BEFORE}..${GITHUB_EVENT_AFTER})
changedFiles=$(git diff --diff-filter=ACMRD --name-only 72147d8373d448cd21e0c3971a338c19ea18518d..15f1c3bb57dd070929cf7b6b9388865862d6b071)

changedFilesArray=(
  "polaris/src/rubrik/spark-ui/src/Libs/AuraDesignSystem/RubrikDesignPatterns/AggregationDisplay/AggregationDisplayTotalItem.tsx"
  "polaris/src/rubrik/spark-ui/src/Platform/Cluster/ClusterDetail/ClusterOverview/ClusterActivity/ClusterActivity.tsx"
  "randomPath"
  "polaris/src/rubrik/spark-ui/src/styles/themes/themes.types.tsx"
)

# changedFilesArray=(`echo ${changedFiles}`);



for changedFile in "${changedFilesArray[@]}"
do
  for coreComponentPath in "${coreComponentPaths[@]}"
  do
    if [[ "$changedFile" == *"$coreComponentPath"* ]]; then
      trigger_pipeline
      exit 0
    fi
  done
done

