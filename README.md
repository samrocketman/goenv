# Go Dev Environment

A simple go development environment for my Desktop Linux machines.

> **WARNING:** this environment gets set up with my personal dotfiles including
> git author settings.

# Building

To build the initial docker image run the following command.

    docker build -t go .

Will pull in the latest available version of Go.

# Installation

Add to `.bashrc` file the following functions.

```bash
# go environment provided by my goenv project
function goenv() {
    user_arg="${1:-}"
    case "$user_arg" in
    "pause")
        goenv_pause
        ;;
    "stop")
        goenv_stop
        ;;
    "restart")
        goenv_restart
        ;;
    "state")
        goenv_state
        ;;
    "attach")
        goenv_attach
        ;;
    *)
        docker run -it --rm --name goenv -v "$PWD":"$PWD" -w "$PWD" go
        ;;
    esac
}   

function goenv_state() {
    docker ps -f 'name=goenv' --format json | jq '.State'
}

function goenv_stop() {
    container_id=$(docker ps -aqf 'name=goenv')
    if [ -n "$container_id" ]; then
        docker container stop goenv
        echo "goenv container stopped"
    else
        echo "goenv is not running.."
    fi
}

function goenv_pause() {
    container_id=$(docker ps -aqf 'name=goenv')
    if [ -n "$container_id" ]; then
        docker container pause goenv
        echo "goenv container paused"
    else
        echo "goenv is not running.."
    fi
}

function goenv_restart() {
    container_id=$(docker ps -aqf 'name=goenv')
    if [ -n "$container_id" ]; then
        docker container restart goenv
        echo "goenv container restarted"
    else
        echo "goenv is not running.."
    fi
}

function goenv_attach () {
    container_id=$(docker ps -aqf 'name=goenv')
    if [ -n "$container_id" ]; then
        docker exec -it goenv /bin/bash
    else
        echo "goenv is not running.."
    fi
}
```

# Usage

Once the above functions have been added to `.bashrc`

run the following commands in your terminal:

- To start goenv
    ```shell
    goenv
    ```

- To pause goenv
    ```shell
    goenv pause
    ```

- To see goenv's state
    ```shell
    goenv state
    ```

- Attach to goenv
    ```shell
    goenv attach
    ```

- To stop goenv
    ```shell
    goenv stop
    ```

- To restart goenv
    ```shell
    goenv restart
    ```

