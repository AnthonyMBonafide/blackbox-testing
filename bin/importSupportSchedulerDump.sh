#!/bin/bash

COLLECTION_PATH="postman-test/collections/support-scheduler-importer.postman_collection.json"
ENV_PATH="postman-test/environment/support-scheduler.postman_environment.json"


echo "Info: import Support Scheduler's test data."

newman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: Support Scheduler's test data imported"