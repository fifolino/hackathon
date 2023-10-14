#!/bin/bash

resources=$(echo $PATH | tr ':' '\n' | grep 'Docker');
docker="$(dirname "$(dirname "$resources")")";

rootPath=$(pwd);

function start(){

    echo "Select Option:";
    echo "1: Install Packages";
    echo "2: Delete node_modules";
    echo "3: Docker Compose Up";
    echo "4: Docker Compose Down";

    read -n1 -s;

    if [[ "$REPLY" -eq 1 ]]; then
        install;
    elif [[ "$REPLY" -eq 2 ]]; then
        delete;
    elif [[ "$REPLY" -eq 3 ]]; then
        buildDocker;
    elif [[ "$REPLY" -eq 4 ]]; then
        downDocker;
    else
        echo "Writring error...Retry";
        start;
    fi
}

function install()
{
    mkdir "bdd";
    for dir in */; do
        cd $rootPath/$dir
        if [ -f "package.json" ]; then
            pwd
            npm install;
        fi
    done
    echo "Install Done";
}

function delete()
{
    for dir in */; do
        cd $rootPath/$dir
        if [ -d "node_modules" ]; then
            pwd
            sudo rm -rf node_modules;
        fi
    done
    echo "Delete Done";
}

function buildDocker()
{
    if ! docker --version > /dev/null 2>&1; then
        "$docker/Docker Desktop.exe" &
        echo "Please Wait...";
        sleep 30;
    fi
    echo "Docker Start";
    cd $rootPath;
    if [ -f "docker-compose.yml" ]; then
        pwd
        docker-compose up -d;
    fi
}

function downDocker()
{
    if ! docker --version > /dev/null 2>&1; then
        "$docker/Docker Desktop.exe" &
        echo "Please Wait...";
        sleep 30;
    fi
    echo "Docker Down";
    cd $rootPath;
    if [ -f "docker-compose.yml" ]; then
        pwd
        docker-compose down;
    fi
}

start;
