#!/bin/bash

COLLECTION_PATH="postman-test/collections/support-notifications.postman_collection.json"
ENV_PATH="postman-test/environment/support-notification.postman_environment.json"

echo "Info: Initiating Support Notifications Test."

echo "[info] ---------- use docker-compose run newman ----------"

newman run ${COLLECTION_PATH} --folder="subscription" --iteration-data="postman-test/data/subscriptionData.json"  --environment=${ENV_PATH} --reporters="junit,cli"
newman run ${COLLECTION_PATH} --folder="notification" --iteration-data="postman-test/data/notificationData.json"  --environment=${ENV_PATH} --reporters="junit,cli"
newman run ${COLLECTION_PATH} --folder="transmission" --iteration-data="postman-test/data/transmissionData.json"  --environment=${ENV_PATH} --reporters="junit,cli"
newman run ${COLLECTION_PATH} --folder="ping"  --environment=${ENV_PATH} --reporters="junit,cli"
