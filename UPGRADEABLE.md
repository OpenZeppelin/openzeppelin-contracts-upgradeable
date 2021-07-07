# Technical notes about the Upgradeable repository

## [Branches](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/branches)

### `upstream-patched`

Contains a patched version of the vanilla Contracts repo. It adds the scripts to transpile and GitHub Actions for it to work automatically, changes the package name, etc.

Eventually it may also include small changes to the Solidity code, such as reordering of state variables, in order to ensure storage compatibility.

It's an important goal that this branch should be easy to merge with the vanilla Contracts repo, avoiding merge conflicts as much as possible. This is necessary to reduce manual intervention and ensure automation runs smoothly.

### `master`

Contains the actual transpiled code, which is generated automatically based on `upstream-patched`. The contents of this branch should never be manually changed, because they will be overwritten automatically with the transpiled version of `upstream-patched`. Instead, changes should be made in `upstream-patched`.

### `upstream-v3.2.0-patched`, `release-v3.2.0`

I created thes branches in order to release `v3.2.0`, because the `master` branch was already ahead. The first is vanilla v3.2.0 with `upstream-patched` rebased onto it. The second is the transpiled version built using the script shown below.

## [Actions Workflows](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/actions)

### [Merge upstream](/.github/workflows/merge-upstream.yml)

All this does is fetch the latest changes from vanilla Contracts repo, tries to merge them into `upstream-patched`, and then pushes the updated branch. If the merge has conflicts, the worfklow will fail. We should be notified of this so that we can manually run the merge and resolve the conflicts. This should not happen often.

Runs on a schedule every morning. Can also be triggered manually from the Actions page.

### [Transpile](/.github/workflows/transpile.yml)

Runs every time `upstream-patched` is pushed to (for example as part of the Merge upstream workflow), transpiles the contents of that branch, and pushes the results as a new commit on the `master` branch.

### [Test](/.github/workflows/test.yml)

Runs normal Contracts tests on the `master` and `release-v*` branches.

## Scripts

### `transpile-onto.sh`

```
bash scripts/upgradeable/transpile-onto.sh <target> [base]
```

Transpiles the contents of the current git branch and commits the result as a new commit on branch `<target>`. If branch `<target>` doesn't exist, it will copy the commit history of `[base]` (this is used in GitHub Actions, but is usually not necessary locally).

This script can be used manually to build transpiled versions of specific commits, or branches other than the `master` Contracts branch.
