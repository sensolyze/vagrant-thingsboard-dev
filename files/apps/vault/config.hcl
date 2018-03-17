storage "file" {
  path = "/vagrant/files/apps/vault/secret-data"
}

listener "tcp" {
  tls_disable = 1
}
