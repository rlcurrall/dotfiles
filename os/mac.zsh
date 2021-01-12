#!/bin/bash

alias storm='open -a "PhpStorm.app"'

function phvm() {
  installedPhpVersions=("php")
  brew ls --versions \
    | rg -o 'php@[0-9].[0-9]' \
    | uniq \
    | sort \
    | while IFS="" read -r line; do installedPhpVersions+=("$line"); done

  allowedVersions=("default")
  brew ls --versions \
    | rg -o 'php@[0-9].[0-9]' \
    | rg -o "[0-9].[0-9]" \
    | uniq \
    | sort \
    | while IFS="" read -r line; do allowedVersions+=("$line"); done

  version=${1:-default}

  printf "Switching to php version: %s\n" "$version"

  if [[ ! "${allowedVersions[*]}" =~ ${version} ]]; then
    printf "Invalid php version %s\n" "$version"
    return 1
  fi

  for phpVersion in ${installedPhpVersions[*]}; do
    brew unlink "$phpVersion"
  done

  if [ "$version" = 'default' ]; then
    brew link php
  else
    brew link "php@${version}"
  fi
}
