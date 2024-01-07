# Get the list of all commits
$commits = git rev-list --all

# Iterate through each commit
foreach ($commit in $commits) {
    # Get the author date of the commit
    $authorDate = git show -s --format=%aI $commit

    # Set the committer date to the author date
    $env:GIT_COMMITTER_DATE = $authorDate
    $env:GIT_AUTHOR_DATE = $authorDate

    # Amend the commit with the new committer date
    git commit --amend --no-edit --date="$authorDate"

    Write-Output "Changing Changing"
    Write-Output $commit
    Write-Output $authorDate
    Write-Output $env:GIT_COMMITTER_DATE
    Write-Output "Changing Done"

    # Continue the rebase
    git rebase --continue
}

# Push the changes to the remote repository
# git push origin <branch-name> --force
