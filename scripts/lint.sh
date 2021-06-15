#!/bin/bash -xe

PACKAGES=(
  "./packages/configuration-validation"
  "./packages/jwt-verifier"
  "./packages/oidc-middleware"
)

for PACKAGE in "${PACKAGES[@]}"
do
    pushd $PACKAGE
    yarn lint
    if [ $? -ne 0 ]; then
        echo "------- [ERROR] Lint failures in $PACKAGE -------"
        exit 1
    fi
    popd
done