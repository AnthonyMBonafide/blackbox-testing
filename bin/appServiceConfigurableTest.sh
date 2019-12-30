#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="postman-test/collections/app-service-configurable.postman_collection.json"
ENV_PATH="postman-test/environment/app-service-configurable.postman_environment.json"

if [ -f $NAMESFILE ]; then

	. $NAMESFILE

else
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating AppServiceConfigurable Test."

echo "[info] ---------- use docker-compose run newman ----------"

newman run ${COLLECTION_PATH} \
    --environment=${ENV_PATH} --delay-request 500 --reporters="junit,cli"

echo "Info:AppServiceConfigurable Test Completed."
