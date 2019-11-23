.text
.global quicksort

quicksort:
	// r0 : array, r1 : first, r2 : last
	// r4 : i, r5 : j, r6 : pivot
	// r7 : temp1, r8 : temp2, r9 : temp3
	
	stmfd sp!, {r0-r12,lr}
	
	cmp r1, r2
	bge exit

	mov r4, r1
	mov r5, r2
	mov r6, r1
	
loop:
	ldr r9, [r0, r6, LSL #2]
iloop:
	ldr r7, [r0, r4, LSL #2]
	cmp r7, r9
	bgt jloop
	cmp r4, r2
	addlt r4, r4, #1
	blt iloop

jloop:
	ldr r7, [r0, r5, LSL #2]
	cmp r7, r9
	subgt r5, r5, #1
	bgt jloop

	cmp r4, r5
	bge loop_exit
	
	ldr r7, [r0, r4, LSL #2]
	ldr r8, [r0, r5, LSL #2]
	str r7, [r0, r5, LSL #2]
	str r8, [r0, r4, LSL #2]
	b loop

loop_exit:
	ldr r7, [r0, r6, LSL #2]
	ldr r8, [r0, r5, LSL #2]
	str r7, [r0, r5, LSL #2]
	str r8, [r0, r6, LSL #2]

	mov r7, r2
	sub r2, r5, #1
	bl quicksort
	add r1, r5, #1
	mov r2, r7
	bl quicksort

exit:
	ldmfd sp!, {r0-r12,lr}
	mov pc, lr

.end
