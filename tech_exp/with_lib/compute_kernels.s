	.file	"compute_kernels.c"
	.section	.rodata
	.align 8
.LC1:
	.string	"time for _simple atom to execute: %f (s)\n"
	.text
	.globl	_simple_adder
	.type	_simple_adder, @function
_simple_adder:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	call	clock@PLT
	movq	%rax, -40(%rbp)
	movq	$0, -48(%rbp)
	jmp	.L2
.L3:
#APP
# 17 "compute_kernels.c" 1
	addl %eax, %eax 
	addl %ebx, %ebx 
	addl %ecx, %ecx 
	addl %edx, %edx 
	
# 0 "" 2
#NO_APP
	addq	$1, -48(%rbp)
.L2:
	movq	-48(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jl	.L3
	call	clock@PLT
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	subq	-40(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -64(%rbp)
	movsd	-64(%rbp), %xmm0
	leaq	.LC1(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_simple_adder, .-_simple_adder
	.section	.rodata
	.align 8
.LC2:
	.string	"time for _mat_mult atom to execute: %f (s)\n"
	.text
	.globl	_mat_mult
	.type	_mat_mult, @function
_mat_mult:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%r8, -88(%rbp)
	call	clock@PLT
	movq	%rax, -24(%rbp)
	movq	$0, -48(%rbp)
	jmp	.L5
.L10:
	movq	$0, -40(%rbp)
	jmp	.L6
.L9:
	movq	$0, -32(%rbp)
	jmp	.L7
.L8:
	movq	-48(%rbp), %rdx
	movq	-88(%rbp), %rax
	imulq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	-32(%rbp), %rdx
	movq	-88(%rbp), %rax
	imulq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movq	-48(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	%rcx, %rsi
	imulq	%rdx, %rsi
	movq	-40(%rbp), %rax
	addq	%rax, %rsi
	leaq	0(,%rsi,4), %rdi
	movq	-80(%rbp), %rsi
	addq	%rdi, %rsi
	imulq	%rcx, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rsi)
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
.L7:
	movq	-32(%rbp), %rdx
	movq	-88(%rbp), %rax
	cmpq	%rax, %rdx
	jl	.L8
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
.L6:
	movq	-40(%rbp), %rdx
	movq	-88(%rbp), %rax
	cmpq	%rax, %rdx
	jl	.L9
	movq	-48(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -48(%rbp)
.L5:
	movq	-48(%rbp), %rdx
	movq	-88(%rbp), %rax
	cmpq	%rax, %rdx
	jl	.L10
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	subq	-24(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -96(%rbp)
	movsd	-96(%rbp), %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_mat_mult, .-_mat_mult
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
