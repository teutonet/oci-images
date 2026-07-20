# teuto.net OCI Images

![Release](https://github.com/teutonet/oci-images/actions/workflows/release-image.yaml/badge.svg)

## Overview

teuto.net OCI container images. This repository is used to build and maintain container images for various open-source projects.

## Description

Published versions of these images are available on [GitHub Container Registry](https://github.com/orgs/teutonet/packages?repo_name=oci-images):

| Image | Platforms |
|-------|-----------|
| [teutonet/ckan](https://github.com/teutonet/oci-images/pkgs/container/oci-images%2Fckan) | amd64 |
| [teutonet/ckan-dcatapde](https://github.com/teutonet/oci-images/pkgs/container/oci-images%2Fckan-dcatapde) | amd64 |
| [teutonet/solr-ckan](https://github.com/teutonet/oci-images/pkgs/container/oci-images%2Fsolr-ckan) | amd64, arm64 |
| [teutonet/spilo](https://github.com/teutonet/oci-images/pkgs/container/oci-images%2Fspilo) | amd64 |
| [teutonet/qgis-server](https://github.com/teutonet/oci-images/pkgs/container/oci-images%2Fqgis-server) | amd64, arm64 |
| [teutonet/masterportal-v3](https://github.com/teutonet/oci-images/pkgs/container/oci-images%2Fmasterportal-v3) | amd64, arm64 |
| [teutonet/teuto-course](https://github.com/teutonet/oci-images/pkgs/container/oci-images%2Fteuto-course) | amd64 |
| [teutonet/cnpg](https://github.com/teutonet/oci-images/pkgs/container/oci-images%2Fcnpg) | amd64 |
| [teutonet/actions-runner](https://github.com/teutonet/oci-images/pkgs/container/oci-images%2Factions-runner) | amd64 |

## Usage

These images are hosted on the GitHub Container Registry (GHCR). You can pull and run them using Docker or any other OCI-compliant container runtime.

```bash
docker pull ghcr.io/teutonet/oci-images/<image>:<tag>
```

## Changelog & Releases

This repository keeps a change log using [GitHub's releases](https://github.com/teutonet/oci-images/releases) functionality.

Releases are based on [Semantic Versioning](https://semver.org/), and use the format of `MAJOR.MINOR.PATCH`. The version will be incremented based on the following:

* `MAJOR`: Incompatible or major changes
* `MINOR`: Backwards-compatible new features and enhancements
* `PATCH`: Backwards-compatible bugfixes and package updates

## License

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/license/MIT)

Licensed under the MIT License. See [LICENSE](LICENSE) file.

## Contact

Questions, issues, or suggestions regarding this pipeline? Reach out at info@teuto.net.