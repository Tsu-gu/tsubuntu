#!/bin/bash

# Twitch VOD downloader and uploader script
# Usage: 
#   twitch download - Download a Twitch VOD
#   twitch upload <file.mp4> - Upload a file using rclone

twitch_download() {
    # Prompt for VOD link
    read -p "Enter the VOD link: " vod_link
    
    # Strip everything except the ID from the link
    # Handles formats like:
    # https://www.twitch.tv/videos/2641546877
    # twitch.tv/videos/2641546877
    # 2641546877
    vod_id=$(echo "$vod_link" | sed -E 's/.*videos\/([0-9]+).*/\1/')
    
    # Validate that we got a numeric ID
    if ! [[ "$vod_id" =~ ^[0-9]+$ ]]; then
        echo "Error: Could not extract valid VOD ID from: $vod_link"
        return 1
    fi
    
    echo "VOD ID: $vod_id"
    
    # Get VOD metadata using twitchdownloader info command
    echo "Fetching VOD metadata..."
    metadata=$(twitchdownloader info --id "$vod_id" --format raw 2>/dev/null)
    
    if [ $? -ne 0 ]; then
        echo "Warning: Could not fetch VOD metadata. Will use fallback naming."
        filename=""
    else
        # Try to extract the title from the JSON metadata
        # This uses basic grep/sed to extract the title field
        title=$(echo "$metadata" | grep -o '"title":"[^"]*"' | head -1 | sed 's/"title":"\(.*\)"/\1/')
        
        if [ -n "$title" ]; then
            # Replace spaces with dashes and remove special characters
            filename=$(echo "$title" | sed 's/ /-/g' | sed 's/[^a-zA-Z0-9\-]//g')
            echo "Using VOD title: $title"
        else
            filename=""
        fi
    fi
    
    # If we couldn't get the title, try using the creation date
    if [ -z "$filename" ]; then
        echo "Trying to use creation date for filename..."
        created_at=$(echo "$metadata" | grep -o '"createdAt":"[^"]*"' | head -1 | sed 's/"createdAt":"\(.*\)"/\1/')
        
        if [ -n "$created_at" ]; then
            # Extract date portion (YYYY-MM-DD) and format it
            filename=$(echo "$created_at" | cut -d'T' -f1 | sed 's/-//g')
            echo "Using creation date: $created_at"
        else
            # Ultimate fallback: use VOD ID
            filename="vod_${vod_id}"
            echo "Using VOD ID as filename"
        fi
    fi
    
    output_file="${filename}.mp4"
    echo "Output file will be: $output_file"
    
    # Download the VOD
    echo "Starting download..."
    twitchdownloader videodownload --id "$vod_id" -o "$output_file"
    
    if [ $? -eq 0 ]; then
        echo "Download complete: $output_file"
    else
        echo "Download failed!"
        return 1
    fi
}

twitch_upload() {
    if [ $# -eq 0 ]; then
        echo "Usage: twitch upload <file.mp4>"
        return 1
    fi
    
    file="$1"
    
    if [ ! -f "$file" ]; then
        echo "Error: File not found: $file"
        return 1
    fi
    
    echo "Uploading $file using rclone..."
    # Placeholder for rclone command - user will modify these paths
    # rclone copy "source:sourcepath" "dest:destpath"
    echo "Note: Please configure your rclone source and destination paths in the script"
    echo "Command template: rclone copy \"$file\" \"dest:destpath\""
}

# Main command dispatcher
case "$1" in
    download)
        twitch_download
        ;;
    upload)
        shift
        twitch_upload "$@"
        ;;
    *)
        echo "Usage:"
        echo "  twitch download          - Download a Twitch VOD"
        echo "  twitch upload <file>     - Upload a file using rclone"
        exit 1
        ;;
esac
