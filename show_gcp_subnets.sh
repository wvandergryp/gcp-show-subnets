#!/bin/bash

# Check if the input file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

input_file="$1"

# Function to extract subnets and CIDRs for a given network in a project
extract_subnets() {
  local project=$1
  local network=$2
  subnets=$(gcloud compute networks subnets list --network="$network" --project="$project" --format="value(name, ipCidrRange)")
  echo "$subnets"
}

# Main script
echo "Extracted Subnets with CIDRs:"

while IFS=',' read -r project network; do
  echo "Project: $project, Network: $network"
  subnets=$(extract_subnets "$project" "$network")
  if [ -n "$subnets" ]; then
    echo "$subnets"
  else
    echo "  No subnets found"
  fi
done < "$input_file"
