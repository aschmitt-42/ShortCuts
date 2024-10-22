#!/bin/bash

# Get the directory where the script is executed
SCRIPT_DIR="$(pwd)"

# Define the alias line
ALIAS_LINE="alias autoclass=\"${SCRIPT_DIR}/AutoClass\""

# Check if the alias is already in .zshrc
if grep -Fxq "$ALIAS_LINE" ~/.zshrc; then
    echo "Alias 'autoclass' is already present in .zshrc."
else
    # Add the alias to .zshrc
    echo "$ALIAS_LINE" >> ~/.zshrc
    #source ~/.zshrc
fi
