---
title: A replacement method for inaccurate date display in Mkdocs-material
tags:
  - Mkdocs
  - material
  - Python
  - Vercel
categories:
  - 技术教程
cover: "https://img2.imgtp.com/2024/05/01/w6bIr0g4.png"
abbrlink: fa88f28c
date: 2024-04-30 23:25:19
---

There is another Chinese translation for this article：https://blog.w1ndys.com/posts/512a6b20

## Question background.

After a deployment to Vercel, the date display was found to be inaccurate.

I asked the community for help, details can be seen: https://github.com/squidfunk/mkdocs-material/discussions/6924/, finally found that Vercel does not support this operation, so after two weeks of testing, I found a replacement solution.

The specific idea is to add a text of time information at the bottom of each Markdown file, and use Python script + automated workflow to automatically update the date.
This scheme is suitable for:

- deploy to material sites on the Vercel platform.

- document repository uses GitHub.

- the submission record of the document repository is synchronized with the content of the document

## Solution

Reference repository: https://github.com/W1ndys/Easy-QFNU

### Python script

```python
import re
import datetime
import os
import requests

# Get the create and update time of the file from the repository
def get_github_file_info(repo_owner, repo_name, file_path, github_token):
    api_url = f"https://api.github.com/repos/{repo_owner}/{repo_name}/commits?path={file_path}"
    headers = {"Authorization": f"token {github_token}"}
    response = requests.get(api_url, headers=headers)
    if response.status_code == 200:
        commits = response.json()
        if commits:
            create_time = datetime.datetime.fromisoformat(
                commits[-1]["commit"]["committer"]["date"].replace("Z", "+00:00")
            ).strftime("%Y-%m-%d")
            update_time = datetime.datetime.fromisoformat(
                commits[0]["commit"]["committer"]["date"].replace("Z", "+00:00")
            ).strftime("%Y-%m-%d")
            return create_time, update_time
        else:
            print("No submission record found for", file_path)
    else:
        print(f"ERROR：{response.status_code} - {response.text}")
    return None, None

# Get the relative path of the file from the docs directory
def get_relative_path_from_docs(file_path):
    return "docs/" + file_path.split("docs/", 1)[-1] if "docs/" in file_path else None

# Update the date of the Markdown file
def update_markdown_files(dir_path, exclude_paths, repo_owner, repo_name, github_token):
    for root, dirs, files in os.walk(dir_path):
        dirs[:] = [d for d in dirs if os.path.join(root, d) not in exclude_paths]
        for file in files:
            file_path = os.path.join(root, file)

            # Exclude files that do not need to be updated
            if file_path in exclude_paths:
                print(f"Skipping excluded file：{file_path}")
                continue

            # Only update Markdown files
            if file.endswith(".md"):
                file_path = file_path.replace("\\", "/")  # The path separator is unified as /
                relative_path = get_relative_path_from_docs(file_path) # Get the relative path of the file from the docs directory
                if relative_path is None:
                    print(f"Skipping non-docs file：{file_path}")
                    continue
                create_time, update_time = get_github_file_info(
                    repo_owner, repo_name, relative_path, github_token
                )
                print("-----------------------------------------------------------")
                print(f"Now processing file：{relative_path}\n")
                print(f"Create date:{create_time}，Update date:{update_time}\n")

                # Get the date information from the Markdown file of the repository
                if create_time is None or update_time is None:
                    print(f"{file_path} No submission record found, skipping")
                    continue
                with open(file_path, "r+", encoding="utf-8") as f:
                    lines = f.readlines()
                    has_update_date = False
                    has_create_date = False
                    for line in lines:
                        if re.match(
                            r':material-clock-edit-outline:{ title="Modification date" } \d{4}-\d{2}-\d{2}',
                            line.strip(),
                        ):
                            has_update_date = True
                        elif re.match(
                            r':material-clock-plus-outline:{ title="Creation date" } \d{4}-\d{2}-\d{2}',
                            line.strip(),
                        ):
                            has_create_date = True

                    # If there is already a date, update it
                    if has_update_date and has_create_date:
                        for i in range(len(lines)):
                            if re.match(
                                r':material-clock-edit-outline:{ title="Modification date" } \d{4}-\d{2}-\d{2}',
                                lines[i].strip(),
                            ):
                                if (
                                    lines[i].strip()
                                    == f':material-clock-edit-outline:{{ title="Modification date" }} {update_time}'
                                ):
                                    print(f"{file_path} The date is up to date.")
                                    break
                                else:
                                    lines[i] = (
                                        f':material-clock-edit-outline:{{ title="Modification date" }} {update_time}\n'
                                    )
                                    f.seek(0)
                                    f.writelines(lines)
                                    print(
                                        f"{file_path} The date has been modified, and the modified date is:{update_time}"
                                    )
                                    break
                    # If there is no date, add it to the end of the file
                    else:
                        lines.extend(
                            [
                                f'\n\n---\n\n:material-clock-edit-outline:{{ title="Modification date" }} {update_time}\n:material-clock-plus-outline:{{ title="Creation date" }} {create_time}\n'
                            ]
                        )
                        f.seek(0)
                        f.writelines(lines)
                        print(f"{file_path} No date, added")
                print("-----------------------------------------------------------")


if __name__ == "__main__":
    docs_dir = os.path.join(os.getcwd(), "docs")

    # Exclude directories or files that do not need to be updated
    exclude_paths = [
        os.path.join(docs_dir, "example_file.md"),
        os.path.join(docs_dir, "example_directory"),
    ]
    repo_owner = "repo_owner" # Change here to the owner of the repository
    repo_name = "repo_name" # Change here to the name of the repository

    github_token = os.environ.get("GITHUB_TOKEN")

    update_markdown_files(docs_dir, exclude_paths, repo_owner, repo_name, github_token)
```

### GitHub Actions

Use GitHub Actions to automate deployment and execute scripts automatically every time push arrives at the repository, at a fixed time, and when triggered manually.

```yml
name: Update-docs

on:
  push:
    branches:
      - main # push to main branch
  schedule:
    - cron: "0 17 * * *" # Every day at 5:00 PM (UTC+8)
  workflow_dispatch:

permissions:
  contents: write

jobs:
  update-docs:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2

      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: "3.11.4"

      - name: Install dependencies
        run: pip install requests

      - name: Run Python script
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        run: python update-docs.py #  Change here to the name of the Python script file

      - name: Add changes to git
        run: |
          git add .

      - name: Commit and push changes
        uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: Update docs date #  Change here to the commit message
```

## Note

The Python script is placed in the root directory of the Github repository and named `update-docs.py` (the name can be customized, but note that it also needs to be modified in the corresponding location of the workflow).

You need to modify the variables in the Python script to define your repository owner and repository name, and the script will get API based on this.

Other notes:
I come from China, my English level is not very good, some of the above documents are obtained through translation software, if there are any description errors, please forgive me, and point out the corrections in time.

## Acknowledgements

1. [Mkdocs-material](https://squidfunk.github.io/mkdocs-material/)

   Thanks to the developers of the framework

2. [W1ndys](https://github.com/W1ndys)

   My code ability is not high, with the help of ChatGPT, completed the implementation of this script, which really cost me too much time and energy, I want to thank myself

3. [ChatGPT](https://chat.openai.com/)

   A powerful language model for text generation, which can be used to generate text based on the input text, which is very useful for this script.
