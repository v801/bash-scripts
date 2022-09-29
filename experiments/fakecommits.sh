#! /usr/bin/env bash

## generate a full looking git contribution graph just for funsies
## requires git plus node.js for npx
## uses github.com/artiebits/fake-git-history

# exit immediately on non-zero exit status
set -e

## check dependencies - npx
checkDependency() {
  if ! [ -x "$(command -v npx)" ]; then
    printf "[!] Error: Unable to find $1.\n"
    exit 1
  fi
}

## generate fake commits
fakeCommits() {
  npx fake-git-history --commitsPerDay "4,26"
}

## move into directory and push commits
pushCommits() {
  cd my-history
  git remote add origin git@github.com:v801/fake-commit-history.git
  git push --set-upstream origin main --force
}

## print done message
showDoneMessage() {
  printf "[+] Done! Completed in ${SECONDS} seconds.\n"
}

## main
main() {
  checkDependency
  fakeCommits
  pushCommits
  showDoneMessage
}

## run main
main
