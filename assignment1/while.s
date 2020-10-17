     AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
		MOV R0,#64		;LOADING R0 = 64
		MOV R1,#32		;LOADING R1 = 32		


WHILE    	CMP R0,R1		;COMPARE CASE
		SUBGT R0,R0,R1	;IF GREATER [RO>R1] CASE -> R0 = R0-R1 
		SUBLT R1,R1,R0	;If LESSER [R0<R1] CASE -> R1= R1-R0 
		BNE    WHILE		;LOOP BACK
		
          
stop    B stop 			; stop program
     ENDFUNC
     END 