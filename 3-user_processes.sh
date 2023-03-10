#!/bin/bash

# EXERCISE 3: Bash Script - User Processes
# Write a bash script using Vim editor that checks all the processes running for the current user (USER env var) and prints out the processes in console.
# Hint: use ps aux command and grep for the user.

#########################################################################################################################################################

echo "Processes run by user $USER"

ps aux | grep $USER
