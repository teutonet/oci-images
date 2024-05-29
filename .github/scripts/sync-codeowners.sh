#!/usr/bin/env bash

[[ "$RUNNER_DEBUG" == 1 ]] && set -x
[[ -o xtrace ]] && export RUNNER_DEBUG=1

echo "* @teutonet/oci-images"