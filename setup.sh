#!/usr/bin/env bash
#
# Jacob Vallejo 2014
#
# Setup Gitlab on host
#
# Usage: DB_PASSWORD=dbpassword1 DB_HOST=162.219.98.78 ./setup.sh /opt/gitlab
#
source ./vars.sh
set -e

if [ $# -eq 1 ]; then
    GITLAB_DATA_PATH=$1;
fi

mkdir -p $GITLAB_DATA_PATH
echo
echo "Using the following variables to configure gitlab:"
glDumpEnv | tee $GITLAB_VARS
echo
echo "Initializing gitlab application..."

# Run rake tasks to prepare the app and run migrations
docker run --name=gitlab -i -t --rm  \
       -e "DB_HOST=$DB_HOST" \
       -e "DB_USER=$DB_USER" \
       -e "DB_PASS=$DB_PASS" \
       -e "DB_NAME=$DB_NAME" \
       -v $GITLAB_DATA_PATH:/home/git/data \
       sameersbn/gitlab:7.1.1 app:rake gitlab:setup

