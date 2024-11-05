#!/bin/bash

# Create alias for class.sh and gap.sh
echo alias class="$(pwd)/class.sh" >> ~/.zshrc
echo alias gap="$(pwd)/gap.sh" >> ~/.zshrc

# Reload .zshrc
source ~/.zshrc
