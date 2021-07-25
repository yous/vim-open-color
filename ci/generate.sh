#!/usr/bin/env bash
set -euxo pipefail

gvim -T xterm-256color -E -n -u ci/init.vim -S ci/"$1".vim ci/vimcolors.rb >/dev/null
sleep 3
[ -e dist/"$1".html ]
