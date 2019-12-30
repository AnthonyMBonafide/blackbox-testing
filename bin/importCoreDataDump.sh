#!/bin/bash

COLLECTION_PATH="postman-test/collections/core-data-importer.postman_collection.json"
ENV_PATH="postman-test/environment/core-data.postman_environment.json"


echo "Info: import Coredata's test data."

newman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: Coredata's test data imported"
