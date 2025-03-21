resource "dockerhub_repository" "repos" {
  for_each = toset(var.repositories)

  name        = each.key
  namespace = var.docker_username
  description = "Repository for ${each.key} images"
}