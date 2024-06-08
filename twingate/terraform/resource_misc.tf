resource "twingate_resource" "nova_admin" {
  name               = "nova"
  address            = "nova.home.kinzoku.dev"
  remote_network_id  = data.twingate_remote_network.net-prod-1.id
  security_policy_id = data.twingate_security_policy.policy-trusted.id

  protocols = {
    allow_icmp = true
    tcp = {
      policy = "ALLOW_ALL"
    }
    udp = {
      policy = "ALLOW_ALL"
    }
  }

  dynamic "access_group" {
    for_each = [
      twingate_group.admins.id
    ]
    content {
      group_id           = access_group.value
      security_policy_id = data.twingate_security_policy.policy-trusted.id
    }
  }

  is_active = true
}
