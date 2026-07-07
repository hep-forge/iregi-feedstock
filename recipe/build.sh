#! /usr/bin/bash
set -e

cd vendor/IREGI/src/

# Remove vendored copies of code that are their own hep-forge packages
rm -rf oneloop qcdloop
rm -f makefile makefile_oneloop makefile_qcdloop

# Not parallel-safe -- must build single-threaded
make -f makefile_ML5_lib FC="${FC}" FFLAGS="${FFLAGS} -std=legacy -Wall -ffixed-line-length-none -I${PREFIX}/include/oneloop"

mv libiregi.a "${PREFIX}/lib/"
mkdir -p "${PREFIX}/include/iregi"
mv *.mod "${PREFIX}/include/iregi/"
