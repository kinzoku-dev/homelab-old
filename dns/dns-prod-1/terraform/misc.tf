resource "dns_a_record_set" "nova" {
  zone      = "home.kinzoku.dev."
  name      = "nova"
  addresses = ["192.168.1.10"]
  ttl       = 3600
}
