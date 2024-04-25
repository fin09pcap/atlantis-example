#!/bin/bash

set -ov pipefail

TF_WORKSPACE=${1:-}

env

export VAULT_SECRET_ID="$(vault unwrap -field=secret_id $WRAPPED_SECRET_ID_TOKEN)"
export VAULT_ROLE_ID="2389919d-d3df-348a-3a89-406cf0821287"
export VAULT_TOKEN="$(vault write -field=token auth/approle/login role_id=${VAULT_ROLE_ID} secret_id=${VAULT_SECRET_ID})"

function main() {
  local WORKSPACE=${1}
  cd ${WORKSPACE}
  terraform init -get=true
  terraform plan -out $(date -u +%m%dT%H%M%SZ).tfplan
}

main $TF_WORKSPACE