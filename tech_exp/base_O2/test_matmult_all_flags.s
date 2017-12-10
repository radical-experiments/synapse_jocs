	.file	"test_matmult.c"
	.text
.Ltext0:
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.text
	.globl	_mat_mult
	.type	_mat_mult, @function
_mat_mult:
.LFB38:
	.file 1 "test_matmult.c"
	.loc 1 6 0
	.cfi_startproc
.LVL0:
	.loc 1 9 0
	testq	%r8, %r8
	jle	.L13
	leaq	0(,%r8,4), %r9
	.loc 1 6 0 discriminator 1
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rsi, %rdi
.LVL1:
	movq	%rdx, %rbx
	movq	%rcx, %rsi
.LVL2:
	.loc 1 9 0 discriminator 1
	xorl	%edx, %edx
.LVL3:
.L6:
	leaq	(%r9,%rsi), %r11
	movq	%rbx, %r10
.LVL4:
	.p2align 4,,10
	.p2align 3
.L7:
	movss	(%rsi), %xmm1
	.loc 1 6 0 discriminator 1
	movq	%r10, %rcx
	xorl	%eax, %eax
.LVL5:
	.p2align 4,,10
	.p2align 3
.L4:
	.loc 1 16 0 discriminator 3
	movss	(%rdi,%rax,4), %xmm0
	.loc 1 13 0 discriminator 3
	addq	$1, %rax
.LVL6:
	.loc 1 16 0 discriminator 3
	mulss	(%rcx), %xmm0
	addq	%r9, %rcx
	.loc 1 13 0 discriminator 3
	cmpq	%rax, %r8
	.loc 1 16 0 discriminator 3
	addss	%xmm0, %xmm1
	movss	%xmm1, (%rsi)
	.loc 1 13 0 discriminator 3
	jne	.L4
	addq	$4, %rsi
	addq	$4, %r10
	.loc 1 11 0 discriminator 2
	cmpq	%r11, %rsi
	jne	.L7
	.loc 1 9 0 discriminator 2
	addq	$1, %rdx
.LVL7:
	addq	%r9, %rdi
	cmpq	%rdx, %r8
	jne	.L6
	.loc 1 20 0
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL8:
	ret
.LVL9:
.L13:
	rep ret
	.cfi_endproc
.LFE38:
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
.LFB39:
	.loc 1 23 0
	.cfi_startproc
.LVL10:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
.LVL11:
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
.LBB4:
.LBB5:
	.file 2 "/usr/include/stdlib.h"
	.loc 2 285 0
	movl	$10, %edx
.LBE5:
.LBE4:
	.loc 1 23 0
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
.LBB8:
.LBB6:
	.loc 2 285 0
	movq	8(%rsi), %rdi
.LVL12:
	xorl	%esi, %esi
.LVL13:
	call	strtol@PLT
.LVL14:
.LBE6:
.LBE8:
	.loc 1 28 0
	movq	%rax, %rbx
.LBB9:
.LBB7:
	.loc 2 285 0
	movq	%rax, %rbp
.LVL15:
.LBE7:
.LBE9:
	.loc 1 28 0
	imulq	%rax, %rbx
.LVL16:
	salq	$2, %rbx
.LVL17:
	movq	%rbx, %rdi
	call	malloc@PLT
.LVL18:
	.loc 1 29 0
	movq	%rbx, %rdi
	.loc 1 28 0
	movq	%rax, %r13
.LVL19:
	.loc 1 29 0
	call	malloc@PLT
.LVL20:
	.loc 1 30 0
	movq	%rbx, %rdi
	.loc 1 29 0
	movq	%rax, %r12
.LVL21:
	.loc 1 30 0
	call	malloc@PLT
.LVL22:
	.loc 1 32 0
	movq	%rbp, %r8
	movq	%rax, %rcx
	movq	%r12, %rdx
	movq	%r13, %rsi
	movl	$1, %edi
	.loc 1 30 0
	movq	%rax, %rbx
.LVL23:
	.loc 1 32 0
	call	_mat_mult@PLT
.LVL24:
	.loc 1 34 0
	movq	%r13, %rdi
	call	free@PLT
.LVL25:
	.loc 1 35 0
	movq	%r12, %rdi
	call	free@PLT
.LVL26:
	.loc 1 36 0
	movq	%rbx, %rdi
	call	free@PLT
.LVL27:
	.loc 1 39 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL28:
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL29:
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL30:
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL31:
	ret
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE1:
	.section	.text.startup
.LHOTE1:
	.text
.Letext0:
	.section	.text.unlikely
.Letext_cold0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x4fc
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF58
	.byte	0xc
	.long	.LASF59
	.long	.LASF60
	.long	.Ldebug_ranges0+0x40
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x3
	.byte	0xd8
	.long	0x34
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0x83
	.long	0x65
	.uleb128 0x2
	.long	.LASF9
	.byte	0x4
	.byte	0x84
	.long	0x65
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x91
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x7
	.long	.LASF41
	.byte	0xd8
	.byte	0x5
	.byte	0xf1
	.long	0x215
	.uleb128 0x8
	.long	.LASF12
	.byte	0x5
	.byte	0xf2
	.long	0x5e
	.byte	0
	.uleb128 0x8
	.long	.LASF13
	.byte	0x5
	.byte	0xf7
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF14
	.byte	0x5
	.byte	0xf8
	.long	0x8b
	.byte	0x10
	.uleb128 0x8
	.long	.LASF15
	.byte	0x5
	.byte	0xf9
	.long	0x8b
	.byte	0x18
	.uleb128 0x8
	.long	.LASF16
	.byte	0x5
	.byte	0xfa
	.long	0x8b
	.byte	0x20
	.uleb128 0x8
	.long	.LASF17
	.byte	0x5
	.byte	0xfb
	.long	0x8b
	.byte	0x28
	.uleb128 0x8
	.long	.LASF18
	.byte	0x5
	.byte	0xfc
	.long	0x8b
	.byte	0x30
	.uleb128 0x8
	.long	.LASF19
	.byte	0x5
	.byte	0xfd
	.long	0x8b
	.byte	0x38
	.uleb128 0x8
	.long	.LASF20
	.byte	0x5
	.byte	0xfe
	.long	0x8b
	.byte	0x40
	.uleb128 0x9
	.long	.LASF21
	.byte	0x5
	.value	0x100
	.long	0x8b
	.byte	0x48
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.value	0x101
	.long	0x8b
	.byte	0x50
	.uleb128 0x9
	.long	.LASF23
	.byte	0x5
	.value	0x102
	.long	0x8b
	.byte	0x58
	.uleb128 0x9
	.long	.LASF24
	.byte	0x5
	.value	0x104
	.long	0x24d
	.byte	0x60
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.value	0x106
	.long	0x253
	.byte	0x68
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.value	0x108
	.long	0x5e
	.byte	0x70
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.value	0x10c
	.long	0x5e
	.byte	0x74
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.value	0x10e
	.long	0x6c
	.byte	0x78
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.value	0x112
	.long	0x42
	.byte	0x80
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.value	0x113
	.long	0x50
	.byte	0x82
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.value	0x114
	.long	0x259
	.byte	0x83
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.value	0x118
	.long	0x269
	.byte	0x88
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.value	0x121
	.long	0x77
	.byte	0x90
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.value	0x129
	.long	0x89
	.byte	0x98
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.value	0x12a
	.long	0x89
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.value	0x12b
	.long	0x89
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.value	0x12c
	.long	0x89
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.value	0x12e
	.long	0x29
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.value	0x12f
	.long	0x5e
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.value	0x131
	.long	0x26f
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF61
	.byte	0x5
	.byte	0x96
	.uleb128 0x7
	.long	.LASF42
	.byte	0x18
	.byte	0x5
	.byte	0x9c
	.long	0x24d
	.uleb128 0x8
	.long	.LASF43
	.byte	0x5
	.byte	0x9d
	.long	0x24d
	.byte	0
	.uleb128 0x8
	.long	.LASF44
	.byte	0x5
	.byte	0x9e
	.long	0x253
	.byte	0x8
	.uleb128 0x8
	.long	.LASF45
	.byte	0x5
	.byte	0xa2
	.long	0x5e
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x21c
	.uleb128 0x6
	.byte	0x8
	.long	0x98
	.uleb128 0xb
	.long	0x91
	.long	0x269
	.uleb128 0xc
	.long	0x82
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x215
	.uleb128 0xb
	.long	0x91
	.long	0x27f
	.uleb128 0xc
	.long	0x82
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x285
	.uleb128 0xd
	.long	0x91
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF46
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF47
	.uleb128 0xe
	.long	.LASF62
	.byte	0x2
	.value	0x11b
	.long	0x65
	.byte	0x3
	.long	0x2b6
	.uleb128 0xf
	.long	.LASF63
	.byte	0x2
	.value	0x11b
	.long	0x27f
	.byte	0
	.uleb128 0x10
	.long	.LASF64
	.byte	0x1
	.byte	0x5
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0x33e
	.uleb128 0x11
	.long	.LASF48
	.byte	0x1
	.byte	0x5
	.long	0x65
	.long	.LLST0
	.uleb128 0x12
	.string	"A"
	.byte	0x1
	.byte	0x5
	.long	0x33e
	.long	.LLST1
	.uleb128 0x12
	.string	"B"
	.byte	0x1
	.byte	0x5
	.long	0x33e
	.long	.LLST2
	.uleb128 0x12
	.string	"C"
	.byte	0x1
	.byte	0x5
	.long	0x33e
	.long	.LLST3
	.uleb128 0x13
	.string	"len"
	.byte	0x1
	.byte	0x5
	.long	0x65
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x14
	.string	"i"
	.byte	0x1
	.byte	0x7
	.long	0x65
	.long	.LLST4
	.uleb128 0x14
	.string	"j"
	.byte	0x1
	.byte	0x7
	.long	0x65
	.long	.LLST5
	.uleb128 0x14
	.string	"k"
	.byte	0x1
	.byte	0x7
	.long	0x65
	.long	.LLST6
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x344
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF49
	.uleb128 0x15
	.long	.LASF65
	.byte	0x1
	.byte	0x16
	.long	0x5e
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.long	0x4c0
	.uleb128 0x11
	.long	.LASF50
	.byte	0x1
	.byte	0x16
	.long	0x5e
	.long	.LLST7
	.uleb128 0x11
	.long	.LASF51
	.byte	0x1
	.byte	0x16
	.long	0x4c0
	.long	.LLST8
	.uleb128 0x16
	.string	"LEN"
	.byte	0x1
	.byte	0x19
	.long	0x65
	.uleb128 0x17
	.long	.LASF52
	.byte	0x1
	.byte	0x1a
	.long	0x65
	.long	.LLST9
	.uleb128 0x14
	.string	"A"
	.byte	0x1
	.byte	0x1c
	.long	0x33e
	.long	.LLST10
	.uleb128 0x14
	.string	"B"
	.byte	0x1
	.byte	0x1d
	.long	0x33e
	.long	.LLST11
	.uleb128 0x14
	.string	"C"
	.byte	0x1
	.byte	0x1e
	.long	0x33e
	.long	.LLST12
	.uleb128 0x18
	.long	0x298
	.quad	.LBB4
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x19
	.long	0x404
	.uleb128 0x19
	.long	0x2a9
	.long	.LLST13
	.uleb128 0x1a
	.quad	.LVL14
	.long	0x4dc
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL18
	.long	0x4e7
	.long	0x41c
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL20
	.long	0x4e7
	.long	0x434
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL22
	.long	0x4e7
	.long	0x44c
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL24
	.long	0x2b6
	.long	0x47b
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL25
	.long	0x4f3
	.long	0x493
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL26
	.long	0x4f3
	.long	0x4ab
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x1a
	.quad	.LVL27
	.long	0x4f3
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x8b
	.uleb128 0x1d
	.long	.LASF53
	.byte	0x6
	.byte	0xa8
	.long	0x253
	.uleb128 0x1d
	.long	.LASF54
	.byte	0x6
	.byte	0xa9
	.long	0x253
	.uleb128 0x1e
	.long	.LASF55
	.long	.LASF55
	.byte	0x2
	.byte	0xb7
	.uleb128 0x1f
	.long	.LASF56
	.long	.LASF56
	.byte	0x2
	.value	0x1d2
	.uleb128 0x1f
	.long	.LASF57
	.long	.LASF57
	.byte	0x2
	.value	0x1e3
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0
	.quad	.LVL1
	.value	0x1
	.byte	0x55
	.quad	.LVL1
	.quad	.LVL9
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL9
	.quad	.LFE38
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0
	.quad	.LVL2
	.value	0x1
	.byte	0x54
	.quad	.LVL2
	.quad	.LVL3
	.value	0x1
	.byte	0x55
	.quad	.LVL3
	.quad	.LVL9
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL9
	.quad	.LFE38
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL0
	.quad	.LVL3
	.value	0x1
	.byte	0x51
	.quad	.LVL3
	.quad	.LVL8
	.value	0x1
	.byte	0x53
	.quad	.LVL8
	.quad	.LVL9
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	.LVL9
	.quad	.LFE38
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL0
	.quad	.LVL3
	.value	0x1
	.byte	0x52
	.quad	.LVL3
	.quad	.LVL9
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	.LVL9
	.quad	.LFE38
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL0
	.quad	.LVL3
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL3
	.quad	.LVL9
	.value	0x1
	.byte	0x51
	.quad	.LVL9
	.quad	.LFE38
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL3
	.quad	.LVL4
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL4
	.quad	.LVL5
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL5
	.quad	.LVL9
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL10
	.quad	.LVL12
	.value	0x1
	.byte	0x55
	.quad	.LVL12
	.quad	.LFE39
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL10
	.quad	.LVL13
	.value	0x1
	.byte	0x54
	.quad	.LVL13
	.quad	.LFE39
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL15
	.quad	.LVL16
	.value	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1e
	.byte	0x9f
	.quad	.LVL16
	.quad	.LVL17
	.value	0x1
	.byte	0x53
	.quad	.LVL17
	.quad	.LVL18-1
	.value	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1e
	.byte	0x9f
	.quad	.LVL18-1
	.quad	.LVL29
	.value	0x6
	.byte	0x76
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x1e
	.byte	0x9f
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL19
	.quad	.LVL20-1
	.value	0x1
	.byte	0x50
	.quad	.LVL20-1
	.quad	.LVL31
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL21
	.quad	.LVL22-1
	.value	0x1
	.byte	0x50
	.quad	.LVL22-1
	.quad	.LVL30
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL23
	.quad	.LVL24-1
	.value	0x1
	.byte	0x50
	.quad	.LVL24-1
	.quad	.LVL28
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL10
	.quad	.LVL11
	.value	0x2
	.byte	0x74
	.sleb128 8
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB4
	.quad	.LBE4
	.quad	.LBB8
	.quad	.LBE8
	.quad	.LBB9
	.quad	.LBE9
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB39
	.quad	.LFE39
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"__off_t"
.LASF13:
	.string	"_IO_read_ptr"
.LASF56:
	.string	"malloc"
.LASF25:
	.string	"_chain"
.LASF7:
	.string	"size_t"
.LASF31:
	.string	"_shortbuf"
.LASF19:
	.string	"_IO_buf_base"
.LASF47:
	.string	"long long unsigned int"
.LASF64:
	.string	"_mat_mult"
.LASF52:
	.string	"SIZE"
.LASF57:
	.string	"free"
.LASF46:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF26:
	.string	"_fileno"
.LASF14:
	.string	"_IO_read_end"
.LASF6:
	.string	"long int"
.LASF55:
	.string	"strtol"
.LASF12:
	.string	"_flags"
.LASF20:
	.string	"_IO_buf_end"
.LASF29:
	.string	"_cur_column"
.LASF28:
	.string	"_old_offset"
.LASF33:
	.string	"_offset"
.LASF42:
	.string	"_IO_marker"
.LASF53:
	.string	"stdin"
.LASF3:
	.string	"unsigned int"
.LASF0:
	.string	"long unsigned int"
.LASF17:
	.string	"_IO_write_ptr"
.LASF60:
	.string	"/home/mingtaiha/repos_test/python-c-api/base_O2"
.LASF44:
	.string	"_sbuf"
.LASF2:
	.string	"short unsigned int"
.LASF21:
	.string	"_IO_save_base"
.LASF32:
	.string	"_lock"
.LASF27:
	.string	"_flags2"
.LASF39:
	.string	"_mode"
.LASF54:
	.string	"stdout"
.LASF48:
	.string	"iter"
.LASF10:
	.string	"sizetype"
.LASF58:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -g -O2 -O3 -fno-strict-aliasing -fwrapv -fPIC -fstack-protector-strong"
.LASF18:
	.string	"_IO_write_end"
.LASF61:
	.string	"_IO_lock_t"
.LASF41:
	.string	"_IO_FILE"
.LASF63:
	.string	"__nptr"
.LASF49:
	.string	"float"
.LASF45:
	.string	"_pos"
.LASF24:
	.string	"_markers"
.LASF62:
	.string	"atol"
.LASF1:
	.string	"unsigned char"
.LASF5:
	.string	"short int"
.LASF30:
	.string	"_vtable_offset"
.LASF59:
	.string	"test_matmult.c"
.LASF11:
	.string	"char"
.LASF43:
	.string	"_next"
.LASF9:
	.string	"__off64_t"
.LASF15:
	.string	"_IO_read_base"
.LASF23:
	.string	"_IO_save_end"
.LASF34:
	.string	"__pad1"
.LASF35:
	.string	"__pad2"
.LASF36:
	.string	"__pad3"
.LASF37:
	.string	"__pad4"
.LASF38:
	.string	"__pad5"
.LASF40:
	.string	"_unused2"
.LASF51:
	.string	"argv"
.LASF22:
	.string	"_IO_backup_base"
.LASF50:
	.string	"argc"
.LASF65:
	.string	"main"
.LASF16:
	.string	"_IO_write_base"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
