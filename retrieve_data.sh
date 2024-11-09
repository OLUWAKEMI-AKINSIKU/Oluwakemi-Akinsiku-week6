#!/bin/bash

# Load the version from params.yml
version=$(yq e '.version' params.yml)

# Load the corresponding size for the version from params.yml
size=$(yq e ".size.\"$version\"" params.yml)

# Debugging outputs
echo "Version: $version"
echo "Size: $size"

# Define the REST API URL
API_URL="https://jsonplaceholder.typicode.com/photos"

# Fetch data from the API, limiting to the specified size
echo "Fetching data for version $version with expected size of $size rows..."
curl -s "$API_URL" | jq ".[:$size]" > datahub/old_data.json

# Check if data.json has changed
if cmp -s datahub/old_data.json datahub/data.json; then
    echo "No changes; data has not changed."
else
    echo "Data has been updated."
    mv datahub/old_data.json datahub/data.json
fi
