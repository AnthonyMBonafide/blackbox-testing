#!/bin/bash

COLLECTION_PATH="postman-test/collections/core-data-cleaner.postman_collection.json"
ENV_PATH="postman-test/environment/core-data.postman_environment.json"


echo "Info: Clean Coredata's test data."

newman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: Coredata's test data Cleaned"
