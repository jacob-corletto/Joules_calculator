
//===========================License========================================================================
//Program name = "Assignment #4". This program will take in an array and store them in malloc. The program will then sort the array of pointers by value.
//Copyright (C) 2023 Jacob Corletto
//
//This file is part of the software program "Assignment #4"
//"Assignment #4" is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
//License version 3 as published by the Free Software Foundation.
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY.
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
//A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: 
//<https://www.gnu.org/licenses/>. The copyright holder may be contracted here: jacob.corletto@csu.fullerton.edu
//==========================================================================================================
//==========================================================================================================
//Author information
//   Author name: Jacob Corletto
//   Author email: Jacob.corletto@csu.fullerton.edu
//
//Program information
//   Program name: Programming Assignment #4 How to use strings
//   Program languages: Ampere in CPP, faraday in asm, isfloat is arm
//   Date program began: Oct, 10, 2023
//   Date of last update: Nov, 12, 2023
//   Comments reorganized: Nov, 12, 2023
//   Files in the program: Ampere.cpp, faraday.asm, isfloat.asm
//
//Purpose
//   The intent of this program is to demonstrate how to input and validate strings in Asembly
//
//This file
//   File name: faraday.asm
//   Language: X86-64
//   Syntax: Ubuntu 
//==========================================================================================================

//===== Begin code area ============================================================================================================

#include <stdio.h>
#include <cstring>
#include <iostream>
using namespace std;

extern "C" float amp_calculator();

int main(){
  cout << "Welcome to Majestic Power Systems, LLC. \n";
  cout<< "Project Director, Sharon Winners, Senior Software Engineer.\n";
  float answer = amp_calculator();

  printf("The main function received this number %lf and will keep it for future study. A zero will be returned to the operating system. Bye.",answer);


  return 0;

}//End of main
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
