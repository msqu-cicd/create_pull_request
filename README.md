
# Forgejo Create Pull Request Action

This is a custom action which glues together the right commands to create
a pull request from changes in Forgejo Actions. The existing Github Create
Pull Request action does not work with Forgejo due to incompatibilities in
the API code.

This repo is mostly a mirror of my local copy in private git repo that I
wanted to share with others.

## Usage

Add the following workflow to your repository:


```yaml
name: Create Pull Request
on:
  push:
    branches:
      - feature/**  # or your desired branch pattern

jobs:
  create-pr:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Create Pull Request
        uses: https://github.com/maxking/forgejo-create-pr@main
        with:
          # required
          token: ${{ secrets.GH_TOKEN }}
          # optional
          base: 'main'
          add-paths: '.'
          commit-message: 'feat: automated changes'
          pr-title: 'feat: new automated changes'
          pr-body: 'This PR contains automated changes'
          pr-condition-cmd: 'git status --porcelain'
```
## Inputs

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `base` | Base branch to create PR against | Yes | `main` |
| `token` | PAT for creating PR | Yes | - |
| `add-paths` | Paths to add to commit | No | `.` |
| `commit-message` | Commit message | No | `Automated commit` |
| `pr-title` | PR title | No | `Automated PR` |
| `pr-body` | PR body | No | `Automated PR` |
| `pr-condition-cmd` | Command to check if PR should be created | No | `git status --porcelain` |
| `pr-branch` | Branch to create PR against | No | `automated-pr` |
| `commit-user` | Commit user | No | `Forgejo Bot` |
| `commit-email` | Commit email | No | `forgejo@users.noreply.git` |


## License
The code in this repo is licensed under Apache 2.0. See the LICENSE file for details.
