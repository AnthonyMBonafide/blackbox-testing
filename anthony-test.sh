#!/bin/sh
make -C /home/anthony/GoLandProjects/edgex-go build
make -C /home/anthony/GoLandProjects/edgex-go run &
MAKE_RUN_PID=$!

echo $MAKE_RUN_PID

. ./bin/env.sh

docker-compose up -d consul volume vault vault-worker kong-db kong-migration kong edgex-proxy mongo rulesengine device-virtual

# Run all tests. Tests for device virtual and rules engine have been removed due to networking issues hardcoded in the Docker image. See run.sh file comments for more details.
rm -f ./bin/testResult/*

./bin/run.sh -all
NEWMAN_STATUS=$?

kill $MAKE_RUN_PID

pkill -f edgex

docker-compose down

echo "DONE"
