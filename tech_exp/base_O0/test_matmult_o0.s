	.file	"test_matmult.c"
	.text
	.globl	_mat_mult
	.type	_mat_mult, @function
_mat_mult:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	%r8, -72(%rbp)
	movq	$0, -24(%rbp)
	jmp	.L2
.L7:
	movq	$0, -16(%rbp)
	jmp	.L3
.L6:
	movq	$0, -8(%rbp)
	jmp	.L4
.L5:
	movq	-24(%rbp), %rax
	imulq	-72(%rbp), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	imulq	-72(%rbp), %rax
	movq	%rax, %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	movq	-64(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movq	-24(%rbp), %rax
	imulq	-72(%rbp), %rax
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm2
	movq	-8(%rbp), %rax
	imulq	-72(%rbp), %rax
	movq	%rax, %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rdx)
	addq	$1, -8(%rbp)
.L4:
	movq	-8(%rbp), %rax
	cmpq	-72(%rbp), %rax
	jl	.L5
	addq	$1, -16(%rbp)
.L3:
	movq	-16(%rbp), %rax
	cmpq	-72(%rbp), %rax
	jl	.L6
	addq	$1, -24(%rbp)
.L2:
	movq	-24(%rbp), %rax
	cmpq	-72(%rbp), %rax
	jl	.L7
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_mat_mult, .-_mat_mult
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atol
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rsi
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	movl	$1, %edi
	call	_mat_mult
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
