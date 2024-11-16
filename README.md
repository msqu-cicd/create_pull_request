
# Create Pull Request Action

Automatically create pull requests with customizable titles, bodies, and labels.

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
        uses: your-username/create-pr-action@v1
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
