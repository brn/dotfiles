#!/bin/sh

## Install rust to ~/.rust, to enable cli the path follows must be added to the $PATH and
## the ld path follows must be added to the $DYLD_LIBRARY_PATH.
##
## $PATH entries:
## $HOME/.rust/bin:$PATH
##
## $DYLD_LIBRARY_PATH entries:
## $HOME/.rust/lib:$HOME/.rust/lib/rustlib/x86_64-apple-darwin/lib:$DYLD_LIBRARY_PATH
curl -s https://static.rust-lang.org/rustup.sh | sh -s -- --prefix=$HOME/.rust
