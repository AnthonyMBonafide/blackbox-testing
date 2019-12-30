#!/bin/bash

COLLECTION_PATH="postman-test/collections/security-cleaner.postman_collection.json"
ENV_PATH="postman-test/environment/security.postman_environment.json"
DOCKER_NETWORK="edgex-network"

echo "Info: Clean Securityservice's test data."

newman run ${COLLECTION_PATH} --environment=${ENV_PATH}

docker run –-network=${DOCKER_NETWORK} edgexfoundry/docker-edgex-security-proxy-setup-go --init=false --userdel=jerry

echo "Info: Securityservice's test data Cleaned"
