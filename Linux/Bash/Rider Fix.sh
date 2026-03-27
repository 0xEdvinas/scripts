#!/bin/bash

# Find all Rider processes and kill them
PIDS=$(pgrep -f rider)

if [ -z "$PIDS" ]; then
  echo "No Rider instances found."
else
  echo "Killing Rider instances with PIDs: $PIDS"
  kill -9 $PIDS
  echo "All Rider instances terminated."
fi


# Base directory containing Rider folders
BASE_DIR="/home/edveikis/.var/app/com.jetbrains.Rider/config/JetBrains"

# Loop through all Rider* folders
for dir in "$BASE_DIR"/Rider*; do
    # Ensure it's a directory
    if [ -d "$dir" ]; then
        LOCK_FILE="$dir/.lock"
        if [ -f "$LOCK_FILE" ]; then
            echo "Deleting $LOCK_FILE"
            rm -f "$LOCK_FILE"
        else
            echo "No .lock file in $dir"
        fi
    fi
done
