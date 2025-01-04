;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.1 #14650 (MINGW64)
;--------------------------------------------------------
	.module reader
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _printf
	.globl _gotoxy
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;reader.c:10: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
;reader.c:15: SW = (p[0]);
	ld	hl, #0x7fff
	ld	c, (hl)
;reader.c:16: gotoxy(XPOS,YPOS);
	push	bc
	ld	hl, #0x806
	push	hl
	call	_gotoxy
	pop	hl
	pop	bc
;reader.c:17: printf("MPH: %u", SW);
	ld	b, #0x00
	push	bc
	ld	de, #___str_0
	push	de
	call	_printf
	add	sp, #4
;reader.c:18: while(1)
	ld	c, #0x00
00104$:
;reader.c:20: SW = (p[0]);
	ld	a, (#0x7fff)
	ldhl	sp,	#0
	ld	(hl), a
;reader.c:21: if (SW != change)
	ld	a, c
	ldhl	sp,	#0
	sub	a, (hl)
	jr	Z, 00104$
;reader.c:23: gotoxy(XPOS,YPOS);
	ld	hl, #0x806
	push	hl
	call	_gotoxy
	pop	hl
;reader.c:24: printf("MPH:    ");
	ld	de, #___str_1
	push	de
	call	_printf
	pop	hl
;reader.c:25: gotoxy(XPOS,YPOS);
	ld	hl, #0x806
	push	hl
	call	_gotoxy
	pop	hl
;reader.c:26: printf("MPH: %u", SW);
	ldhl	sp,	#0
	ld	c, (hl)
	xor	a, a
	ld	b, a
	push	bc
	ld	de, #___str_0
	push	de
	call	_printf
	add	sp, #4
;reader.c:27: change = SW;
	ldhl	sp,	#0
	ld	c, (hl)
	jr	00104$
;reader.c:30: }
	inc	sp
	ret
___str_0:
	.ascii "MPH: %u"
	.db 0x00
___str_1:
	.ascii "MPH:    "
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
