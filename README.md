# gh-pr-draft
Converts a pull request to draft.

## Prerequisites

- [Ruby](https://www.ruby-lang.org/)
- [GitHub CLI](https://cli.github.com/) with authentication
- [graphqurl](https://github.com/hasura/graphqurl)
- [jq](https://stedolan.github.io/jq/)

## Installation

For bash

```
cat gh-pr-draft.bash >> ~/.bashrc
. ~/.bashrc
```

For zsh

```
cat gh-pr-draft.bash >> ~/.zshrc
. ~/.zshrc
```

## Usage

```
cd your_github_repo
git checkout your_pull_request_branch

gh-pr-draft
```

To convert your pull request ready for review, you can use [`gh pr ready`](https://cli.github.com/manual/gh_pr_ready).

## Motivation

There is [a feature request](https://github.com/cli/cli/issues/2271) for the GitHub CLI but I can't wait it so that I created this tiny shell function.
