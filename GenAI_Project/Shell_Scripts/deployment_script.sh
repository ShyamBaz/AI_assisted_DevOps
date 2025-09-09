#!/bin/bash
#########################################
# Description: This script deploys an JAVA application to a linux server.
# - Delete the old release version from the release directory
# - Download the tar file into the release directory
# - Extract the tar file in the release directory
# - Create a file list of all files in the release directory
# - Date and time parameter
# - Using the file list, take a backup of all the files in the backup directory if they exist and compare the release file and server file and take backup only if they are different
# - Once the backup is done, copy all the files from the release directory to the server directory
# - Also if there is new files in the release directory, copy them to the server directory
# - Keep backup of a file upto 5 versions only in the backup directory 
#########################################
# Usage: ./deployment_script.sh <release_dir> <backup_dir> <server_dir> <tar_file_url>

