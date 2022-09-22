# Update on September 22, 2022

Since [v2.16.0](https://github.com/cli/cli/releases/tag/v2.16.0), GitHub CLI officially supports making a pull request draft.

    gh pr ready 123 --undo

While the command syntax is different, it would be better using the builtin function, so I archive this repository.

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

There <s>is</s> was [a feature request](https://github.com/cli/cli/issues/2271) for the GitHub CLI but I <s>can't</s> couldn't wait it so that I created this script as a [GitHub CLI extension](https://github.blog/2021-08-24-github-cli-2-0-includes-extensions/).
