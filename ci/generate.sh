#!/usr/bin/env bash
set -euxo pipefail

"$1" -V1 -f -T xterm-256color -E -n -u ci/init.vim -S ci/"$2".vim ci/vimcolors.rb
sleep 3
[ -e dist/"$2".html ]
