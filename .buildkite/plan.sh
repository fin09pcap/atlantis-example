#!/bin/bash

set -xo pipefail

TF_WORKSPACE=${1:-}

function main() {
  local WORKSPACE=${1}
  cd ${WORKSPACE}
  terraform init -get=true
  terraform plan -detailed-exitcode -out
}

main $TF_WORKSPACE