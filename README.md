# Bulk Projects Uploader Script

A Bash script to upload multiple folders as individual repositories to GitHub. This script is designed to automate creating Git repositories for each folder in a specified directory, setting up `.gitignore` rules, and pushing them to GitHub.

---

## Features

- Automatically creates a Git repository for each folder inside a specified base directory.
- Allows you to:
  - Use a predefined `.gitignore` preset.
  - Add custom `.gitignore` exceptions.
- Configures user name and email for each repository.
- Pushes each folder as a separate repository to GitHub.
- Removes any existing `.git` folders to ensure clean initialization.

---

## Requirements

- **Git**
- **GitHub CLI (`gh`)**
- **Bash Shell**

---

## How to Get Your GitHub Email

If you have the **"Keep my email address private"** option enabled on GitHub, you will need to use the email format provided by GitHub (e.g., `12345678+username@users.noreply.github.com`).

### Steps to Find Your GitHub Email:

1. Go to your [GitHub Email Settings](https://github.com/settings/emails).
2. Under the **"Email address privacy"** section, check for your `no-reply` email address.
    It will look like: `12345678+username@users.noreply.github.com`
3. Use this email address when prompted by the script.

---

## Usage

1. Clone or download this repository.
2. Open your terminal and navigate to the directory containing `BPU.sh`.
3. Make the script executable:
```bash
chmod +x BPU.sh
