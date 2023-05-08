#!/bin/bash

REPO_URL="https://github.com/Atropa-Solanaceae/proXXy"

# Check if Git is installed
command -v git >/dev/null 2>&1 || { echo >&2 "Git is required but not installed. Aborting."; exit 1; }

# Clone or update the repository
if [ -d "proXXy" ]; then
    echo "Updating existing repository..."
    cd proXXy || exit
    git pull origin master
else
    echo "Cloning repository..."
    git clone "$REPO_URL" proXXy
    cd proXXy || exit
fi

# Copy the updated files to the current directory
echo "Copying files..."
cp -R ./* ..
cd .. || exit

echo "Cleaning up..."
rm -rf proXXy

echo "Update completed."
