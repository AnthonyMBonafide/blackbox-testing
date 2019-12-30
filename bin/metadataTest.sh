#!/bin/bash

NAMESFILE=$(dirname "$0")/files.sh

COLLECTION_PATH="postman-test/collections/core-metadata.postman_collection.json"
ENV_PATH="postman-test/environment/core-metadata.postman_environment.json"

if [ -f $NAMESFILE ]; then 

	. $NAMESFILE

else 
	echo "Error: Names file does not exist."
	exit $?

fi

echo "Info: Initiating Metadata Test."

echo "[info] ---------- use docker-compose run newman ----------"

echo "[info] ======================== Start run metaData test - addressable ========================"

newman run ${COLLECTION_PATH} \
    --folder="addressable" --iteration-data="postman-test/data/addressableData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"
    
newman run ${COLLECTION_PATH} \
    --folder="addressable_error_4xx" --iteration-data="postman-test/data/addressableData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"    

echo "[info] ======================== Start run metaData test - command ========================"

newman run ${COLLECTION_PATH} \
    --folder="command" --iteration-data="postman-test/data/commandData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"  

newman run ${COLLECTION_PATH} \
    --folder="command_error_4xx" --iteration-data="postman-test/data/commandData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"  

echo "[info] ======================== Start run metaData test - device ========================"

newman run ${COLLECTION_PATH} \
    --folder="device" --iteration-data="postman-test/data/deviceData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

newman run ${COLLECTION_PATH} \
    --folder="device_error_4xx" --iteration-data="postman-test/data/deviceData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

echo "[info] ======================== Start run metaData test - deviceprofile ========================"

newman run ${COLLECTION_PATH} \
    --folder="deviceprofile" --iteration-data="postman-test/data/deviceProfileData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

newman run ${COLLECTION_PATH} \
    --folder="deviceprofile_error_4xx" --iteration-data="postman-test/data/deviceProfileData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

echo "[info] ======================== Start run metaData test - devicereport ========================"

newman run ${COLLECTION_PATH} \
    --folder="devicereport" --iteration-data="postman-test/data/deviceReportData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

newman run ${COLLECTION_PATH} \
    --folder="devicereport_error_4xx" --iteration-data="postman-test/data/deviceReportData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

echo "[info] ======================== Start run metaData test - deviceservice ========================"

newman run ${COLLECTION_PATH} \
    --folder="deviceservice" --iteration-data="postman-test/data/deviceServiceData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

newman run ${COLLECTION_PATH} \
    --folder="deviceservice_error_4xx" --iteration-data="postman-test/data/deviceServiceData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

echo "[info] ======================== Start run metaData test - provisionwatcher ========================"

newman run ${COLLECTION_PATH} \
    --folder="provisionwatcher" --iteration-data="postman-test/data/provisionWatcherData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

newman run ${COLLECTION_PATH} \
    --folder="provisionwatcher_error_4xx" --iteration-data="postman-test/data/provisionWatcherData.json" --environment=${ENV_PATH} \
    --reporters="junit,cli"

echo "Info: Metadata Test completed."

