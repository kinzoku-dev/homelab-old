resource "twingate_resource" "pve-prod-1_admin" {
  name               = "pve-prod-1"
  address            = "pve-prod-1.home.kinzoku.dev"
  remote_network_id  = data.twingate_remote_network.net-prod-1.id
  security_policy_id = data.twingate_security_policy.policy-trusted.id

  protocols = {
    allow_icmp = true
    tcp = {
      policy = "RESTRICTED"
      ports  = ["8006", "22"]
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

resource "twingate_resource" "pve-prod-2_admin" {
  name               = "pve-prod-2"
  address            = "pve-prod-2.home.kinzoku.dev"
  remote_network_id  = data.twingate_remote_network.net-prod-1.id
  security_policy_id = data.twingate_security_policy.policy-trusted.id

  protocols = {
    allow_icmp = true
    tcp = {
      policy = "RESTRICTED"
      ports  = ["8006", "22"]
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
