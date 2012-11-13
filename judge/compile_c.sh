#!/bin/sh

# C compile wrapper-script for 'compile.sh'.
# See that script for syntax and more info.

DEST="$1" ; shift
MEMLIMIT="$1" ; shift
MAINSOURCE="$1"

# -g:		Request debugging information
# -Wall:	Report all warnings
# -O2:		Level 2 optimizations (default for speed)
# -std=gnu99	The 1999 C standard plus GNU extensions
# -static:	Static link with all libraries
# -pipe:	Use pipes for communication between stages of compilation
# -lm:		Link with math-library (has to be last argument!)
gcc -g -Wall -O2 -std=gnu99 -static -pipe -o $DEST "$@" -lm
exit $?
