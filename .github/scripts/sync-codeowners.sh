#!/usr/bin/env bash

[[ "$RUNNER_DEBUG" == 1 ]] && set -x
[[ -o xtrace ]] && export RUNNER_DEBUG=1

echo "* @teutonet/developer"
echo "/images/actions-runner/ @teutonet/k8s"
echo "/images/teuto-course/ @teutonet/k8s"

