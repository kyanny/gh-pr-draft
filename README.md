# `gh pr-draft` GitHub CLI extension

Converts a pull request to draft.

## Installation

```
gh extension install kyanny/gh-pr-draft
```

## Usage

With a pull request number:

```
gh pr-draft 1234
```

Without a pull request number:

```
gh pr checkout 1234
gh pr-draft
```

To convert your pull request ready for review, you can use [`gh pr ready`](https://cli.github.com/manual/gh_pr_ready).

## Motivation

There is [a feature request](https://github.com/cli/cli/issues/2271) for the GitHub CLI but I can't wait it so that I created this script as a [GitHub CLI extension](https://github.blog/2021-08-24-github-cli-2-0-includes-extensions/).
