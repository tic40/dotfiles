#!/bin/bash
cd "$(dirname "$0")"

mkdir -p ~/.ssh
cp ../ssh/config ~/.ssh/
cp ../ssh/github_tic40 ~/.ssh/
chmod 600 ~/.ssh/github_tic40
