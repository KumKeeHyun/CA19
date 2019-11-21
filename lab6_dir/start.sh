#!/bin/sh

rm -f lab3

arm-linux-gnueabi-gcc -o lab3 main.c bubblesort.s swap.s -g -static
#gnome-terminal -x bash -c 'qemu-arm -g 8080 ./lab3; bash'

#gdbgui -g gdb-multiarch --gdb-args "--se 'lab3' -ex 'target remote:8080'"

