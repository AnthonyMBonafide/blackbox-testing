#!/bin/bash

COLLECTION_PATH="postman-test/collections/core-metadata-cleaner.postman_collection.json"
ENV_PATH="postman-test/environment/core-metadata.postman_environment.json"


echo "Info: Clean CoreMetadata's test data."

newman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: CoreMetadata's test data Cleaned"
