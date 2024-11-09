#!/bin/bash

# Load the version and size from params.yml
version=$(grep -m1 "version:" params.yml | awk '{print $2}' | tr -d '"')
size=$(grep -A1 "size:" params.yml | grep "$version" | awk '{print $2}' | tr -d '"')

# Debugging outputs
echo "Version: $version"
echo "Size: $size"

# Define the REST API URL
API_URL="https://jsonplaceholder.typicode.com/photos"

# Fetch data from the API, limiting to the specified size
echo "Fetching data for version $version with expected size of $size rows..."
curl -s "$API_URL" | jq ".[:${size}]" > datahub/data.json

# Check if data.json has changed
if cmp -s datahub/data.json datahub/old_data.json; then
    echo "No changes; data has not changed."
else
    echo "Data has been updated."
    mv datahub/data.json datahub/old_data.json
fi
