;QueueRingSound:
;	moveq_	#sndid_RingLeft,d0
;	bchg	#7,_soundmisc	; << ram, one byte
;	beq.s	SmpsQueue
;	moveq_	#sndid_RingRight,d0
;	;bra.s	SmpsQueue
;QueueGloopSound:
;	moveq_	#sndid_Gloop,d0
;	bchg	#6,_soundmisc	; << ram, one byte
;	beq.s	SmpsQueue
;	rts

SmpsQueue:
	SMPS_stopwaitZ80
	tst.b	smps_z80ram+smps_queue1
	bne.s	SmpsQueue_2
	move.b	d0,smps_z80ram+smps_queue1
	SMPS_startZ80
	rts
SmpsQueue_2:
	tst.b	smps_z80ram+smps_queue2
	bne.s	SmpsQueue_3
	move.b	d0,smps_z80ram+smps_queue2
	SMPS_startZ80
	rts
SmpsQueue_3:
	move.b	d0,smps_z80ram+smps_queue3
	SMPS_startZ80
	rts

QueuePCM:
	SMPS_stopwaitZ80
	move.b	d0,smps_z80ram+smps_pcmqueue
	st.b	smps_z80ram+smps_pcmsfxflag
	SMPS_startZ80
	rts

SmpsPause:
	SMPS_stopwaitZ80
	move.b	#$7F,smps_z80ram+smps_pauseflag
	SMPS_startZ80
	rts
SmpsResume:
	SMPS_stopwaitZ80
	move.b	#$80,smps_z80ram+smps_pauseflag
	SMPS_startZ80
	rts

ReadComm:
	SMPS_stopwaitZ80
	move.b	smps_z80ram+smps_commbyte,d0
	SMPS_startZ80
	rts
WriteComm:
	SMPS_stopwaitZ80
	move.b	d0,smps_z80ram+smps_commbyte
	SMPS_startZ80
	rts
; ---------------------------------------------------------------------------
SoundDriverLoad:
	move	sr,-(sp)
	move	#$2700,sr
	movem.l	d2-d3/a2-a3,-(sp)

	lea	smps_z80busreq,a2
	moveq	#0,d2
	move.w	#$100,d3
	move.w	d3,(a2)
	move.w	d3,smps_z80busreset-smps_z80busreq(a2)
	lea	smps_z80ram,a3
; clear Z80 ram
	move.w	#$2000-1,d0
	move.l	a3,a1
SoundDriverLoad_ClearLoop:
	move.b	d2,(a1)+
	dbf	d0,SoundDriverLoad_ClearLoop
; load driver
	lea	SoundDriverLoad_Driver(pc),a0
	move.l	a3,a1
	move.w	#(SoundDriverLoad_DriverEnd-SoundDriverLoad_Driver)-1,d0
SoundDriverLoad_DriverLoop:
	move.b	(a0)+,(a1)+
	dbf	d0,SoundDriverLoad_DriverLoop
; load data
	lea	(SoundDriverLoad_Data).l,a0
	lea	smps_datatable(a3),a1
	move.w	#(SoundDriverLoad_DataEnd-SoundDriverLoad_Data)-1,d0
SoundDriverLoad_DataLoop:
	move.b	(a0)+,(a1)+
	dbf	d0,SoundDriverLoad_DataLoop
; set misc flags
	move	smps_vdpctrl,ccr				; check video mode (bit 0, carry bit)
	scs	smps_palflag(a3)				; set if PAL, clear if NTSC
; alright we're done
	move.w	d2,smps_z80busreset-smps_z80busreq(a2)
	or.l	d0,d0
	or.l	d0,d0
	move.w	d3,smps_z80busreset-smps_z80busreq(a2)
	move.w	d2,(a2)
	movem.l	(sp)+,d2-d3/a2-a3
	move	(sp)+,sr
	rts
SoundDriverLoad_Driver:
	if smps_assembler=0
	incbin "out/drv.bin"
	else
	binclude "out/drv.bin"
	endif
SoundDriverLoad_DriverEnd:
	SMPS_even