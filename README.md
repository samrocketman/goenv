# Go Dev Environment

A simple go development environment for my Ubuntu and Pop OS Linux machine.
Because my computers run Ubuntu 18.04 or similar LTS derivatives I am basing my
development environment on that.

# Building

To build the initial docker image run the following command.

    docker built -t go .

# Usage

Add to `.bashrc` file the following function.

```bash
# go environment provided by my goenv project
function goenv() {
    docker run -it -v "$PWD":"$PWD" -w "$PWD" go
}
```
