resource "dns_a_record_set" "pve_prod_1" {
  zone      = "home.kinzoku.dev."
  name      = "pve-prod-1"
  addresses = ["192.168.3.11"]
  ttl       = 3600
}

resource "dns_a_record_set" "pve_prod_2" {
  zone      = "home.kinzoku.dev."
  name      = "pve-prod-2"
  addresses = ["192.168.3.12"]
  ttl       = 3600
}

resource "dns_a_record_set" "nas_prod_1" {
  zone      = "home.kinzoku.dev."
  name      = "nas-prod-1"
  addresses = ["192.168.3.5"]
  ttl       = 3600
}

resource "dns_a_record_set" "sw_prod_1" {
  zone      = "home.kinzoku.dev."
  name      = "sw-prod-1"
  addresses = ["192.168.1.1"]
  ttl       = 3600
}
