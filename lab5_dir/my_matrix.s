.text
.global my_matrix         
         
my_matrix:
	stmfd sp!, {r0-r12,lr}
	
	mov	r6,#0									
	mov	r7,#0									
	mov	r8,#0									
	mov	r9,#0									
	
Loop:
	//mov	r11, #12
	//mul	r11,r6,r11							
	//add	r11,r11,r7,LSL #2				
	//add	r11,r11,r0							
	add r11, r0, r6, LSL #2 // access row addr
	ldr r11, [r11]
	add r11, r11, r7, LSL #2 // access col addr

	ldr	r12,[r11]							

	//mov	r11, #12
	//mul	r11,r7,r11							
	//add	r11,r11,r8,LSL #2				
	//add	r11,r11,r1							
	add r11, r1, r7, LSL #2
	ldr r11, [r11]
	add r11, r11, r8, LSL #2

	ldr	r11,[r11]							

	mul	r12,r11,r12						
	add	r9, r9, r12
	
	add	r7,r7,#1
	ldr r4, [r3, #4]
	cmp	r7,r4 // u									 
	bne	Loop
	mov	r7,#0								

												
	//mov	r11, #12
	//mul	r11,r6,r11		
	//add	r11,r11,r8,LSL #2	
	//add	r11,r11,r2							
	add r11, r2, r6, LSL #2
	ldr r11, [r11]
	add r11, r11, r8, LSL #2

	str	r9, [r11]							
	 
	mov	r9,#0
	
	add	r8,r8,#1
	ldr r4, [r3, #8]
	cmp	r8, r4	// v							
	bne	Loop

	mov	r8,#0								
	
	add	r6,r6,#1
	ldr r4, [r3, #0]
	cmp	r6,r4 // s									
	bne	Loop	

	ldmfd sp!, {r0-r12,pc}
	
.end
		
		
