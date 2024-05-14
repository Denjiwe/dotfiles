#!/bin/bash
# Directory containing the scripts
SCRIPT_DIR="$HOME/.config/hypr/scripts/tmux/"

# Generate a list of.sh files in the directory
script_list=$(ls "$SCRIPT_DIR" 2>/dev/null)

# Check if any scripts were found
if [ -z "$script_list" ]; then
    echo "No scripts found in $SCRIPT_DIR"
    exit 1
fi

# Use select to create a menu of the scripts
select script in $script_list; do
    if [ -n "$script" ]; then
        echo "You selected $script"
        # Execute the selected script
        bash "$SCRIPT_DIR$script"
        break
    else
        echo "Invalid selection"
    fi
done

