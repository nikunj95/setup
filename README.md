## Information on this repository.

[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)

- Code responsibly.
- Code with discipline.
- Code following commitizen guidelines.

This repository provide a `setup.sh` script to download commitlint, commitizen tool, standard-version and default readme.
This is helpful while starting with a new repository or continuing with an existing one.

- It will help you install husky tool to create a git hook that will help with commit linting.
- It will help you install commitizen tool that provides interactive tool to create commit messages in commitizen format.
- It will help you install standard-version tool to manage your releases provided your commits are in commitizen format.
- It will help you add contributor instructions to your readme if you are using the above tools.

**Download `setup.py` script and become a commitizen.**

---
## For Contributor

*Note:
This repo is commitizen friendly repo. Idea is to organize commits that is readable.
It uses husky for commitlint as a local git hook to ensure conventional commits messages are made.
It uses standard-version to group commits for releases. Changelog and release versions are updated.*

If you will be contributing to this repository then use script `setup.sh` to install:

- Husky for Commmitlint
- Commitizen tool to ensure commit are made in the right format
- Standard-version for releases.

*Note: To use Commitizen tool installed from `setup.sh` script use `npx cz` inplace of `git commit -m`.*
