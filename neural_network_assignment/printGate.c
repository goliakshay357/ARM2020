#include "stm32f4xx.h"
#include <string.h>
#include <stdio.h>
void printGate(const int a)
{
	 char *ptr_n; 
	if(a==0){ ptr_n = "NOT gate\n"; }
	 if(a==1){ ptr_n = "AND gate\n"; }
	 if(a==2){ ptr_n = "OR gate\n"; }
	 if(a==3){ ptr_n = "NAND gate\n"; }
	 if(a==4){ ptr_n = "NOR gate\n"; }
	 if(a==5){ ptr_n = "XOR gate\n"; }
	 if(a==6){ ptr_n = "XNOR gate\n"; }	
	 while(*ptr_n != '\0'){
      ITM_SendChar(*ptr_n);
      ++ptr_n;
   }
	 return;
}