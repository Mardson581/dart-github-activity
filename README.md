
# GitHub User Activity with Dart

A Dart app to fetch the user's recent activity using the GitHub API, and display it in the terminal. A challenge from https://roadmap.sh/projects/github-user-activity


## Usage/Examples

First, you'll need to build the app with:
```bash
dart build cli
```

Then, run the application using
```bash
dart_github_activity <username>
```
or
```bash
dart_github_activity <username> <page number> # with 15 records per page
```

Usage example:
```bash
dart_github_activity "Mardson581"

- Output
Mardson581 pushed to Mardson581/dart-github-activity
Mardson581 pushed to Mardson581/dart-github-activity
Mardson581 pushed to Mardson581/dart-github-activity
...
```
