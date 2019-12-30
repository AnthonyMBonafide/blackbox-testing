#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="postman-test/collections/support-logging.postman_collection.json"
ENV_PATH="postman-test/environment/support-logging.postman_environment.json"

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Logging Test."

echo "[info] ---------- use docker-compose run newman ----------"

newman run ${COLLECTION_PATH} \
    --folder="logs" --iteration-data="postman-test/data/loggingData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

newman run ${COLLECTION_PATH} \
    --folder="logs_error_4xx" --iteration-data="postman-test/data/loggingData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

newman run ${COLLECTION_PATH} \
    --folder="ping" --iteration-data="postman-test/data/loggingData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

echo "Info:Command Test Completed."
