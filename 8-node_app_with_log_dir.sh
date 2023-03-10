#!/bin/bash

# EXERCISE 8: Bash Script - Node App with Log Directory
# Extend the script to accept a parameter input log_directory: a directory where application will write logs.

# The script will check whether the parameter value is a directory name that doesn’t exist and will create the directory, if it does exist,
# it sets the env var LOG_DIR to the directory’s absolute path before running the application, so the application can read the LOG_DIR environment
# variable and write its logs there.

# Note:
# Check the app.log file in the provided LOG_DIR directory.

#########################################################################################################################################################

# Update the repos

echo "Updating the repos..."
sudo apt update

# Install NodeJS, NPM, curl, net-tools

sudo apt install -y nodejs npm curl net-tools

# Show the version of installed NodeJS and NPM

echo "Installed NodeJS version:"
node -v
echo""
echo "Installed NPM version:"
npm -v
echo ""

# Ask for a log dir and set the environment variables

echo -n "Set log directory location for the application (absolute path): "
read LOG_DIR
export LOG_DIR="$LOG_DIR"

if [ -d $LOG_DIR ]
then
  echo "$LOG_DIR already exists"
else
  mkdir -p $LOG_DIR
  echo "A new directory $LOG_DIR has been created"
fi

export APP_ENV=dev, DB_USER=myuser, DB_PWD=mysecret
# Download an artifact from the URL
echo "Downloading and artifact..." 
curl https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz --output bootcamp-node-envvars-project-1-0-0.tgz

echo "Unzipping the downloaded file"
tar -xvzf bootcamp-node-envvars-project-1-0-0.tgz . 

# Change to the unzipped package direcorty
cd package

# Run the NodeJS application

echo "Installing NPM dependencies"
npm install
echo ""
echo "Starting NodeJS server in background..."
node server.js &
echo""
echo "Script has been successfully executed."
echo ""

# Display that nodejs process is running

ps aux | grep nodejs | grep -v grep

# Display that nodejs is running on port 3000

netstat -ltnp | grep :3000
