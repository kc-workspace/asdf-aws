#!/usr/bin/env bash

## User utility functions
## This will load on very beginning of the scripts
## so make sure that you only define functions

download_filename() {
  local ns="download-file.utils"
  kc_asdf_is_linux &&
    printf "awscli-exe-linux-x86_64.zip" &&
    return 0
  kc_asdf_is_darwin &&
    printf "AWSCLIV2.pkg" &&
    return 0
  kc_asdf_error "$ns" "not support os name %s" "$KC_ASDF_OS"
  return 1
}

_kc_asdf_custom_enabled_features() {
  local ns="feature-custom.utils"
  local feature="$1"

  ## GPG are not support on MacOS
  if [[ "$feature" == "gpg" ]] && kc_asdf_is_darwin; then
    return 1
  fi

  return 0
}
