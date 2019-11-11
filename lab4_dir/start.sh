#!/bin/sh

rm -f lab4

arm-linux-gnueabi-gcc -o lab4 main.c memory_size_check.s pattern_search.s top1_pattern_search.s -g -static
gnome-terminal -x bash -c 'qemu-arm -g 8080 ./lab4; bash'

gdbgui -g gdb-multiarch --gdb-args "--se 'lab4' -ex 'target remote:8080'"

