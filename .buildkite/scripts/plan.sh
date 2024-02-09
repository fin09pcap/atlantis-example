#!/bin/bash

set -xo pipefail

TF_WORKSPACE=${1:-}

function main() {
  local WORKSPACE=${1}
  cd ${WORKSPACE}
  terraform init -get=true
  terraform plan -detailed-exitcode -out $(date -u +%m%dT%H%M%SZ).tfplan
}

main $TF_WORKSPACE