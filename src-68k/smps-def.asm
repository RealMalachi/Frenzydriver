; ASM68K represents true conditions as -1, ASL represents them as 1
; yes, assembler detection. I did not want to write this shit twice.
smps_assembler		equ ((1=1)=1)	; 0 for ASM68K, 1 for AS
smps_z80ram		equ $A00000
smps_z80busreq		equ $A11100
smps_z80busreset	equ $A11200
smps_vdpctrl		equ $C00004
	if smps_assembler=0
		include "out/drv.exp"
		include "src-68k/smps2asm-asm68k.asm"
	else
		RELAXED ON		; allows 0x syntax
		include "out/drv.exp"
		RELAXED OFF
		include "src-68k/smps2asm-asl.asm"
	endif
; ---------------------------------------------------------------------------
SMPS_stopwaitZ80 macro
	move.w	#$100,smps_z80busreq
	or.l	d0,d0
	nop
	if smps_assembler=0
	local wait
wait	btst	#0,smps_z80busreq
	bne.s	wait
	else
$$wait	btst	#0,smps_z80busreq
	bne.s	$$wait
	endif
	endm
SMPS_startZ80 macro
	move.w	#$000,smps_z80busreq
	endm
SMPS_even macro
	if ((*)&1)=1
	dc.b	105
	endif
	endm

	if smps_assembler=0

zMakeLEW macro x
	dc.b (\x)&$FF,((\x)>>8)&$FF
	endm
zMakePtr macro x
	dc.b (\x)&$FF,(((\x)>>8)&$7F)|1<<7
	endm
zMakeBnk macro x
	dc.b (\x)>>15
	endm
zMakeRate macro rate,cycle
	dc.b  1+(3579545/(\rate\)-(\cycle\)+(13/2))/13
	endm

bgmdef macro palslowflag,speedtempo,label,id
\id\	equ MusID__First+(((*)-zMasterPlaylist)/4)
	dc.b  \palslowflag\<<7|0<<6,\speedtempo
	zMakeBnk \label
	zMakePtr \label
	endm
sfxdef macro prio,label,id
\id\	equ SndID__First+(((*)-SoundIndex)/3)
	dc.b \prio\
	zMakePtr \label
	endm
pcmdef macro label,rate,id
\id\	equ $81+(((*)-zDACPtrTbl)/6)
	zMakeBnk SMPSPCM_\label
	zMakeRate \rate,smps_dpcmcycle
	zMakeLEW SMPSPCM_\label\_End-SMPSPCM_\label
	zMakePtr SMPSPCM_\label
	endm
segadef macro label,rate
	zMakeLEW SMPSPCM_\label\_End-SMPSPCM_\label
	zMakePtr SMPSPCM_\label
	zMakeBnk SMPSPCM_\label
	zMakeRate \rate,smps_segacycle
	endm
volenvdef macro label,id
\id\	equ 1+(((*)-zVolEnv)/2)
	zMakeLEW (\label\-zVolEnv)
	endm

incpcm macro name,filepath
SMPSPCM_\name\:	incbin \filepath
SMPSPCM_\name\_End:
	endm

envpsg macro x
	rept narg
		if stricmp("\x","HOLD")
		dc.b $80
		elseif stricmp("\x","REST")
		dc.b $7F,$80	; hold mute, not exactly a rest but it gets the job done
		elseif \x\>$F
		dc.b $7F
		else
		dc.b \x\<<3
		endif
	shift
	endr
	endm
envfm macro x
	rept narg
		if stricmp("\x","HOLD")
		dc.b $80
		elseif stricmp("\x","REST")
		dc.b $7F,$80	; hold mute, not exactly a rest but it gets the job done
		elseif \x\>$7F
		dc.b $7F
		else
		dc.b \x
		endif
	shift
	endr
	endm

SMPS_startData macro
	obj smps_datatable
	endm
SMPS_finishData macro
	if (*)>$2000
	inform 3,"Sound driver data exceeds Z80 ram"
	endif
	objend
	endm

; aligns to the start of a 32kb bank
startBank macro
soundBankStart	set (*)+((0-(*))&$7FFF)
		org soundBankStart
	endm
; assert if the bank exceeds 32kb
finishBank macro
	if *>(soundBankStart+$8000)
		inform 3,"ERROR: sound bank doesn't fit in $8000 bytes, try moving something to another bank."
	endif
	endm

	else	; smps_assembler

zMakeLEW macro x
	dc.b (x)&$FF,((x)>>8)&$FF
	endm
zMakePtr macro x
	dc.b (x)&$FF,(((x)>>8)&$7F)|1<<7
	endm
zMakeBnk macro x
	dc.b (x)>>15
	endm
zMakeRate macro rate,cycle
	dc.b  1+(3579545/(\rate\)-(\cycle\)+(13/2))/13
	endm

bgmdef macro palslowflag,speedtempo,label,id
id	equ MusID__First+(((*)-zMasterPlaylist)/4)
	dc.b palslowflag<<7|0<<6,speedtempo
	zMakeBnk label
	zMakePtr label
	endm
sfxdef macro prio,label,id
id	equ SndID__First+(((*)-SoundIndex)/3)
	dc.b prio
	zMakePtr label
	endm
pcmdef macro label,rate,id
id	equ $81+(((*)-zDACPtrTbl)/6)
	zMakeBnk SMPSPCM_label
	zMakeRate rate,smps_dpcmcycle
	zMakeLEW SMPSPCM_label_End-SMPSPCM_label
	zMakePtr SMPSPCM_label
	endm
segadef macro label,rate
	zMakeLEW SMPSPCM_label_End-SMPSPCM_label
	zMakePtr SMPSPCM_label
	zMakeBnk SMPSPCM_label
	zMakeRate rate,smps_segacycle
	endm
volenvdef macro label,id
id	equ 1+(((*)-zVolEnv)/2)
	zMakeLEW (label-zVolEnv)
	endm

incpcm macro name,filepath
SMPSPCM_name	label *
		binclude filepath
SMPSPCM_name_End	label *
	endm

envpsg macro
	irp x,ALLARGS
		if upstring("x")="HOLD"
		dc.b $80
		elseif upstring("x")="REST"
		dc.b $7F,$80	; hold mute, not exactly a rest but it gets the job done
		elseif x>$F
		dc.b $7F
		else
		dc.b x<<3
		endif
	endm	; endr
	endm
envfm macro
	irp x,ALLARGS
		if upstring("x")="HOLD"
		dc.b $80
		elseif upstring("x")="REST"
		dc.b $7F,$80	; hold mute, not exactly a rest but it gets the job done
		elseif x>$7F
		dc.b $7F
		else
		dc.b x
		endif
	endm	; endr
	endm

SMPS_startData macro
	phase smps_datatable
	endm
SMPS_finishData macro
	if (*)>$2000
	fatal "Sound driver data exceeds Z80 ram"
	endif
	dephase
	endm

; aligns to the start of a 32kb bank
startBank macro
soundBankStart	set (*)+((0-(*))&$7FFF)
		org soundBankStart
	endm
; assert if the bank exceeds 32kb
finishBank macro
	if *>(soundBankStart+$8000)
		fatal "ERROR: sound bank doesn't fit in $8000 bytes, try moving something to another bank."
	endif
	endm

	endif	; smps_assembler