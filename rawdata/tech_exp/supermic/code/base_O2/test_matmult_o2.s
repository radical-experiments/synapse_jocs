	.file	"test_matmult.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	_mat_mult
	.type	_mat_mult, @function
_mat_mult:
.LFB18:
	.cfi_startproc
	testq	%r8, %r8
	jle	.L1
	leaq	0(,%r8,4), %r9
	movq	%rsi, %r10
	movq	%rcx, %rdi
	xorl	%r11d, %r11d
.L3:
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L6:
	leaq	(%rdx,%rsi), %rcx
	movss	(%rdi,%rsi), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	movss	(%r10,%rax,4), %xmm0
	addq	$1, %rax
	mulss	(%rcx), %xmm0
	addq	%r9, %rcx
	cmpq	%r8, %rax
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rdi,%rsi)
	jne	.L4
	addq	$4, %rsi
	cmpq	%rsi, %r9
	jne	.L6
	addq	$1, %r11
	addq	%r9, %r10
	addq	%r9, %rdi
	cmpq	%r8, %r11
	jne	.L3
.L1:
	rep; ret
	.cfi_endproc
.LFE18:
	.size	_mat_mult, .-_mat_mult
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.section	.text.startup,"ax",@progbits
.LHOTB1:
	.p2align 4,,15
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
	movl	$10, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	8(%rsi), %rdi
	xorl	%esi, %esi
	call	strtol
	movq	%rax, %rbx
	movq	%rax, %rbp
	imulq	%rax, %rbx
	salq	$2, %rbx
	movq	%rbx, %rdi
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	malloc
	movq	%rbp, %r8
	movq	%rax, %rcx
	movq	%r12, %rdx
	movq	%r13, %rsi
	movl	$1, %edi
	movq	%rax, %rbx
	call	_mat_mult
	movq	%r13, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	movq	%rbx, %rdi
	call	free
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
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
	.section	.text.unlikely
.LCOLDE1:
	.section	.text.startup
.LHOTE1:
	.ident	"GCC: (GNU) 4.9.0"
	.section	.note.GNU-stack,"",@progbits
