#!/usr/bin/env bash

# Add the following to use a controlled redis host for sidekiq
# -e "REDIS_HOST=192.168.1.100" \
# -e "REDIS_PORT=6379"\

source ./vars.sh

set -e
# Check to see if the running user can even talk to docker.
docker ps 2>&1 >/dev/null

DOCKER_EXISTS=$(docker inspect gitlab 2>&1 >/dev/null; echo $?)
DOCKER_RUNNING=$(docker ps | grep gitlab 2>&1 >/dev/null; echo $?)

if [ "$DOCKER_EXISTS" = "0" ]; then
    if [ "$DOCKER_RUNNING" = "0" ]; then
        echo "Gitlab docker container is already running. Aborting."
        exit 1
    fi
    printf "Gitlab container is stopped, starting with previous settings..."
    docker start gitlab >/dev/null
    echo "started."
else
    echo
    echo "Using the following variables to configure gitlab:"
    glDumpEnv
    echo
    echo "Starting gitlab..."

    docker run --name=gitlab -d -h $GITLAB_HOST \
        -v $GITLAB_DATA_PATH:/home/git/data \
        -p $GITLAB_SSH_PORT:22 \
        -p $GITLAB_WEB_PORT:80 \
        -e "DB_HOST=$DB_HOST" \
        -e "DB_NAME=$DB_NAME" \
        -e "DB_USER=$DB_USER" \
        -e "DB_PASS=$DB_PASS" \
        -e "GITLAB_HOST=$GITLAB_HOST" \
        -e "GITLAB_EMAIL=gitlab@$GITLAB_HOST" \
        -e "GITLAB_SUPPORT=support@$GITLAB_HOST" \
        -e "SMTP_DOMAIN=$GITLAB_DOMAIN" \
        -e "SMTP_HOST=$SMTP_HOST" \
        -e "SMTP_PORT=$SMPT_PORT" \
        -e "SMTP_USER=$SMTP_USER" \
        -e "SMTP_PASS=$SMTP_PASS" \
        -e "SMTP_STARTTLS=false" \
        -e "SMTP_AUTHENTICATION=$SMTP_AUTH_METHOD" \
        sameersbn/gitlab:7.1.1
fi
echo "Please give the app a minute to spin up its rotors.."
exit 0
