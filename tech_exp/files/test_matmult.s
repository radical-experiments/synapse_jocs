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
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	%r8d, -52(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L2
.L7:
	movl	$0, -8(%rbp)
	jmp	.L3
.L6:
	movl	$0, -4(%rbp)
	jmp	.L4
.L5:
	movl	-12(%rbp), %eax
	imull	-52(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	imull	-52(%rbp), %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %ecx
	movl	-12(%rbp), %eax
	imull	-52(%rbp), %eax
	movl	%eax, %esi
	movl	-4(%rbp), %eax
	addl	%esi, %eax
	cltq
	leaq	0(,%rax,4), %rsi
	movq	-32(%rbp), %rax
	addq	%rsi, %rax
	movl	(%rax), %esi
	movl	-4(%rbp), %eax
	imull	-52(%rbp), %eax
	movl	%eax, %edi
	movl	-8(%rbp), %eax
	addl	%edi, %eax
	cltq
	leaq	0(,%rax,4), %rdi
	movq	-40(%rbp), %rax
	addq	%rdi, %rax
	movl	(%rax), %eax
	imull	%esi, %eax
	addl	%ecx, %eax
	movl	%eax, (%rdx)
	addl	$1, -4(%rbp)
.L4:
	movl	-4(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L5
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L6
	addl	$1, -12(%rbp)
.L2:
	movl	-12(%rbp), %eax
	cmpl	-52(%rbp), %eax
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
	subq	$32, %rsp
	movl	$4000000, %edi
	call	malloc
	movq	%rax, -24(%rbp)
	movl	$4000000, %edi
	call	malloc
	movq	%rax, -16(%rbp)
	movl	$4000000, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movl	$1000, %r8d
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
