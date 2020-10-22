;   
;		s1 = x
;		s2 = ln(1+x)
;		s3 = current iteration numberator
;		s4 = current iteration denominator
;		s5 = current iteration
;		
;		
;		declare s1 = x;
;		declare s2 = s1;
;		declare s3 = s1;
;		declare s4= 1;
;		declare s6=1;
;		s1= -s1;
;		
;		declare r1 = 10; (iterator variable)
;		Loop: 
;		
;		s3 = s3*s1
;		s4 = s4+1
;		s5 = s3/s4
;		
;		s2 = s2+s5
;		
;		r1 = r1- 1
;		if(r1!=0):
;		    Jump to Loop
			
		



	AREA appcode,CODE,READONLY
    EXPORT __main
		ENTRY 
__main  FUNCTION			
		VLDR.F32 S1,=0.3                ; S0=X
		MOV R1,#10                      ; ITTERATOR
		VMOV.F32 S2,S1                  ; DECLARE S2=S1
		VMOV.F32 S3,S1					; DECLARE S3=S1
		VMOV.F S4,#1.0;					; DECLARE S4=1
		VMOV.F S6,#1.0;					; DECLARE S6 = 1
		VNEG.F32 S1,S1					; S1 = -S1
		
		
		
LOOP	VMUL.F32 S3,S3,S1              ;S3=S3*(-X)
		VADD.F32 S4,S4,S6				;s4 = s4+1
		VDIV.F32 S5,S3,S4               ;S5=S3/S4
        
		VADD.F32 S2,S2,S5               ; S2 = S2+S5

		SUB R1,R1,#1                    ;R1 = R1 - 1
		CMP R1,#0
		BNE LOOP                        ;BRANCH TO LOOP 
stop    B stop                          ; stop program
     ENDFUNC
	 END