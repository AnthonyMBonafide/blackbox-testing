#!/bin/bash

COLLECTION_PATH="postman-test/collections/export-client-importer.postman_collection.json"
ENV_PATH="postman-test/environment/export-client.postman_environment.json"


echo "Info: import ExportClient's test data."

newman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: ExportClient's test data imported"
