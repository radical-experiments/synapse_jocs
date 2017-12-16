	.file	"test_matmult.c"
	.text
.globl _mat_mult
	.type	_mat_mult, @function
_mat_mult:
.LFB0:
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
	addq	-16(%rbp), %rax
	salq	$2, %rax
	addq	-64(%rbp), %rax
	movq	-24(%rbp), %rdx
	imulq	-72(%rbp), %rdx
	addq	-16(%rbp), %rdx
	salq	$2, %rdx
	addq	-64(%rbp), %rdx
	movss	(%rdx), %xmm1
	movq	-24(%rbp), %rdx
	imulq	-72(%rbp), %rdx
	addq	-8(%rbp), %rdx
	salq	$2, %rdx
	addq	-48(%rbp), %rdx
	movss	(%rdx), %xmm2
	movq	-8(%rbp), %rdx
	imulq	-72(%rbp), %rdx
	addq	-16(%rbp), %rdx
	salq	$2, %rdx
	addq	-56(%rbp), %rdx
	movss	(%rdx), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
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
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_mat_mult, .-_mat_mult
.globl main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	.cfi_offset 3, -24
	call	atol
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	imulq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	movq	-48(%rbp), %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -24(%rbp)
	movq	-56(%rbp), %rbx
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rbx, %r8
	movq	%rax, %rsi
	movl	$1, %edi
	call	_mat_mult
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	addq	$72, %rsp
	popq	%rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-17)"
	.section	.note.GNU-stack,"",@progbits
