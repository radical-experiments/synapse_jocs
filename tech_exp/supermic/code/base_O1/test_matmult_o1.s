	.file	"test_matmult.c"
	.text
	.globl	_mat_mult
	.type	_mat_mult, @function
_mat_mult:
.LFB18:
	.cfi_startproc
	testq	%r8, %r8
	jle	.L10
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	0(,%r8,4), %r11
	movq	%rcx, %rdi
	movq	%rsi, %r9
	movq	%r11, %r10
	movl	$0, %ebx
	jmp	.L3
.L4:
	movss	(%r9,%rax,4), %xmm0
	mulss	(%rcx), %xmm0
	addss	(%rdi,%rsi), %xmm0
	movss	%xmm0, (%rdi,%rsi)
	addq	$1, %rax
	addq	%r10, %rcx
	cmpq	%r8, %rax
	jne	.L4
	addq	$4, %rsi
	cmpq	%rsi, %r11
	je	.L5
.L6:
	leaq	(%rdx,%rsi), %rcx
	movl	$0, %eax
	jmp	.L4
.L5:
	addq	$1, %rbx
	addq	%r11, %rdi
	addq	%r11, %r9
	cmpq	%r8, %rbx
	je	.L1
.L3:
	movl	$0, %esi
	jmp	.L6
.L1:
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.L10:
	rep; ret
	.cfi_endproc
.LFE18:
	.size	_mat_mult, .-_mat_mult
	.globl	main
	.type	main, @function
main:
.LFB19:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movq	%rax, %rbp
	movq	%rax, %rbx
	imulq	%rax, %rbx
	salq	$2, %rbx
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, %r13
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, %rbx
	movq	%rbp, %r8
	movq	%rax, %rcx
	movq	%r12, %rdx
	movq	%r13, %rsi
	movl	$1, %edi
	call	_mat_mult
	movq	%r13, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	movq	%rbx, %rdi
	call	free
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE19:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.9.0"
	.section	.note.GNU-stack,"",@progbits
