#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="postman-test/collections/support-rulesengine.postman_collection.json"
ENV_PATH="postman-test/environment/support-rulesengine.postman_environment.json"

if [ -f $NAMESFILE ]; then

	. $NAMESFILE

else
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Rulesengine Test."

echo "[info] ---------- use docker-compose run newman ----------"

newman run ${COLLECTION_PATH} \
    --folder="rules" --iteration-data="postman-test/data/rulesengineData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

newman run ${COLLECTION_PATH} \
    --folder="rules_error_5xx" --iteration-data="postman-test/data/rulesengineData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

newman run ${COLLECTION_PATH} \
    --folder="ping" --iteration-data="postman-test/data/rulesengineData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

echo "Info:Rulesengine Test Completed."