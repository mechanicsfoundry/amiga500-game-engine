mkdir bin
cd bin
cmake .. -DCMAKE_C_COMPILER=/opt/amiga/bin/m68k-amigaos-gcc -DCMAKE_CXX_COMPILER=/opt/amiga/bin/m68k-amigaos-g++
make
cd ..
