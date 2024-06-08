resource "twingate_group" "all" {
  name = "All"

  user_ids = [
    data.twingate_user.kinzoku.id,
    data.twingate_user.admin.id
  ]
}

resource "twingate_group" "admins" {
  name = "Administrators"

  user_ids = [
    data.twingate_user.kinzoku.id,
    data.twingate_user.admin.id
  ]
}
