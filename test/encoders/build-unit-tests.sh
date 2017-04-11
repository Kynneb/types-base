#!/bin/sh

asn1.exe -c -uPER -typePrefix asn1Scc -wordSize 8 -atc ../../asn/base/*.asn ../../asn/sargon/*/*.asn
make -f Makefile_patched

