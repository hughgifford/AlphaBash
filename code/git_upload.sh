#!/bin/bash

# ---------------------------------------------------------------------------- #
#                       Blanket Command to Commit to Git                       #
# ---------------------------------------------------------------------------- #

# ----------------------- hg456@exeter.ac.uk March 2024 ---------------------- #

# Execute with `alias gitit="bash ${HOME}/toolbox/bash/git_upload.sh"` in profile

# ----------------------------------- Usage ---------------------------------- #

# Define a function to print an error message and exit with status 1
die() {
    echo "$@" >&1  # Print error message to stderr
    exit 1
}

# Define a function to display usage information and exit with status 1
display_usage() {
    echo -e "\nUsage: gitit <commit message>"
    echo -e "\t Do not use \""
    echo -e "\t-h: Display this help message."
	# Number of arguments
	# echo -e "Number of arguments: $#"
    die
}

# If the first argument is lacking or "-h", display usage
if [ "$#" -eq 0 ] || [ "$1" = "-h" ]; then
    display_usage  # Display usage information and exit
fi

# ---------------------------------- Staging --------------------------------- #

# Add all changes to the stage, :/ is all files (. is current only)
git add -A :/

# Any text following "gitit" will become the comment
comment="\"$@\""

# Command Check - with e to ensure interpolation
echo -e "\nAdded all changes to stage with following message:\n\n\t${comment}\n"

# -------------------------------- Committing -------------------------------- #

# Define the command
CMD2="git commit -m $comment"

# Command check
echo "executing $CMD2"

# Execute
eval $CMD2

# ---------------------------------- Pushing --------------------------------- #

# Push to git
git push

# ------------------------------------ Fin ----------------------------------- #

echo -e "\nDone.\n"
