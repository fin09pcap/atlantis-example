resource "null_resource" "staging" {}
resource "null_resource" "staging-1" {}

data "vault_kv_secret_v2" "test" {
  mount = "app"
  name  = "staging/infra-ci/buildkite/v1.0.0/external-secret-operator/test-credentials"
}
resource "random_uuid" "vault_lookup" {
  keepers = {
    random_data = data.vault_kv_secret_v2.test.data.foo
  }
}

module "common" {
  source = "../../modules/common"
}