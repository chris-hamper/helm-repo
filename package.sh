#!/bin/bash

if [[ $# -ne 1 || ! $1 ]]; then
    echo "Packages the helm chart contained in a given directory, and adds it to the Helm repository index."
    echo "Usage:  package.sh helm-chart-directory"
fi

# Strip possible trailing slash from given directory
chart=${1%/}

# Package the chart
helm package $chart
mv $chart-*.tgz repo/
helm repo index repo --url `cat .repourl`

