	THUMB
	AREA appcode,CODE,READONLY
		EXPORT __main
    ENTRY
__main FUNCTION
	  	MOV r4,#0x1           ;
	  MOV r2,#0x21           ;			
	  MOV r7,#0x10           ;
	  CMP r2,r7           ;
	  ITTEE NE
	  SUBNE r2,r2,r7           ;r2 = r2 − r7
	  MOVNE r2,#0x0           ;r2 = 0 
	  ADDEQ r2,r2,r4           ;r2 = r2 + r4
	  MOVEQ r4,#0x0           ;r4 = 0
   
   ENDFUNC
   END
