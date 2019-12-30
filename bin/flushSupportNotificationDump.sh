#!/bin/bash

COLLECTION_PATH="postman-test/collections/support-notifications-cleaner.postman_collection.json"
ENV_PATH="postman-test/environment/support-notification.postman_environment.json"


echo "Info: Clean SupportNotification's test data."

newman run ${COLLECTION_PATH} --environment=${ENV_PATH}

echo "Info: SupportNotification's test data Cleaned"
