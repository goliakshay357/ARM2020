	 area     appcode, CODE, READONLY
	 IMPORT printMsg
	 IMPORT printGate
	 IMPORT printNewLine
	 EXPORT __sigmoid

; Calculation of sigmoid with e^x
__sigmoid function
	VLDR.F32 s4, =1.0 ; imcrementated  value
	VLDR.F32 s0, =1.0 ; final Sum value
	VLDR.F32 s1, =1.0 ; partial series 1
	VLDR.F32 s3, =1.0 ; partial series n imcrement

;C = x/n
;n++
;A = A + BC
;B = B*C

loop VMOV.F32 s6,s0
	 VDIV.F32 s5,s2,s3
	 VADD.F32 s3,s3,s4
	 VFMA.F32 s0,s1,s5 
	 VMUL.F32 s1,s1,s5
	 VCMP.F32 s6,s0
	 VMRS APSR_nzcv, FPSCR
	 BNE loop
	 VADD.F32 s30,s4,s0
	 VDIV.F32 s6,s0,s30
	 BX lr
	 LTORG
	 ENDFUNC

	   EXPORT __LOGIC_OR	 
__LOGIC_OR function
	
	   MOV r4,r14			
	   
	   
	   VCVTR.S32.F32 s21,s7 ; Float conversion
	   VCVTR.S32.F32 s22,s8 ; Float conversion
	   VCVTR.S32.F32 s23,s9 ; Float conversion

	   VLDR.F32 s11, =3.0
	   VLDR.F32 s12, =3.0
	   VLDR.F32 s13, =3.0
	   VLDR.F32 s14, =-2.0
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; bias
	   VADD.F32 s15,s11,s12 ; adding all
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
	   BL __sigmoid
	   VCVTR.S32.F32 s27,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s22
	   BL printMsg
	   VMOV.F32 r0,s23
	   BL printMsg
	   VMOV.F32 r0,s27 ; output
	   BL printMsg
	   BL printNewLine 
	   MOV r14,r4
	   BX lr
	   LTORG
	   ENDFUNC

	 
	 EXPORT __LOGIC_AND	 

__LOGIC_AND function
	   MOV r4,r14
	   VCVTR.S32.F32 s21,s7
	   VCVTR.S32.F32 s22,s8
	   VCVTR.S32.F32 s23,s9
	   VLDR.F32 s11, =1.0 ; declaring weights
	   VLDR.F32 s12, =1.0 ; declaring weights
	   VLDR.F32 s13, =1.0 ; declaring weights
	   VLDR.F32 s14, =-2.0
	   VMUL.F32 s11,s11,s7 	; w1*x1
	   VMUL.F32 s12,s12,s8 	; w2*x2
	   VMUL.F32 s13,s13,s9 	; w3*x3
	   VMUL.F32 s14,s14,s10 ; bias 
	   VADD.F32 s15,s11,s12 ;Adding all
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s14 
	   VMOV.F32 s2,s15

	   BL __sigmoid
	   VCVTR.S32.F32 s26,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s22
	   BL printMsg
	   VMOV.F32 r0,s23
	   BL printMsg
	   VMOV.F32 r0,s26 ;output
	   BL printMsg
	   BL printNewLine
	   MOV r14,r4
	   BX lr
	   LTORG
		
	   ENDFUNC
	   
	   EXPORT __LOGIC_NAND	 
__LOGIC_NAND function
	   MOV r4,r14
	   VCVTR.S32.F32 s21,s7
	   VCVTR.S32.F32 s22,s8
	   VCVTR.S32.F32 s23,s9
	   VLDR.F32 s11, =-3.0 ; declaring weights
	   VLDR.F32 s12, =-3.0 ; declaring weights
	   VLDR.F32 s13, =-3.0 ; declaring weights
	   VLDR.F32 s14, =7.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; bias 
	   VADD.F32 s15,s11,s12 ; Adding all
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15

	   BL __sigmoid
	   VCVTR.S32.F32 s28,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s22
	   BL printMsg
	   VMOV.F32 r0,s23
	   BL printMsg
	   VMOV.F32 r0,s28
	   BL printMsg
	   BL printNewLine
	   MOV r14,r4
	   BX lr
	   LTORG
	   ENDFUNC
	   
	   EXPORT __LOGIC_NOR	 
__LOGIC_NOR function
	   MOV r4,r14
	   VCVTR.S32.F32 s21,s7
	   VCVTR.S32.F32 s22,s8
	   VCVTR.S32.F32 s23,s9
	   VLDR.F32 s11, =-2.0 ; weight1
	   VLDR.F32 s12, =-2.0 ; weight2
	   VLDR.F32 s13, =-2.0 ; weight3
	   VLDR.F32 s14, =1.0
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; bias
	   VADD.F32 s15,s11,s12 ; adding all
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15

	   BL __sigmoid
	   VCVTR.S32.F32 s29,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s22
	   BL printMsg
	   VMOV.F32 r0,s23
	   BL printMsg
	   VMOV.F32 r0,s29 ;output
	   BL printMsg
	   BL printNewLine
	   MOV r14,r4
	   BX lr
	   LTORG
	   ENDFUNC
	   
	   EXPORT __LOGIC_XOR	 
__LOGIC_XOR function
	   MOV r4,r14
	   VCVTR.S32.F32 s21,s7
	   VCVTR.S32.F32 s22,s8
	   VCVTR.S32.F32 s23,s9
	   VLDR.F32 s11, =-2.0 ;weight1
	   VLDR.F32 s12, =2.0 ;weight2
	   VLDR.F32 s13, =-2.0 ;weight3
	   VLDR.F32 s14, =-1.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; bias
	   VADD.F32 s15,s11,s12 ; Adding all
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
       BL __sigmoid 
	   VCVTR.S32.F32 s17,s6
	   VCVT.F32.S32 s17,s17
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =-1.0 
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; bias

	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid
	   VCVTR.S32.F32 s18,s6
	   VCVT.F32.S32 s18,s18
	   
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s14, =-1.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 
	   VCVTR.S32.F32 s19,s6
	   VCVT.F32.S32 s19,s19
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s14, =-5.0
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; bias 

	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 
	   VCVTR.S32.F32 s20,s6
	   VCVT.F32.S32 s20,s20
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s16, =2.0
	   VLDR.F32 s14, =-1.0
	   VMUL.F32 s11,s11,s17 ; w1*x1
	   VMUL.F32 s12,s12,s18 ; w2*x2
	   VMUL.F32 s13,s13,s19 ; w3*x3
	   VMUL.F32 s16,s16,s20 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; weight5*bias
	   VADD.F32 s15,s11,s12 
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s16 
	   VADD.F32 s15,s15,s14 
	   VMOV.F32 s2,s15

       BL __sigmoid 
	   VCVTR.S32.F32 s30,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s22
	   BL printMsg
	   VMOV.F32 r0,s23
	   BL printMsg
	   VMOV.F32 r0,s30
	   BL printMsg
	   BL printNewLine
	   MOV r14,r4
	   BX lr
	   LTORG
	   ENDFUNC
	   
	   EXPORT __LOGIC_XNOR	 
__LOGIC_XNOR function
	   MOV r4,r14
	   VCVTR.S32.F32 s21,s7
	   VCVTR.S32.F32 s22,s8
	   VCVTR.S32.F32 s23,s9

	   VLDR.F32 s11, =2.0 ;weight1
	   VLDR.F32 s12, =-2.0 ;weight2
	   VLDR.F32 s13, =2.0 ;weight3
	   VLDR.F32 s14, =1.0
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; bias
	   
	   VADD.F32 s15,s11,s12 
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s14 
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 
	   VCVTR.S32.F32 s17,s6
	   VCVT.F32.S32 s17,s17
	   
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s14, =1.0
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; bias
	   
	   VADD.F32 s15,s11,s12 
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s14 
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 	;The below is Hidden Layer-1 X2
	   VCVTR.S32.F32 s18,s6
	   VCVT.F32.S32 s18,s18
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =1.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; bias
	   
	   VADD.F32 s15,s11,s12 
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s14 
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 	;The below is Hidden Layer-1 X3
	   VCVTR.S32.F32 s19,s6
	   VCVT.F32.S32 s19,s19
	   
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =5.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s12,s12,s8 ; w2*x2
	   VMUL.F32 s13,s13,s9 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; bias
	   
	   VADD.F32 s15,s11,s12 
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s14 
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 	;The below is Hidden Layer-1 X4
	   VCVTR.S32.F32 s20,s6
	   VCVT.F32.S32 s20,s20
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s16, =2.0
	   VLDR.F32 s14, =-7.0
	   
	   VMUL.F32 s11,s11,s17 ; w1*x1
	   VMUL.F32 s12,s12,s18 ; w2*x2
	   VMUL.F32 s13,s13,s19 ; w3*x3
	   VMUL.F32 s16,s16,s20 ; w3*x3
	   VMUL.F32 s14,s14,s10 ; weight5*bias
	   
	   VLDR.F32 s15, =0.0
	   VADD.F32 s15,s15,s14
	   VADD.F32 s15,s15,s11 
	   VADD.F32 s15,s15,s12 
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s16 
	   VMOV.F32 s2,s15

       BL __sigmoid 	;The below is Hidden Layer-2 Y1 output
	   VCVTR.S32.F32 s31,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s22
	   BL printMsg
	   VMOV.F32 r0,s23
	   BL printMsg
	   VMOV.F32 r0,s31 ;output
	   BL printMsg
	   BL printNewLine
	   
	   MOV r14,r4
	   BX lr
	   LTORG

	   ENDFUNC
	   
	   EXPORT __LOGIC_NOT	 
__LOGIC_NOT function
	   ;NOT weight - s11,s14
	   MOV r4,r14
	   VCVTR.S32.F32 s21,s7
	   VCVTR.S32.F32 s22,s8
	   VCVTR.S32.F32 s23,s9
	   
	   ; The weights are stored here below
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s14, =1.0
	   
	   VMUL.F32 s11,s11,s7 ; w1*x1
	   VMUL.F32 s14,s14,s10 ; bias
	   
	   VADD.F32 s15,s11,s14 
	   VMOV.F32 s2,s15
	   
	   ; Printing the input and the out put for checking the values correct or not
	   ; The output is in S25
	   BL __sigmoid 	;This is Hidden Layer-2 Y1 output
	   VCVTR.S32.F32 s25,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s25
	   BL printMsg
	   BL printNewLine
       MOV r14,r4
	   BX lr
	   LTORG
	   ENDFUNC

; Output Details
;25-NOT 
;s26-AND
;s27-OR
;s28-NAND
;s29-NOR
;s30-XOR
;s31-XNOR

; Input Details 
;s7,s8,s9

;printing the truth table ->
	 export __main	
	 ENTRY 
__main  function		 

	   ;Printing LOGIC NOT gate
	   MOV r0,#0
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_NOT

	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_NOT
	   
	   ;Printing LOGIC AND gate
	   MOV r0,#1
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_AND

	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_AND
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_AND
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_AND
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_AND
	   
	   
	   ;Printing LOGIC OR gate
	   MOV r0,#2
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_OR
	   
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_OR
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_OR
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_OR
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_OR
	   
	   ;Printing LOGIC NAND gate
	   MOV r0,#3
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_NAND

	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_NAND
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_NAND
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_NAND
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_NAND
	   
	   ;Printing LOGIC NOR gate
	   MOV r0,#4
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_NOR


	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_NOR
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_NOR
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_NOR
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_NOR
	   
	   ;Printing LOGIC XOR gate
	   MOV r0,#5
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_XOR


	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_XOR
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_XOR
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_XOR
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_XOR
	   
	   ;Printing LOGIC XNOR gate
	   MOV r0,#6
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_XNOR

	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_XNOR
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_XNOR
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_XNOR
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias
	   BL __LOGIC_XNOR
	   
stop    B  stop ; stopping the program	   
     endfunc
     end 