#!/bin/sh

rm -f lab5

arm-linux-gnueabi-gcc -o lab5 main.c matrix.s -g -static
gnome-terminal -x bash -c 'qemu-arm -g 8080 ./lab5; bash'

gdbgui -g gdb-multiarch --gdb-args "--se 'lab5' -ex 'target remote:8080'"

