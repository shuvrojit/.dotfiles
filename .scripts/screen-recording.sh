#!/bin/bash

# Check if wl-screenrec is already running
if pgrep wl-screenrec > /dev/null; then
  # Extract the name of the recording file in use (if possible)
  recording_file=$(ps aux | grep '[w]l-screenrec' | awk -F'-f ' '{print $2}' | awk '{print $1}')

  if [ -n "$recording_file" ]; then
      notify-send " Recording Stopped" "'$recording_file' created"
  else
    notify-send "Recording Stopped."
  fi

  pkill --signal SIGINT wl-screenrec
  exit 0
fi


# Check if -g is passed as an argument
use_geometry=false
if [ "$1" == "-g" ]; then
  use_geometry=true
  shift  # Shift arguments to remove -g from the list
fi


# Function to prompt for a filename using dmenu
get_filename() {
  echo "" | dmenu -p "Enter filename:"
}

# Main loop to prompt for filename and check existence
while true; do
  filename=$(get_filename)

  # Check if filename is empty
  if [ -z "$filename" ]; then
    echo "No filename entered. Exiting."
    exit 1
  fi

  # Set the full path for the filename
  filepath="$HOME/Desktop/screencasts/$filename.mp4"

  # Check if file already exists
  if [ -e "$filepath" ]; then
    # Prompt the user for action
    action=$(echo -e "Overwrite\nEnter new name\nCancel" | dmenu -p "File exists. Choose action:")

    case $action in
      "Overwrite")
        break
        ;;
      "Enter new name")
        continue
        ;;
      "Cancel")
        echo "Operation canceled. Exiting."
        exit 1
        ;;
      *)
        echo "Invalid action. Exiting."
        exit 1
        ;;
    esac
  else
    # If file doesn't exist, break the loop and proceed
    break
  fi
done

# Run the wl-screenrec command with or without -g based on user input
if [ "$use_geometry" == true ]; then
  # Run with -g and slurp
    wl-screenrec --audio -f "$filepath" -g "$(slurp)" &
    pgrep wl-screenec && notify-send " Recording Started"

else
  # Run without -g
    wl-screenrec --audio -f "$filepath" &
    pgrep wl-screenrec && notify-send " Recording Started"
fi

