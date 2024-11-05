# ShortCuts

This repository contains three scripts to help with your development workflow:

1. `create_alias.sh`
2. `gap.sh`
3. `class.sh`

## Setup

To set up the aliases for the scripts, you need to execute the `create_alias.sh` script. This will create aliases for `gap.sh` and `class.sh` in your `.zshrc` file.

### Steps

1. Clone the repository to your local machine.
2. Navigate to the directory containing the scripts.
3. Run the `create_alias.sh` script:



        ./create_alias.sh

This script will add the following aliases to your `.zshrc` file:

- `class` for `class.sh`
- `gap` for `gap.sh`

After running the script, the `.zshrc` file will be reloaded to apply the changes.

## Usage

### `gap.sh`

This script automates the process of adding, committing, and pushing changes to a Git repository.

Usage:
    
    gap 'your_commit_message'

### `class.sh`

This script automates the process of creating c++ class in canonical class name.

It create Makefile, src/ClassName.cpp, inc/ClassName.hpp with class and fonction.

Usage:

    class 'ClassName'
