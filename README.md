# go-multi-arch-build
A proof-of-concept/example for a "multi-os/architecture" artifact compilation and build for a simple Go application.

Makefile ensure that `MODULE_NAME` and `MODULE_VERSION` environment variables are set to be passed into [scripts/compile.sh](scripts/compile.sh). Change these as needed with your Go module/application.
