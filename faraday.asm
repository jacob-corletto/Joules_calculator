;===========================License========================================================================
;Program name = "Sort by Pointers". This program will take in an array and store them in malloc. The program will then sort the array of pointers by value.
;Copyright (C) 2023 Jacob Corletto
;
;This file is part of the software program "Sort by Pointers"
;"Sort by Pointers" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
;License version 3 as published by the Free Software Foundation.
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY.
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
;A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
;<https://www.gnu.org/licenses/>. The copyright holder may be contracted here: jacob.corletto@csu.fullerton.edu
;==========================================================================================================
;==========================================================================================================
;Author information
;   Author name: Jacob Corletto
;   Author email: Jacob.corletto@csu.fullerton.edu
;
;Program information
;   Program name: Programming Assignment #4 How to use strings
;   Program languages: Ampere in CPP; faraday in asm; isfloat is arm
;   Date program began: Oct, 10, 2023
;   Date of last update: Nov, 12, 2023
;   Comments reorganized: Noc, 12, 2023
;   Files in the program: Ampere.cpp, faraday.asm, isfloat.asm
;
;Purpose
;   The intent of this program is to demonstrate how to input and validate strings in Asembly
;
;This file
;   File name: faraday.asm
;   Language: X86-64
;   Syntax: Ubuntu 
;==========================================================================================================
;===========================Declarations===================================================================
;add extern and global statements 
global amp_calculator
extern printf
extern fgets
extern stdin
extern strlen
extern atof
extern isfloat

max_size equ 64

;===========================Prompts========================================================================

segment .data                 ;Place initialized data here so like any string formats or outputs
s_format db "%s", 0
f_format db "%lf", 0

prompt_name db "Please enter your name: ",0
prompt_title db "Please enter your title or profession: ",0
card_playa db "We always welcome a card player to our electrical lab.",10,0

voltage_prompt db "Please enter the voltage of the electrical system at your site (volts): ", 0
resistance_prompt db "Please enter the electrical resistance in the system at your site (ohms): ", 0
time_prompt db "Please enter the time your system was operating (seconds): ",0

error db "Attention card play. Invalid inputs have been encountered. Please run the program again.",10,0

thank_you db "Thank you card player. We at Majestic are pleased to inform you that your system performed ",0

;number here

thank_you2 db " joules of work.",10,0

thank_you3 db "Congratulations ",0

thank_you4 db " Come back any time and make use of our software. Everyone with title card player is welcome to use our programs at a reduced price.",10,0

;===========================varaibles========================================================================
segment .bss

name resb max_size
title resb max_size
voltage resb max_size
resistance resb max_size
time resb max_size

;===========================code start========================================================================
segment .text
amp_calculator:
push       rbp                                              
mov        rbp, rsp                                         
push       rbx                                              
push       rcx                                              
push       rdx                                              
push       rsi                                              
push       rdi                                              
push       r8                                               
push       r9                                               
push       r10                                              
push       r11                                              
push       r12                                              
push       r13                                              
push       r14                                              
push       r15                                              
pushf      
;push qword 0

;start code here there should be a block to take in a string, another to get the position of the newline character, and one more to print the name without newline look at notes to see how to do this

begin:                                          ;Entry point.  Execution begins here.

;prompt name
mov       rax, 0
mov       rdi, s_format
mov       rsi, prompt_name
call printf

;get input
mov       rax, 0
mov       rdi, name
mov       rsi, max_size
mov       rdx, [stdin]
call fgets

;find and remove \n char
mov       rax, 0
mov       rdi, name
call      strlen
mov byte  [name + rax-1], byte 0

;prompt title
mov       rax, 0
mov       rdi, s_format
mov       rsi, prompt_title
call printf

;get input
mov       rax, 0
mov       rdi, title
mov       rsi, max_size
mov       rdx, [stdin]
call fgets

;find and remove \n char
mov       rax, 0
mov       rdi, title
call      strlen
mov byte  [title + rax-1], byte 0

;welcome card player
mov       rax, 0
mov       rdi, s_format
mov       rsi, card_playa
call printf

;prompt for voltage
mov       rax, 0
mov       rdi, s_format
mov       rsi, voltage_prompt
call printf

;get input for voltage
mov       rax, 0
mov       rdi, voltage
mov       rsi, max_size
mov       rdx, [stdin]
call fgets

;find and remove \n char
mov       rax, 0
mov       rdi, voltage
call      strlen
mov byte  [voltage + rax-1], byte 0

;check if a float
mov       rax, 0
mov       rdi, voltage
call isfloat

;if invalid jump to quit
cmp       rax, 0
je quit

;convert to float
mov       rax, 0
mov       rdi, voltage
call atof    ; convert to float
movsd xmm12, xmm0 ;save in different register

;prompt for resistance
mov       rax, 0
mov       rdi, s_format
mov       rsi, resistance_prompt
call printf

;get input for resistance
mov       rax, 0
mov       rdi, resistance
mov       rsi, max_size
mov       rdx, [stdin]
call fgets

;find and remove \n char
mov       rax, 0
mov       rdi, resistance
call strlen
mov byte [resistance + rax-1], byte 0

;check if a float
mov       rax, 0
mov       rdi, resistance
call isfloat

;if invalid jump to quit
cmp       rax, 0
je quit

mov       rax, 0
mov       rdi, resistance
call atof    ; convert to float
movsd xmm13, xmm0 ;save in different register

;prompt for time
mov       rax, 0
mov       rdi, s_format
mov       rsi, time_prompt
call printf

;get input for time
mov       rax, 0
mov       rdi, time
mov       rsi, max_size
mov       rdx, [stdin]
call fgets

;find and remove \n char
mov       rax, 0
mov       rdi, time
call strlen
mov byte [time + rax-1], byte 0

;check if a float
mov       rax, 0
mov       rdi, time
call isfloat

;if invalid jump to quit
cmp       rax, 0
je quit

mov       rax, 0
mov       rdi, time
call atof    ; convert to float
movsd xmm14, xmm0 ;save in different register

;========================calculations===================================
;xmm12 = voltage
;xmm13 = Resistance
;xmm14 = Time
;v^2 * (T/R)

mulsd       xmm12, xmm12
divsd       xmm14, xmm13
mulsd       xmm12, xmm14 

;========================Printing outputs===================================

;Print text
mov       rax, 0
mov       rdi, s_format
mov       rsi, thank_you
call printf

; trying to output the float
mov       rax, 1 
mov       rdi, f_format
movsd     xmm13, xmm12
movsd xmm0, xmm12
call printf

;thankyou 2
mov       rax, 0
mov       rdi, s_format
mov       rsi, thank_you2
call printf

;thankyou 3
mov       rax, 0
mov       rdi, s_format
mov       rsi, thank_you3
call printf

;print name
mov       rax, 0
mov       rdi, s_format
mov       rsi, name
call printf

;thankyou 4
mov       rax, 0
mov       rdi, s_format
mov       rsi, thank_you4
call printf

jmp end

quit:
;Print text
mov       rax, 0
mov       rdi, s_format
mov       rsi, error
call printf

end:
mov rax, 0
movsd xmm0,xmm13


;pop        rax
popf                                                        
pop        r15                                              
pop        r14                                              
pop        r13                                              
pop        r12                                              
pop        r11                                              
pop        r10                                              
pop        r9                                               
pop        r8                                               
pop        rdi                                              
pop        rsi                                              
pop        rdx                                              
pop        rcx                                              
pop        rbx                                              
pop        rbp                                              

ret                                                         