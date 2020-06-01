#!/bin/bash

export GITLAB_USERNAME=$(ssh git@gitlab.com 2>&1 | grep GitLab | cut -d ' ' -f 4 | sed 's/^.\(.*\).$/\1/')
export GITHUB_USERNAME=$(ssh github 2>&1 | grep GitHub | cut -d ' ' -f 2 | sed 's/^\(.*\).$/\1/')
