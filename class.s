	THUMB
	AREA appcode,CODE,READONLY
		EXPORT __main
    ENTRY
__main FUNCTION
	  	MOV r4,#0x1           ;
	  MOV r2,#0x21           ;			
	  MOV r7,#0x10           ;
	  CMP r2,r7           ;
	  ITTEE LE
	  SUBLE r2,r2,r7           ;r2 = r2 − r7;
	  MOVLE r2,#0x0           ;r2 = 0 ;
	  ADDGT r2,r2,r4           ;r2 = r2 + r4;
	  MOVGT r4,#0x0           ;r4 = 0
   
   ENDFUNC
   END
