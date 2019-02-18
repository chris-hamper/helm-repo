# helm-repo

My personal public helm repo

## Adding a new Helm chart to the repo

1. Place the complete Helm chart in a subdirectory.
1. Run: 
    ```
    ./package.sh chart-subdirectory
    ```
1. The chart will be packaged into a tarball, added to the chart index, and commited to the git repo.
1. `git push` the changes up and you're done!
