#!/usr/bin/env bash
set -euxo pipefail

gvim -V1 -f -T xterm-256color -E -n -u ci/init.vim -S ci/"$1".vim ci/vimcolors.rb
sleep 3
[ -e dist/"$1".html ]
