#!/bin/bash

# Simple file watcher script for kagent_slides.md
# Runs Marp to generate HTML output when the file changes

WATCH_FILE="kagent_slides.md"
OUTPUT_FILE="kagent_slides.html"

if [ ! -f "$WATCH_FILE" ]; then
    echo "Error: $WATCH_FILE not found in current directory"
    exit 1
fi

echo "Watching $WATCH_FILE for changes..."
echo "Press Ctrl+C to stop"

# Get initial modification time
last_modified=$(stat -f %m "$WATCH_FILE" 2>/dev/null || stat -c %Y "$WATCH_FILE" 2>/dev/null)

while true; do
    # Get current modification time
    current_modified=$(stat -f %m "$WATCH_FILE" 2>/dev/null || stat -c %Y "$WATCH_FILE" 2>/dev/null)
    
    if [ "$current_modified" != "$last_modified" ]; then
        echo "$(date): $WATCH_FILE changed, running Marp..."
        marp "$WATCH_FILE" -o "$OUTPUT_FILE"
        if [ $? -eq 0 ]; then
            echo "$(date): Successfully generated $OUTPUT_FILE"
        else
            echo "$(date): Error running Marp command"
        fi
        last_modified="$current_modified"
    fi
    
    sleep 1
done