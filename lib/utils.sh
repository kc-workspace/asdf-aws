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
