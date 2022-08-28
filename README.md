# go-multi-arch-build
A proof-of-concept/example for a "multi-os/architecture" artifact compilation and build for a simple Go application.

The Makefile in this project ensure that `MODULE_NAME` and `MODULE_VERSION` environment variables are set to be passed into [scripts/compile.sh](scripts/compile.sh). Change these as needed with your Go module/application.

## How to use
execute one of the below commands to build and compile the Go module binary artifacts:

Runs all stages/modules defined in [Makefile](Makefile):
```bash
make
```

Runs the compile stage defined in [Makefile](Makefile)
```bash
make compile
```
