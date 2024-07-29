# Display all GCP subnets in a Org using GCP Itenary
GCP show all subnets in a GCP org across all projects

# Step-by-Step Instructions
Steps to Enable and Use Cloud Asset Inventory API

# Enable Cloud Asset Inventory API
Navigate to the Cloud Asset Inventory API page in the Google Cloud Console.
Click on "Enable".

Open Cloud Asset Inventory

Open Google Cloud Console.
Go to IAM & Admin > Asset Inventory.

Search for Resources
Click on "Resource", then "View More..".
Search for "compute.Network".
Check Permissions
Ensure you have the necessary permissions:

cloudasset.viewer
resourcemanager.organizationViewer

Export to CSV
Once assets are listed, click on the Export button at the top of the asset results table.

Download the CSV file.

Format the CSV File
Open the downloaded CSV file in a spreadsheet editor (e.g., Microsoft Excel, Google Sheets) or a text editor.
Ensure the CSV file has the following format:

project-1,network-1
project-2,network-2
project-3,network-3
Copy File to Cloud Shell
Copy the file to your cloud shell and save it as networks.txt.

Run the Script
Copy and paste show_gcp_subnets.sh into your cloud shell.
Make the script executable:

chmod 775 show_gcp_subnets.sh
Run the script:

./show_gcp_subnets.sh networks.txt

Example Output

Project: project-1, Network: network-1
gke_sub     10.15.1.0/25

Project: project-2, Network: network-2
subnet1     10.10.0.0/24
subnet2     10.16.1.0/28
subnet3     10.16.0.0/24

Project: project-3, Network: network-3
sub03       10.0.0.0/24

Project: project-4, Network: network-4
No subnets found
