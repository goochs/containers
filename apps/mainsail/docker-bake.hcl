target "docker-metadata-action" {}

variable "APP" {
  default = "mainsail"
}

variable "VERSION" {
  // renovate: datasource=github-releases depName=mainsail-crew/mainsail
  default = "v2.14.0"
}

variable "SOURCE" {
  default = "https://github.com/mainsail-crew/mainsail"
}

group "default" {
  targets = ["image-local"]
}

target "image" {
  inherits = ["docker-metadata-action"]
  args = {
    VERSION = "${VERSION}"
  }
  labels = {
    "org.opencontainers.image.source" = "${SOURCE}"
  }
}

target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
  tags = ["${APP}:${VERSION}"]
}

target "image-all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]
}
