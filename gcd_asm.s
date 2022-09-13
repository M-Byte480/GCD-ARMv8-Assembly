	.globl   gcd_asm
    .p2align 2
	.type    gcd_asm,%function

gcd_asm:
	sub sp, sp, #16
	str x9, [sp, #16]

loop:
	cmp x1, #0
	beq quit 		// If it equals to 0, we found our GCD
	cmp x0, x1		// Compare x and y

	bge dont_swap	// If y is less than x, swap them

	mov x9, x0		// Put x in temp
	mov x0, x1		// Put y in x
	mov x1, x9		// put temp in y

dont_swap:
	sub x9, x0, x1 	// remainder: n = x - y
	mov x0, x1		// x = y
	mov x1, x9		// y = n
	b loop			// Go back

quit:				// Finish
	ldr x9, [sp, #16]
	add sp, sp, #16

	br	x30
