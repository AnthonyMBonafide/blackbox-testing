#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="postman-test/collections/export-client.postman_collection.json"
ENV_PATH="postman-test/environment/export-client.postman_environment.json"

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Export-Client Test."

echo "[info] ---------- use docker-compose run newman ----------"

newman run ${COLLECTION_PATH} \
    --folder="registration" --iteration-data="postman-test/data/exportClientData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

newman run ${COLLECTION_PATH} \
    --folder="registration_error_4xx" --iteration-data="postman-test/data/exportClientData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"
    
newman run ${COLLECTION_PATH} \
    --folder="ping" --iteration-data="postman-test/data/exportClientData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

echo "Info: Export-Client Test Completed."
