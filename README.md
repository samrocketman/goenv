# Go Dev Environment

A simple go development environment for my Desktop Linux machines.

> **WARNING:** this environment gets set up with my personal dotfiles including
> git author settings.

# Building

To build the initial docker image run the following command.

    docker build -t go .

Will pull in the latest available version of Go.

# Installation

Add to `.bashrc` file the following 

```bash
source /path/to/your/goenv/repo/goenv_commands.sh
```

# Usage

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

