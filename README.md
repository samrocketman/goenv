# Go Dev Environment

A simple go development environment for my Desktop Linux machines.

> **WARNING:** this environment gets set up with my personal dotfiles including
> git author settings.

# Building

To build the initial docker image run the following command.

    docker build -t go .

Will pull in the latest available version of Go.

# Installation

Add to `.bashrc` file the following function.

```bash
# go environment provided by my goenv project
function goenv() {
    docker run -it --rm -v "$PWD":"$PWD" -w "$PWD" go
}
```

# Usage

Start this from the root of a Git repository containing a Go project.

    goenv
