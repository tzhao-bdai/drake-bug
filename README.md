# Minimal reproduction of an interesting bug

Build the docker container with `./build-docker.sh`, then enter the container with `./enter-docker.sh`. Inside the container, `cd /bug`, then `python3 bug.py`. It will segfault.

