#!/bin/bash


#Author: Jacob Corletto
#Date: 11/12/2023
#Purpose: To input and validate strings
#Program name: Assignment #4

rm *.o
rm *.out
rm *.lis

nasm -f elf64 -l main.lis -o main.o faraday.asm

nasm -f elf64 -l isfloat.lis -o isfloat.o isfloat.asm

g++ -c -m64 -Wall -o driver.o ampere.cpp -fno-pie -no-pie -std=c++20

g++ -m64 -o merged.out driver.o main.o isfloat.o -fno-pie -no-pie -std=c++20

./merged.out

