#!/bin/bash

# Prompt the user to enter the new version for file content
read -p "Enter the new version for file content: " NEW_VERSION_CONTENT

# Get the current filename
CURRENT_FILENAME=$(find . -type f -name 'version.*' -exec basename {} \;)

# Extract the current version from the filename
CURRENT_VERSION=$(echo "${CURRENT_FILENAME}" | sed 's/version.//')

# Prompt the user to enter the new version for the file name [${CURRENT_VERSION}]
read -p "Enter the new version for the file name [${CURRENT_VERSION}]: " NEW_VERSION_FILENAME

# Use the new version for the file name or keep the current version if not provided
NEW_VERSION_FILENAME=${NEW_VERSION_FILENAME:-${CURRENT_VERSION}}

# Update the version inside the file content
sed -i "" "s/VERSION=.*/VERSION=${NEW_VERSION_CONTENT}/" "${CURRENT_FILENAME}"

# Rename the file with the new version for the file name
NEW_FILENAME="version.${NEW_VERSION_FILENAME}"
mv "${CURRENT_FILENAME}" "${NEW_FILENAME}"


