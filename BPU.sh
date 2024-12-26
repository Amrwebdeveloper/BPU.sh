#!/bin/bash

# Prompt the user for the base directory
read -rp "Enter the base directory path (e.g., /path/to/your/directory): " BASE_DIR

# Prompt the user for GitHub username
read -rp "Enter your GitHub username: " GITHUB_USER

# Prompt the user for the custom email
read -rp "Enter your GitHub email: " GITHUB_EMAIL

# Ask if the user wants to use a .gitignore file
echo "Do you want to use a .gitignore file?"
echo "1. Use Default Preset (.mp4, .pdf, .zip, node_modules/, .env, etc.)"
echo "2. Add Custom exceptions"
read -rp "Enter your choice (1/2): " GITIGNORE_OPTION

# Determine the .gitignore content based on user choice
if [[ "$GITIGNORE_OPTION" == "1" ]]; then
  GITIGNORE_CONTENT="*.mp4\n*.pdf\n*.zip\n*.rar\n*.ai\n*.psd\n*.indd\n*.idml\nnode_modules/\n.env\n.npm/\nlogs/\ndist/\ncoverage/\n.vscode/"
elif [[ "$GITIGNORE_OPTION" == "2" ]]; then
  echo "Enter the exceptions you want to include in .gitignore (use \\n for new lines):"
  read -rp "Exceptions: " CUSTOM_EXCEPTIONS
  GITIGNORE_CONTENT=$CUSTOM_EXCEPTIONS
else
  echo "Invalid choice. Skipping .gitignore."
  GITIGNORE_CONTENT=""
fi

# Ask if the repositories should be public or private
echo "Do you want the repositories to be public or private?"
echo "1. Public"
echo "2. Private"
read -rp "Enter your choice (1/2): " REPO_VISIBILITY_CHOICE

if [[ "$REPO_VISIBILITY_CHOICE" == "1" ]]; then
  REPO_VISIBILITY="public"
elif [[ "$REPO_VISIBILITY_CHOICE" == "2" ]]; then
  REPO_VISIBILITY="private"
else
  echo "Invalid choice. Defaulting to private."
  REPO_VISIBILITY="private"
fi
if [[ "$REPO_VISIBILITY" != "public" && "$REPO_VISIBILITY" != "private" ]]; then
  echo "Invalid choice. Defaulting to private."
  REPO_VISIBILITY="private"
fi

# Navigate to the base directory
cd "$BASE_DIR" || { echo "The directory $BASE_DIR does not exist. Exiting."; exit 1; }

# Loop through each folder in the base directory
for dir in */; do
  # Check if the item is a directory
  if [ -d "$dir" ]; then
    echo "Processing folder: $dir"

    # Navigate into the folder
    cd "$BASE_DIR/$dir" || continue

    # Remove any existing Git repository
    if [ -d ".git" ]; then
      echo "Removing existing .git directory in $dir"
      rm -rf .git
    fi

    # Initialize a new Git repository
    git init

    # Configure user details
    git config user.name "$GITHUB_USER"
    git config user.email "$GITHUB_EMAIL"

    # Create a .gitignore file if requested
    if [[ -n "$GITIGNORE_CONTENT" ]]; then
      echo -e "$GITIGNORE_CONTENT" > .gitignore
      git add .gitignore
    fi

    # Add all files to the repository
    git add .
    git commit -m "Initial commit for $dir"

    # Extract the folder name as the repository name
    REPO_NAME=$(basename "$dir" | tr ' ' '-' | tr -cd '[:alnum:]-')

    # Create the repository on GitHub
    gh repo create "$GITHUB_USER/$REPO_NAME" --$REPO_VISIBILITY --source=. --remote=origin --push

    # Return to the base directory
    cd "$BASE_DIR" || exit
  fi
done

echo "All folders have been successfully uploaded to GitHub!"
