#!/bin/sh

rm -f lab1

arm-linux-gnueabi-gcc -o lab1 factorial.s fact_recursive.s main.c -g -static

gdbgui -g gdb-multiarch --gdb-args "--se 'lab1' -ex 'target remote:8080'"
