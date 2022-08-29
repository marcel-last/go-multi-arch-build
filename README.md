# go-multi-arch-build
A proof-of-concept/example for a "multi-os/architecture" artifact compilation and build for a simple Go application. Ideal as a base for a CICD build script to genreate build artifacts for a Go based applications that support multiple operating systems and architecture combinations.

## Notes
The Makefile in this project ensure that `MODULE_NAME` and `MODULE_VERSION` environment variables are set to be passed into [scripts/compile.sh](scripts/compile.sh). Change these as needed with your Go module/application.

## How to use
Execute one of the below commands to build and compile the Go module binary artifacts:

Runs all stages/modules defined in [Makefile](Makefile):
```bash
$ make
```

Runs only the [compile stage](https://github.com/marcel-last/go-multi-arch-build/blob/6d7c59308b7fef73355e246c165e443358a5ae1e/Makefile#L12-L15) defined in [Makefile](Makefile) which executes [scripts/compile.sh](scripts/compile.sh):
```bash
$ make compile
```

Verify artifacts/binaries have been created:
```bash
$ make verify
file bin/*/* 
Verifying build artifacts:
file bin/*/*
bin/darwin/hello-v0.0.1-amd64:      Mach-O 64-bit x86_64 executable
bin/darwin/hello-v0.0.1-arm64:      Mach-O 64-bit arm64 executable, flags:<|DYLDLINK|PIE>
bin/linux/hello-v0.0.1-386:         ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), statically linked, Go BuildID=Qf_Tt99dKInEdXmugM8y/rGjQ2Q486sxqOUHFwOOi/kvIdZKCr1nAI7JsMX3uT/GHp0qYeEdtE3eHjtUk4X, with debug_info, not stripped
bin/linux/hello-v0.0.1-amd64:       ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, Go BuildID=UwrnJtdvJJn93UFTCy2h/Ks3YUgY06MHYldy9ShEW/UhtJNaq2JG_7qedtD82z/tt_dm6rqFzveYsfv7Sni, with debug_info, not stripped
bin/linux/hello-v0.0.1-arm:         ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), statically linked, Go BuildID=BvJesFZkGyAqKJneRRu2/r5X3N-fl927BRxroNBd5/K6QaAKMhGDECc6A-zV30/XxBmrugDA47pSaX3F6vp, with debug_info, not stripped
bin/linux/hello-v0.0.1-arm64:       ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, Go BuildID=eHUNcDtDl_WK990Zfw2p/-onpUZc11zzN_uSDYF75/A5ILVM9zipd7KXH1Kn1Q/S2O_qN_MsmQgRZAbOh0j, with debug_info, not stripped
bin/windows/hello-v0.0.1-386.exe:   PE32 executable (console) Intel 80386 (stripped to external PDB), for MS Windows
bin/windows/hello-v0.0.1-amd64.exe: PE32+ executable (console) x86-64 (stripped to external PDB), for MS Windows
bin/windows/hello-v0.0.1-arm64.exe: PE32+ executable (console) Aarch64 (stripped to external PDB), for MS Windows
bin/windows/hello-v0.0.1-arm.exe:   PE32 executable (console) ARMv7 Thumb (stripped to external PDB), for MS Windows
```
