#!/bin/bash

if [[ $# -ne 1 || ! $1 ]]; then
    echo "Packages the helm chart contained in a given directory, and adds it to the Helm repository index."
    echo "    Usage:  package.sh helm-chart-directory"
    exit
fi

# Strip possible trailing slash from given directory
chart=${1%/}

# Package the chart
helm package $chart

pattern="$chart-*.tgz"
files=( $pattern )
file=${files[0]}
chart_version=${file%.tgz}

mv $file docs/
helm repo index docs --url `cat .repourl`

# Force-add files in repo/ to git
git add docs -f
git commit -em "Add $chart_version chart"
