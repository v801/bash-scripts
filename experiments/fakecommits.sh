#! /usr/bin/env bash

# exit immediately on non-zero exit status
set -e

## check dependencies - npx
checkDependency() {
  if ! [ -x "$(command -v npx)" ]; then
    printf "[!] Error: Unable to find $1.\n"
    exit 1
  fi
}

fakeCommits() {
  npx fake-git-history --commitsPerDay "4,26"
}

pushCommits() {
  cd my-history
  git remote add origin git@github.com:v801/fake-commit-history.git
  git push --set-upstream origin main --force
}

## print done message
showDoneMessage() {
  printf "[+] Done! Completed in ${SECONDS} seconds.\n"
}

## main function
main() {
  checkDependency
  fakeCommits
  pushCommits
  cleanUp
  showDoneMessage
}

main
