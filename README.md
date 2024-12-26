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
- Supports creating repositories as **public** or **private** based on user preference.
- Automatically replaces spaces in folder names with `-` to create valid GitHub repository names.

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
   ```
4. Run the script:
   ```bash
   ./BPU.sh
   ```
   Or if you encounter a permission issue, run:
   ```bash
   bash BPU.sh
   ```

5. Follow the prompts:
   - Enter the **base directory path** containing the folders you want to upload.
   - Enter your **GitHub username** and **GitHub email**.
   - Choose whether to use a `.gitignore` file:
     - **Default Preset**: Excludes common files like `*.mp4`, `*.zip`, `node_modules/`, etc.
     - **Custom Exceptions**: Allows you to define your own rules for `.gitignore`.
   - Select whether the repositories should be **public** or **private**.

---

## Example

Here’s an example of how the script works:

1. Suppose your base directory `/projects/` contains the following folders:
   ```
   /projects/
     my project/
     another_project/
     final project/
   ```

2. The script will:
   - Rename folders with spaces to valid repository names:
     - `my project` -> `my-project`
     - `final project` -> `final-project`
   - Initialize a Git repository in each folder.
   - Configure GitHub username and email.
   - Optionally create and apply a `.gitignore` file.
   - Create a corresponding repository on GitHub (e.g., `username/my-project`).
   - Push all files (except those excluded by `.gitignore`) to GitHub.

---

## Default `.gitignore` Preset

The default `.gitignore` preset excludes the following:

- Common large files:
  - `*.mp4`, `*.pdf`, `*.zip`, `*.rar`, `*.ai`, `*.psd`, `*.indd`, `*.idml`
- Node.js-related files:
  - `node_modules/`, `.env`, `.npm/`, `logs/`, `dist/`, `coverage/`
- Development files:
  - `.vscode/`

---

## Notes

- Ensure you have the necessary permissions to create repositories on your GitHub account.
- For private repositories, the script uses GitHub CLI to automate the process. Make sure `gh` is configured properly.
- The script uses `--force` with `git push` to overwrite any existing data. Be cautious when re-uploading projects.

---

## Contributing

Feel free to fork this repository and submit pull requests for improvements or bug fixes.

---

## License

This script is open-source and available under the [MIT License](LICENSE).
