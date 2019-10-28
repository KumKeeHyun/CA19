#!/bin/sh

rm -f lab2

arm-linux-gnueabi-gcc -o lab2 example3.s main.c -g -static
gnome-terminal -x bash -c 'qemu-arm -g 8080 ./lab2; bash'

gdbgui -g gdb-multiarch --gdb-args "--se 'lab2' -ex 'target remote:8080'"

