#!/usr/bin/env bash

if [ -n "$DEBUG" ]; then
	set -x
fi

set -o errexit
set -o nounset
set -o pipefail

copier -x template/** -x copier.yml -x *.py -x CHANGELOG.md \
  "$@" \
  -d generator=controller \
  -d nix=True \
  -d license=MIT \
  -d repo_url=https://github.com/fastapi-mvc/copier-controller \
  -d copyright_date=2022 \
  -a .generator.yml \
  update ./.
