#!/bin/sh

# C++ compile wrapper-script for 'compile.sh'.
# See that script for syntax and more info.

DEST="$1" ; shift
MEMLIMIT="$1" ; shift
MAINSOURCE="$1"

# -g:		Request debugging information
# -Wall:	Report all warnings
# -O2:		Level 2 optimizations (default for speed)
# -std=c++11:	C++11 (or at least whatever GCC supports of it)
# -static:	Static link with all libraries
# -pipe:	Use pipes for communication between stages of compilation
g++ -g -Wall -O2 -std=c++11 -static -pipe -o $DEST "$@"
exit $?
