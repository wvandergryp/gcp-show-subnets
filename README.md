# Display all GCP subnets in a Org using GCP Itenary
GCP show all subnets in a GCP org across all projects

# Step-by-Step Instructions
Enable Cloud Asset Inventory API:
Go to the Cloud Asset Inventory API page in the Google Cloud Console.
Click on "Enable".

Open Cloud Asset Inventory in Google Cloud Console (Hamburger -> IAM & Admin -> Asset Inventory):

Click on "Resource" then "View More.." and search for "compute.Network"

Ensure you have the necessary permissions (cloudasset.viewer and resourcemanager.organizationViewer).

Export to CSV:

Once the assets are listed, click on the Export button at the top of the asset results table.

Download the CSV File:

Locate the CSV file you exported.

Format the CSV File:

Open the downloaded CSV file in a spreadsheet editor (e.g., Microsoft Excel, Google Sheets) or a text editor.
Ensure the CSV file has the following format, with project as the first column and network as the second column:

project-1,network-1
project-2,network-2
project-3,network-3

Copy the file to your cloud shell into file networks.txt.

The copy and past show_gcp_subnets.sh in your cloud shell.

chmod 775 show_gcp_subnets.sh

./show_gcp_subnets.sh networks.txt

example output:
Project: project-1, Network: network-1
gke_sub     10.15.1.0/25
Project: project-2, Network: network-2
subnet1    10.10.0.0/24
subnet2     10.16.1.0/28
subnet3       10.16.0.0/24
Project: project-3, Network: network-3
sub03      10.0.0.0/24
Project: project-4, Network: network-4
  No subnets found
