# image to build rust binary for centos7

## How to run
```bash
docker run --rm --user "$(id -u)":"$(id -g)" -v "$PWD":/usr/src/myapp -w /usr/src/myapp rust-centos cargo build --release
```