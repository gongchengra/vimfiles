#!/bin/bash

# Define the directory containing subfolders
subfolders_dir="plugged"

# Navigate to the base repository root if not currently there
# Uncomment and set the following line if necessary
# cd /path/to/base-repo

# Find all git repositories within the subfolders (directories containing a .git folder)
git_repos=$(find "$subfolders_dir" -mindepth 2 -maxdepth 2 -type d -name ".git")

# Loop through the found git repositories
for git_dir in $git_repos; do
    # Derive the repository path from the directory containing the .git folder
    repo_path=$(dirname "$git_dir")

    # Check if we have a remote URL
    remote_url=$(cd "$repo_path" && git config --get remote.origin.url)

    if [[ -n $remote_url ]]; then
        # Assuming the repository is inside a subfolder of subfolders_dir,
        # grab the path relative to subfolders_dir for adding as a submodule
        relative_path=$(realpath --relative-to "$subfolders_dir/.." "$repo_path")

        # Add the repository as a submodule
        echo "Adding submodule: $relative_path"
        git submodule add "$remote_url" "$relative_path"
    else
        echo "No remote found for $repo_path, can't add as submodule."
    fi
done

