# go-multi-arch-build
A proof-of-concept/example for a "multi-os/architecture" artifact compilation and build for a simple Go application.

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
$ file bin/*/* 
bin/darwin/hello-v0.0.1-amd64:      Mach-O 64-bit x86_64 executable
bin/darwin/hello-v0.0.1-arm64:      Mach-O 64-bit arm64 executable, flags:<|DYLDLINK|PIE>
bin/linux/hello-v0.0.1-i386:         ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), statically linked, Go BuildID=N2l4UE2eVN__K03scAzI/1NCbXdThK813v2wU6nSY/Z5ETNFYeGz-IX3MSoGH0/wnQ1nUYXL0tZ4A0j34Ey, with debug_info, not stripped
bin/linux/hello-v0.0.1-amd64:       ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, Go BuildID=9cthHeSzqLdCFGkX5jEV/xbNMwissW-LouKxw99N-/mmDZUJ_DpCXZ9DXMquoQ/7tVH4bUeVNVRBHIJNy_E, with debug_info, not stripped
bin/linux/hello-v0.0.1-arm64:       ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, Go BuildID=3Pz2abLk7pECZkqIeC0X/rn7iZ7v0Q2-K1TF_Cfqc/SZv3LKiOjJlsGnNiFdqH/OTHLGFgNUNEDbrhGeu6J, with debug_info, not stripped
bin/windows/hello-v0.0.1-i386.exe:   PE32 executable (console) Intel 80386 (stripped to external PDB), for MS Windows
bin/windows/hello-v0.0.1-amd64.exe: PE32+ executable (console) x86-64 (stripped to external PDB), for MS Windows
bin/windows/hello-v0.0.1-arm64.exe: PE32+ executable (console) Aarch64 (stripped to external PDB), for MS Windows
```
