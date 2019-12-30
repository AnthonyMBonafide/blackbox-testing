#!/bin/bash


COLLECTION_PATH="postman-test/collections/system-management.postman_collection.json"
ENV_PATH="postman-test/environment/system-management.postman_environment.json"

echo "Info: Initiating System Management Test."

echo "[info] ---------- use docker-compose run newman ----------"

newman run ${COLLECTION_PATH} --environment=${ENV_PATH}
