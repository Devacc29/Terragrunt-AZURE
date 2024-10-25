#!/bin/bash

cd env/
for envi in {prod,test,dev}; do
    if [ -d "$envi" ]; then
        echo "Processing environment: $envi"

        # Find and delete all *.terraform directories
        find "$envi" -type d -name ".terragrunt-cache" -exec rm -rf {} \;

        # Find and delete all *.hcl files
        find "$envi" -type f -name "*.lock.hcl" -exec rm -f {} \;

        echo "Deletion complete in $envi."
    else
        echo "Directory $envi does not exist."
    fi
done

echo "All specified deletions complete."
