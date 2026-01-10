	.file	"myp.c"
	.text
	.globl	text
	.bss
	.align 32
	.type	text, @object
	.size	text, 100
text:
	.zero	100
	.globl	blocks
	.align 32
	.type	blocks, @object
	.size	blocks, 50560
blocks:
	.zero	50560
	.globl	block_total
	.align 4
	.type	block_total, @object
	.size	block_total, 4
block_total:
	.zero	4
	.section	.rodata
.LC0:
	.string	"Cara guna: %s <fail>\n"
.LC1:
	.string	"r"
.LC2:
	.string	"Tak dapat buka fail."
.LC3:
	.string	"\n"
.LC4:
	.string	"}"
.LC5:
	.string	".%s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	cmpl	$1, -36(%rbp)
	jg	.L2
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L3
.L2:
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L4
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L3
.L4:
	movl	$0, -4(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L5
.L9:
	leaq	.LC3(%rip), %rdx
	leaq	text(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcspn@PLT
	leaq	text(%rip), %rdx
	movb	$0, (%rax,%rdx)
	leaq	.LC4(%rip), %rdx
	leaq	text(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L6
	movl	$0, -4(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L5
.L6:
	leaq	text(%rip), %rax
	movl	$123, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	testq	%rax, %rax
	je	.L7
	movl	$1, -4(%rbp)
	movl	block_total(%rip), %eax
	cltq
	imulq	$5056, %rax, %rax
	leaq	blocks(%rip), %rdx
	addq	%rax, %rdx
	leaq	.LC5(%rip), %rcx
	leaq	text(%rip), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc23_sscanf@PLT
	movl	block_total(%rip), %eax
	cltq
	imulq	$5056, %rax, %rax
	leaq	5052+blocks(%rip), %rdx
	movl	$0, (%rax,%rdx)
	movl	block_total(%rip), %eax
	cltq
	imulq	$5056, %rax, %rax
	leaq	blocks(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movl	block_total(%rip), %eax
	addl	$1, %eax
	movl	%eax, block_total(%rip)
	jmp	.L5
.L7:
	cmpl	$0, -4(%rbp)
	je	.L8
	movq	-16(%rbp), %rax
	movl	5052(%rax), %eax
	leal	1(%rax), %ecx
	movq	-16(%rbp), %rdx
	movl	%ecx, 5052(%rdx)
	cltq
	imulq	$100, %rax, %rax
	leaq	48(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	addq	$2, %rax
	leaq	text(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	jmp	.L5
.L8:
	leaq	text(%rip), %rax
	movq	%rax, %rdi
	call	jalankan_baris
.L5:
	movq	-24(%rbp), %rax
	leaq	text(%rip), %rcx
	movq	%rax, %rdx
	movl	$100, %esi
	movq	%rcx, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L9
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
.LC6:
	.string	"panggil"
.LC7:
	.string	"panggil .%s"
.LC8:
	.string	"cetak"
.LC9:
	.string	"puncakuasadua"
.LC10:
	.string	"%g\n"
	.text
	.globl	jalankan_baris
	.type	jalankan_baris, @function
jalankan_baris:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -120(%rbp)
	leaq	.LC6(%rip), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	je	.L11
	leaq	-112(%rbp), %rdx
	leaq	.LC7(%rip), %rcx
	movq	-120(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc23_sscanf@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	cari_blok
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	js	.L10
	movl	-52(%rbp), %eax
	movl	%eax, %edi
	call	jalankan_blok
	jmp	.L10
.L11:
	leaq	.LC8(%rip), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	je	.L14
	movq	-120(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L19
	addq	$1, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$46, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L16
	movq	-48(%rbp), %rax
	movb	$0, (%rax)
.L16:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L10
.L14:
	leaq	.LC9(%rip), %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	testq	%rax, %rax
	je	.L10
	movq	-120(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L20
	addq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$46, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L18
	movq	-16(%rbp), %rax
	movb	$0, (%rax)
.L18:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	atof@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rax, %xmm0
	movq	%rdx, %rdi
	movl	$1, %eax
	call	printf@PLT
	jmp	.L10
.L19:
	nop
	jmp	.L10
.L20:
	nop
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	jalankan_baris, .-jalankan_baris
	.globl	cari_blok
	.type	cari_blok, @function
cari_blok:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L22
.L25:
	movl	-4(%rbp), %eax
	cltq
	imulq	$5056, %rax, %rax
	leaq	blocks(%rip), %rdx
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L23
	movl	-4(%rbp), %eax
	jmp	.L24
.L23:
	addl	$1, -4(%rbp)
.L22:
	movl	block_total(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L25
	movl	$-1, %eax
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	cari_blok, .-cari_blok
	.globl	jalankan_blok
	.type	jalankan_blok, @function
jalankan_blok:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L27
.L28:
	movl	-4(%rbp), %eax
	cltq
	imulq	$100, %rax, %rdx
	movl	-20(%rbp), %eax
	cltq
	imulq	$5056, %rax, %rax
	addq	%rdx, %rax
	leaq	48(%rax), %rdx
	leaq	blocks(%rip), %rax
	addq	%rdx, %rax
	addq	$2, %rax
	movq	%rax, %rdi
	call	jalankan_baris
	addl	$1, -4(%rbp)
.L27:
	movl	-20(%rbp), %eax
	cltq
	imulq	$5056, %rax, %rax
	leaq	5052+blocks(%rip), %rdx
	movl	(%rax,%rdx), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L28
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	jalankan_blok, .-jalankan_blok
	.ident	"GCC: (Debian 15.2.0-12) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
