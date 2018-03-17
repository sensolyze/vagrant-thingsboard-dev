storage "file" {
  path = "/vagrant/files/apps/vault/secret-data"
}

listener "tcp" {
 address     = "127.0.0.1:8200"
 tls_disable = 1
}
