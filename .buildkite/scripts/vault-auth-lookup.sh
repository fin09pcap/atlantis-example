#!/bin/bash

export VAULT_SECRET_ID="$(vault unwrap -field=secret_id $WRAPPED_SECRET_ID_TOKEN)"
export VAULT_ROLE_ID="2389919d-d3df-348a-3a89-406cf0821287"
export VAULT_TOKEN="$(vault write auth/approle/login -field=token role_id=${VAULT_ROLE_ID} secret_id=${VAULT_SECRET_ID})"
export TF_VAR_vault_addr=$VAULT_ADDR

echo "VAULT Login complete"
