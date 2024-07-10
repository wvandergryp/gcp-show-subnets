#!/bin/bash

# Check if the input file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

input_file="$1"

# Function to extract subnets and CIDRs for a given network in a project
extract_subnets() {
  local network=$1
  local project=$2
  subnets=$(gcloud compute networks subnets list --network="$network" --project="$project" --format="value(name, ipCidrRange)")
  echo "$subnets"
}

# Main script
echo "Extracted Subnets with CIDRs:"

while IFS= read -r line; do
  network=$(echo $line | awk '{print $1}')
  project=$(echo $line | awk '{print $2}')
  
  echo "Network: $network, Project: $project"
  subnets=$(extract_subnets "$network" "$project")
  if [ -n "$subnets" ]; then
    echo "$subnets"
  else
    echo "  No subnets found"
  fi
done < "$input_file"
