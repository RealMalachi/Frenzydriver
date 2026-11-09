; =============================================================================================
; Created by Flamewing, based on S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================
SMPS2ASMVer	equ 1
; ---------------------------------------------------------------------------------------------
; Standard Octave Pitch Equates
smpsPitch10lo	equ $88
smpsPitch09lo	equ $94
smpsPitch08lo	equ $A0
smpsPitch07lo	equ $AC
smpsPitch06lo	equ $B8
smpsPitch05lo	equ $C4
smpsPitch04lo	equ $D0
smpsPitch03lo	equ $DC
smpsPitch02lo	equ $E8
smpsPitch01lo	equ $F4
smpsPitch00	equ $00
smpsPitch01hi	equ $0C
smpsPitch02hi	equ $18
smpsPitch03hi	equ $24
smpsPitch04hi	equ $30
smpsPitch05hi	equ $3C
smpsPitch06hi	equ $48
smpsPitch07hi	equ $54
smpsPitch08hi	equ $60
smpsPitch09hi	equ $6C
smpsPitch10hi	equ $78
; ---------------------------------------------------------------------------------------------
; Note Equates
nRst		equ $80
nC0		equ $81
nCs0		equ $82
nDb0		equ nCs0
nD0		equ $83
nDs0		equ $84
nEb0		equ nDs0
nE0		equ $85
nFb0		equ nE0
nEs0		equ $86
nF0		equ nEs0
nFs0		equ $87
nGb0		equ nFs0
nG0		equ $88
nGs0		equ $89
nAb0		equ nGs0
nA0		equ $8A
nAs0		equ $8B
nBb0		equ nAs0
nB0		equ $8C
nCb1		equ nB0
nBs0		equ $8D
nC1		equ nBs0
nCs1		equ $8E
nDb1		equ nCs1
nD1		equ $8F
nDs1		equ $90
nEb1		equ nDs1
nE1		equ $91
nFb1		equ nE1
nEs1		equ $92
nF1		equ nEs1
nFs1		equ $93
nGb1		equ nFs1
nG1		equ $94
nGs1		equ $95
nAb1		equ nGs1
nA1		equ $96
nAs1		equ $97
nBb1		equ nAs1
nB1		equ $98
nCb2		equ nB1
nBs1		equ $99
nC2		equ nBs1
nCs2		equ $9A
nDb2		equ nCs2
nD2		equ $9B
nDs2		equ $9C
nEb2		equ nDs2
nE2		equ $9D
nFb2		equ nE2
nEs2		equ $9E
nF2		equ nEs2
nFs2		equ $9F
nGb2		equ nFs2
nG2		equ $A0
nGs2		equ $A1
nAb2		equ nGs2
nA2		equ $A2
nAs2		equ $A3
nBb2		equ nAs2
nB2		equ $A4
nCb3		equ nB2
nBs2		equ $A5
nC3		equ nBs2
nCs3		equ $A6
nDb3		equ nCs3
nD3		equ $A7
nDs3		equ $A8
nEb3		equ nDs3
nE3		equ $A9
nFb3		equ nE3
nEs3		equ $AA
nF3		equ nEs3
nFs3		equ $AB
nGb3		equ nFs3
nG3		equ $AC
nGs3		equ $AD
nAb3		equ nGs3
nA3		equ $AE
nAs3		equ $AF
nBb3		equ nAs3
nB3		equ $B0
nCb4		equ nB3
nBs3		equ $B1
nC4		equ nBs3
nCs4		equ $B2
nDb4		equ nCs4
nD4		equ $B3
nDs4		equ $B4
nEb4		equ nDs4
nE4		equ $B5
nFb4		equ nE4
nEs4		equ $B6
nF4		equ nEs4
nFs4		equ $B7
nGb4		equ nFs4
nG4		equ $B8
nGs4		equ $B9
nAb4		equ nGs4
nA4		equ $BA
nAs4		equ $BB
nBb4		equ nAs4
nB4		equ $BC
nCb5		equ nB4
nBs4		equ $BD
nC5		equ nBs4
nCs5		equ $BE
nDb5		equ nCs5
nD5		equ $BF
nDs5		equ $C0
nEb5		equ nDs5
nE5		equ $C1
nFb5		equ nE5
nEs5		equ $C2
nF5		equ nEs5
nFs5		equ $C3
nGb5		equ nFs5
nG5		equ $C4
nGs5		equ $C5
nAb5		equ nGs5
nA5		equ $C6
nAs5		equ $C7
nBb5		equ nAs5
nB5		equ $C8
nCb6		equ nB5
nBs5		equ $C9
nC6		equ nBs5
nCs6		equ $CA
nDb6		equ nCs6
nD6		equ $CB
nDs6		equ $CC
nEb6		equ nDs6
nE6		equ $CD
nFb6		equ nE6
nEs6		equ $CE
nF6		equ nEs6
nFs6		equ $CF
nGb6		equ nFs6
nG6		equ $D0
nGs6		equ $D1
nAb6		equ nGs6
nA6		equ $D2
nAs6		equ $D3
nBb6		equ nAs6
nB6		equ $D4
nCb7		equ nB6
nBs6		equ $D5
nC7		equ nBs6
nCs7		equ $D6
nDb7		equ nCs7
nD7		equ $D7
nDs7		equ $D8
nEb7		equ nDs7
nE7		equ $D9
nFb7		equ nE7
nEs7		equ $DA
nF7		equ nEs7
nFs7		equ $DB
nGb7		equ nFs7
nG7		equ $DC
nGs7		equ $DD
nAb7		equ nGs7
nA7		equ $DE
nAs7		equ $DF
nBb7		equ nAs7

nMaxPSG		equ nBb6-12
nMaxPSG1	equ nBb6
nMaxPSG2	equ nB6
; ---------------------------------------------------------------------------------------------
; Channel IDs for SFX
cPSG1		equ $80
cPSG2		equ $A0
cPSG3		equ $C0
cNoise		equ $E0	; Not for use in S3/S&K/S3D
cFM3		equ $02
cFM4		equ $04
cFM5		equ $05
cFM6		equ $06	; Only in S3/S&K/S3D, overrides DAC
; ---------------------------------------------------------------------------------------------
makeSequencePointer macro x
	dc.b	(x)&$FF,(((x)>>8)&$7F)|(1<<7)
	endm

convertMainTempoMod macro mod
	if SourceDriver=1
		if mod=1
		fatal "Invalid main tempo of 1 in song from Sonic 1"
		endif
		dc.b	(256/((((mod=0)&1)*256)|mod))+(((256#((((mod=0)&1)*256)|mod))<>0)&1)
	elseif SourceDriver=2
		if mod=0
		fatal "Invalid main tempo of 0 in song from Sonic 2"
		endif
		dc.b	($100-mod)&$FF
	else
		dc.b	mod
	endif
	endm
; ---------------------------------------------------------------------------------------------
; Header Macros
smpsHeaderStartSong macro ver,sourcesmps2asmver
SourceDriver	set ver
SourceSMPS2ASM	set sourcesmps2asmver+0
songStart	set *
psgdelta	set ((ver<3)&1)*12
	if SMPS2ASMVer<SourceSMPS2ASM
	warning "This song was made for SMPS2ASM version $\{SourceSMPS2ASM}, whereas we only support up to version $\{SMPS2ASMVer}"
	endif
	endm

smpsHeaderVoiceNull macro
	if songStart<>*
	fatal "Missing smpsHeaderStartSong"
	endif
	dc.b	0,0
	endm

; Header - Set up Voice Location
; Common to music and SFX
smpsHeaderVoice macro loc
	if songStart<>*
	fatal "Missing smpsHeaderStartSong"
	endif
	makeSequencePointer loc
	endm

; Header - Set up Voice Location as S3's Universal Voice Bank
; Common to music and SFX
smpsHeaderVoiceUVB macro
	fatal "FM UVBs don't exist in this driver"
	endm

; Header macros for music (not for SFX)
; Header - Set up Channel Usage
smpsHeaderChan macro fm,psg
	dc.b	fm,psg
	endm

; Header - Set up Tempo
smpsHeaderTempo macro div,mod
	dc.b	div
	convertMainTempoMod mod
	endm

; Header - Set up DAC Channel
smpsHeaderDAC macro loc,pitch,vol
	makeSequencePointer loc
	if ARGCOUNT>2
	dc.b	pitch,vol
	elseif ARGCOUNT>1
	dc.b	pitch,$00
	else
	dc.b	0,0
	endif
	endm

; Header - Set up FM Channel
smpsHeaderFM macro loc,pitch,vol
	makeSequencePointer loc
	dc.b	pitch,vol
	endm

; Header - Set up PSG Channel
smpsHeaderPSG macro loc,pitch,vol,mod,voice
	makeSequencePointer loc
	if SourceDriver<3
	dc.b	(pitch+psgdelta)&$FF,vol,0,voice
	else
	dc.b	(pitch+psgdelta)&$FF,vol,mod,voice
	endif
	endm

; Header macros for SFX (not for music)
; Header - Set up Tempo
smpsHeaderTempoSFX macro div
	dc.b	div
	endm

; Header - Set up Channel Usage
smpsHeaderChanSFX macro chan
	dc.b	chan
	endm

; Header - Set up FM Channel
smpsHeaderSFXChannel macro chanid,loc,pitch,vol
	if chanid=cFM6
	fatal "Using channel ID of FM6 ($06) in Sonic 1 or Sonic 2 drivers is unsupported. Change it to another channel."
	endif
	dc.b	chanid
	makeSequencePointer loc
	if chanid>=cPSG1
	dc.b	(pitch+psgdelta)&$FF,vol
	else
	dc.b	pitch,vol
	endif
	endm

; ---------------------------------------------------------------------------------------------
; Co-ord Flag Macros and Equates

; note manipulation
smpsNoAttack	equ $E7
smpsNoteFill macro val
	if (SourceDriver>=3)
	warning "S3K note fill isn't supported, you'll need to multiply the fill value by the tempo divider"
	endif
	dc.b	$E8,val
	endm

; time
; Set music tempo modifier to xx
smpsSetTempoMod macro mod
	dc.b	$EA
	convertMainTempoMod mod
	endm
; Set music tempo divider to xx
smpsSetTempoDiv macro val
	dc.b	$EB,val
	endm
; E5xx - Set channel tempo divider to xx
smpsChanTempoDiv macro val
	dc.b	$E5,val
	endm

; panning
panNone		equ $00
panRight	equ $40
panLeft		equ $80
panCentre	equ $C0
panCenter	equ $C0
smpsPan macro direction,amsfms
	dc.b	$E0,direction+amsfms
	endm

; volume
smpsAlterVol macro val
	dc.b	$E6,val
	endm
smpsFMAlterVol macro val1,val2
	dc.b	$E6,val1
	endm
smpsPSGAlterVol macro vol
	dc.b	$EC,vol
	endm
smpsPSGAlterVolS2 macro
	dc.b	$EC,vol
	endm
smpsPSGvoice macro voice
	dc.b	$F5,voice
	endm

; pitch
smpsAlterPitch macro val
	dc.b	$E9,val
	endm

; modulation
smpsAlterNote macro val
	dc.b	$E1,val
	endm
smpsModSet macro wait,speed,change,step
	if SourceDriver>=3
	dc.b	$F0,wait-1,speed,change,((((step=0)&1)*256)+step)/((((speed=0)&1)*256)+speed)-1
	else
	dc.b	$F0,wait,speed,change,step
	endif
	endm
smpsModOn macro
	dc.b	$F1
	endm
smpsModOff macro
	dc.b	$F4
	endm

; sequence control
smpsStop macro
	dc.b	$F2
	endm
smpsStopSpecial macro
	warning "Coord. Flag to stop special SFX does not exist in S2 or S3 drivers. Complain to Flamewing to add it. With adequate caution, smpsStop can do this job."
	dc.b	$F2
	endm
smpsFade macro val
	dc.b	$F2
	endm
smpsJump macro loc
	dc.b	$F6
	makeSequencePointer loc
	endm
smpsLoop macro index,loops,loc
	dc.b	$F7,index,loops
	makeSequencePointer loc
	endm
smpsCall macro loc
	dc.b	$F8
	makeSequencePointer loc
	endm
smpsReturn macro val
	dc.b	$E3
	endm

; communication
smpsNop macro val
	dc.b	$E2,val
	endm
smpsComm macro val
	dc.b	$E2,val
	endm

; hardware-specific control
smpsSetvoice macro voice
	dc.b	$EF,voice
	endm
smpsFMvoice macro voice
	dc.b	$EF,voice
	endm
smpsPSGform macro form
	dc.b	$F3,form
	endm
smpsPSGpulse macro
	dc.b	$F3,0
	endm
smpsFMICommand macro reg,val
	dc.b	$F9,reg,val
	endm

; misc
smpsWeirdD1LRR macro
	smpsFMICommand $88,$0F
	smpsFMICommand $8C,$0F
	endm
smpsSpindashRev macro
	dc.b	$E4
	endm
; ---------------------------------------------------------------------------------------------
; Clears pushing sound flag in S1
smpsClearPush macro
	fatal "smpsClearPush isn't supported"
	endm

; S3/S&K/S3D-only coordination flags

smpsSetVol macro val
	fatal "Coord. Flag to set volume (instead of volume attenuation) does not exist in S1 or S2 drivers. Complain to Flamewing to add it."
	endm

; Silences FM channel then stops as per smpsStop
smpsStopFM macro
	fatal "smpsStopFM isn't supported"
	endm

smpsPlayDACSample macro sample
	fatal "smpsPlayDACSample isn't supported"
	endm
	
smpsConditionalJump macro index,loc
	fatal "smpsConditionalJump isn't supported"
	endm

; Set pitch to xx-$40
smpsSetNote macro val
	fatal "smpsSetNote isn't supported"
	endm

smpsFMIICommand macro reg,val
	fatal "smpsFMICommand isn't supported"
	endm
smpsChanFMCommand macro reg,val
	fatal "smpsChanFMCommand isn't supported"
	endm

smpsModChange2 macro fmmod,psgmod
	fatal "smpsModChange2 isn't supported"
	endm
smpsModChange macro val
	fatal "smpsModChange isn't supported"
	endm

smpsContinuousLoop macro loc
	fatal "smpsContinuousLoop isn't supported"
	endm

smpsAlternateSMPS macro flag
	fatal "smpsAlternateSMPS isn't supported"
	endm

smpsFM3SpecialMode macro ind1,ind2,ind3,ind4
	fatal "smpsFM3SpecialMode isn't supported"
	endm

smpsPlaySound macro index
	fatal "smpsPlaySound isn't supported"
	endm

smpsHaltMusic macro flag
	fatal "smpsHaltMusic isn't supported"
	endm

smpsCopyData macro data,len
	fatal "smpsCopyData isn't supported"
	endm

smpsSSGEG macro op1,op2,op3,op4
	fatal "smpsSSGEG isn't supported"
	endm

smpsFMFlutter macro tone,mask
	fatal "smpsFMFlutter isn't supported"
	endm

smpsResetSpindashRev macro val
	fatal "smpsResetSpindashRev isn't supported"
	endm

; ---------------------------------------------------------------------------------------------
; Macros for FM instruments
; ---------------------------------------------------------------------------------------------
; Voices - Feedback
smpsVcFeedback macro val
vcFeedback	set val
	endm

; Voices - Algorithm
smpsVcAlgorithm macro val
vcAlgorithm	set val
	endm

smpsVcUnusedBits macro val
vcUnusedBits	set val
	endm

; Voices - Detune
smpsVcDetune macro op1,op2,op3,op4
vcDT1	set op1
vcDT2	set op2
vcDT3	set op3
vcDT4	set op4
	endm

; Voices - Coarse-Frequency
smpsVcCoarseFreq macro op1,op2,op3,op4
vcCF1	set op1
vcCF2	set op2
vcCF3	set op3
vcCF4	set op4
	endm

; Voices - Rate Scale
smpsVcRateScale macro op1,op2,op3,op4
vcRS1	set op1
vcRS2	set op2
vcRS3	set op3
vcRS4	set op4
	endm

; Voices - Attack Rate
smpsVcAttackRate macro op1,op2,op3,op4
vcAR1	set op1
vcAR2	set op2
vcAR3	set op3
vcAR4	set op4
	endm

; Voices - Amplitude Modulation
smpsVcAmpMod macro op1,op2,op3,op4
	if SourceSMPS2ASM=0
vcAM1	set op1<<5
vcAM2	set op2<<5
vcAM3	set op3<<5
vcAM4	set op4<<5
	else
vcAM1	set op1<<7
vcAM2	set op2<<7
vcAM3	set op3<<7
vcAM4	set op4<<7
	endif
	endm

; Voices - First Decay Rate
smpsVcDecayRate1 macro op1,op2,op3,op4
vcD1R1	set op1
vcD1R2	set op2
vcD1R3	set op3
vcD1R4	set op4
	endm

; Voices - Second Decay Rate
smpsVcDecayRate2 macro op1,op2,op3,op4
vcD2R1	set op1
vcD2R2	set op2
vcD2R3	set op3
vcD2R4	set op4
	endm

; Voices - Decay Level
smpsVcDecayLevel macro op1,op2,op3,op4
vcDL1	set op1
vcDL2	set op2
vcDL3	set op3
vcDL4	set op4
	endm

; Voices - Release Rate
smpsVcReleaseRate macro op1,op2,op3,op4
vcRR1	set op1
vcRR2	set op2
vcRR3	set op3
vcRR4	set op4
	endm

; Voices - Total Level
;   0     1     2     3     4     5     6     7
;%1000,%1000,%1000,%1000,%1010,%1110,%1110,%1111
smpsVcTotalLevel macro op1,op2,op3,op4
	if (SourceDriver<3)|(SourceSMPS2ASM=0)
vcTL1	set (op1&$7F)|(1<<7)
vcTL2	set (op2&$7F)|((vcAlgorithm>=5)<<7)
vcTL3	set (op3&$7F)|((vcAlgorithm>=4)<<7)
vcTL4	set (op4&$7F)|((vcAlgorithm=7)<<7)
	else
vcTL1	set op1
vcTL2	set op2
vcTL3	set op3
vcTL4	set op4
	endif
	dc.b	(vcUnusedBits<<6)+(vcFeedback<<3)+vcAlgorithm
	dc.b	(vcDT4<<4)+vcCF4,(vcDT2<<4)+vcCF2,(vcDT3<<4)+vcCF3,(vcDT1<<4)+vcCF1
	dc.b	(vcRS4<<6)+vcAR4,(vcRS2<<6)+vcAR2,(vcRS3<<6)+vcAR3,(vcRS1<<6)+vcAR1
	dc.b	vcAM4+vcD1R4,vcAM2+vcD1R2,vcAM3+vcD1R3,vcAM1+vcD1R1
	dc.b	vcD2R4,vcD2R2,vcD2R3,vcD2R1
	dc.b	(vcDL4<<4)+vcRR4,(vcDL2<<4)+vcRR2,(vcDL3<<4)+vcRR3,(vcDL1<<4)+vcRR1
	dc.b	vcTL4,vcTL2,vcTL3,vcTL1
	endm