SoundDriverLoad_Data:
		SMPS_startData
		zMakeLEW zMasterPlaylist
		zMakeLEW zDACPtrTbl
		zMakeLEW zVolEnv
		zMakeBnk SoundIndex
		zMakePtr SoundIndex
		dc.b MusID__First,MusID__End
		dc.b SndID__First,SndID__End
		dc.b bgmid_ExtraLife
		segadef Sega,16500
zVolEnv:
		volenvdef s2Tone_01,fTone_01
		volenvdef s2Tone_02,fTone_02
		volenvdef s2Tone_03,fTone_03
		volenvdef s2Tone_04,fTone_04
		volenvdef s2Tone_05,fTone_05
		volenvdef s2Tone_06,fTone_06
		volenvdef s2Tone_07,fTone_07
		volenvdef s2Tone_08,fTone_08
		volenvdef s2Tone_09,fTone_09
		volenvdef s2Tone_0A,fTone_0A
		volenvdef s2Tone_0B,fTone_0B
		volenvdef s2Tone_0C,fTone_0C
		volenvdef s2Tone_0D,fTone_0D
		volenvdef s1mlTone_03,smlTone_03
		volenvdef VolEnv_c01,cTone_01
		volenvdef VolEnv_c02,cTone_02
		volenvdef VolEnv_c03,cTone_03
		volenvdef VolEnv_c04,cTone_04
		volenvdef VolEnv_c05,cTone_05
		volenvdef VolEnv_c06,cTone_06
		volenvdef VolEnv_c07,cTone_07
		volenvdef VolEnv_c08,cTone_08
		volenvdef VolEnv_c09,cTone_09
		volenvdef VolEnv_c0A,cTone_0A
		volenvdef VolEnv_c0B,cTone_0B
		volenvdef VolEnv_c0C,cTone_0C
		volenvdef VolEnv_c0D,cTone_0D
		volenvdef VolEnv_c0E,cTone_0E
s2Tone_01:
		envpsg 0,0,0,1,1,1,2,2,2,3,3,3,4,4,4,5
		envpsg 5,5,6,6,6,7,HOLD
s2Tone_02:
		envpsg 0,2,4,6,8,15,HOLD
s2Tone_03:
		envpsg 0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,HOLD
s2Tone_04:
		envpsg 0,0,2,3,4,4,5,5,5,6,HOLD
s2Tone_06:
		envpsg 3,3,3,2,2,2,2,1,1,1,0,0,0,0,HOLD
s2Tone_05:
		envpsg 0,0,0,0,0,0,0,0,0,0,1,1
		envpsg 1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2
		envpsg 2,2,2,2,3,3,3,3,3,3,3,3,4,HOLD
s2Tone_07:
		envpsg 0,0,0,0,0,0,1,1,1,1,1,2,2,2,2,2
		envpsg 3,3,3,4,4,4,5,5,5,6,7,HOLD
s2Tone_08:
		envpsg 0,0,0,0,0,1,1,1,1,1,2,2,2,2,2,2
		envpsg 3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6
		envpsg 6,6,6,6,7,7,7,HOLD
s2Tone_09:
		envpsg 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,HOLD
s2Tone_0A:
		envpsg 0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1
		envpsg 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
		envpsg 1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2
		envpsg 2,2,3,3,3,3,3,3,3,3,3,3,4,HOLD
s2Tone_0B:
		envpsg 4,4,4,3,3,3,2,2,2,1,1,1,1,1,1,1
		envpsg 2,2,2,2,2,3,3,3,3,3,4,HOLD
s2Tone_0C:
		envpsg 4,4,3,3,2,2,1,1,1,1,1,1,1,1,1,1
		envpsg 1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2
		envpsg 2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3
		envpsg 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
		envpsg 3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4
		envpsg 4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5
		envpsg 5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6
		envpsg 6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,HOLD
s2Tone_0D:
		envpsg 14,13,12,11,10,9,8,7,6,5,4,3,2,1,0,HOLD

s1mlTone_03:	envpsg 0,0,1,4,9,11,15,HOLD

VolEnv_c01:	envpsg $02,REST
VolEnv_c02:	envpsg $00,$00,$00,$02,$04,$06,$08,$10,REST
VolEnv_c03:	envpsg 1, 0, 0, 0, 2, 4, 6, 8, 16, REST
VolEnv_c04:	envpsg 4, 3, 2, 1, 0, 0, 1, 1, 2, 2, 2, HOLD
VolEnv_c05:	envpsg 3, 0, 1, 1, 1, 2, 3, 4, 4, 5, HOLD
VolEnv_c06:	envpsg 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3
		envpsg 3, 3, 4, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 8, 10, 12, 14, 16, 18, REST
VolEnv_c07:	envpsg 18, 18, 17, 17, 16, 16, 15, 15, 15, 14, 14, 14, 13, 13, 13, 13
		envpsg 12, 12, 12, 12, 11, 11, 11, 11, 11, 10, 10, 10, 10, 9, 9
		envpsg 9, 9, 8, 8, 8, 8, 7, 7, 7, 7, 6, 6, 6, 6, 5, 5, 5, 5
		envpsg 4, 4, 4, 4, 3, 3, 3, 2, 2, 2, 1, 1, 1, 0, 0, 2, 1, 0, HOLD
VolEnv_c08:	envpsg 2, 1, 0, 0, 1, 1, 2, HOLD
VolEnv_c09:	envpsg 6, 6, 6, 6, 6, 5, 5, 5, 5, 5, 4, 4, 4, 3, 3, 3, 3, 3, 3, 2, HOLD
VolEnv_c0A:	envpsg 1, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 5, 5, HOLD
VolEnv_c0B:	;smpsEnvVol    16, 32, 48, 64, 48, 32, 16, 0, -16, REPEAT
VolEnv_c0C:	envpsg 0, 0, 1, 1, 3, 3, 4, 5, REST
VolEnv_c0D:	envpsg 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5
		envpsg 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, HOLD
VolEnv_c0E:	envpsg 0, 0, 2, 5, 9, 14, REST

MusID__First	equ $01
zMasterPlaylist:
		bgmdef 0,BgmMCZ,bgmid_MCZ
		bgmdef 0,BgmSYZ,bgmid_SYZ
		bgmdef 0,BgmExtraLife,bgmid_ExtraLife
		bgmdef 0,BgmPsgDemo,bgmid_PsgDemo
		bgmdef 0,BgmChildsSong,bgmid_ChildsSong
MusID__End	equ MusID__First+(((*)-zMasterPlaylist)/4)

zDACPtrTbl:
		pcmdef Kick,8250,dKick
		pcmdef Snare,24000,dSnare
		pcmdef Clap,17000,dClap
		pcmdef Scratch,15000,dScratch
		pcmdef Timpani,9750,dHiTimpani
		pcmdef Timpani,8750,dMidTimpani
		pcmdef Timpani,7500,dTimpani
		pcmdef Timpani,7250,dLowTimpani
		pcmdef Timpani,7000,dVLowTimpani
		pcmdef Tom,23000,dMidTom	; look at the Hz rates and tell me with a straight face that the IDs are accurate
		pcmdef Tom,18000,dLowTom
		pcmdef Tom,14000,dHiTom
		pcmdef Tom,15000,dFloorTom
		pcmdef Bongo,15000,dHiClap	; these... aren't claps
		pcmdef Bongo,13000,dMidClap
		pcmdef Bongo,9750,dLowClap
		pcmdef Bongo,7500,dVLowClap

		SMPS_finishData
SoundDriverLoad_DataEnd:
; ---------------------------------------------------------------------------
		startBank
BgmMCZ:		include "res/bgm/MCZ.asm"
BgmSYZ:		include "res/bgm/SYZ.asm"
BgmExtraLife:	include "res/bgm/ExtraLife.asm"
BgmPsgDemo:	include "res/bgm/PSG DEMO.asm"
BgmChildsSong:	include "res/bgm/childs_song.asm"
		finishBank
; ---------------------------------------------------------------------------
		startBank
SoundIndex:
SndID__First	equ MusID__End
		sfxdef	$80,SfxJump,sfxid_Jump
		sfxdef	$80,SfxSkid,sfxid_Skid
		sfxdef	$80,SfxSpike,sfxid_Spike
		sfxdef	$80,SfxSpindash,sfxid_Spindash
		sfxdef	$80,SfxJingle,sfxid_Jingle
SndID__End	equ SndID__First+(((*)-SoundIndex)/3)

SfxJump:	include "res/sfx/Jump.asm"
SfxSkid:	include "res/sfx/Skid 2ch.asm"
SfxSpike:	include "res/sfx/Spike Move.asm"
SfxSpindash:	include "res/sfx/Spin Dash Rev.asm"
SfxJingle:	include "res/sfx/Continue Jingle.asm"
		finishBank
; ---------------------------------------------------------------------------
		incpcm Kick,"res/pcm/Kick.dpcm"
		incpcm Snare,"res/pcm/Snare.dpcm"
		incpcm Timpani,"res/pcm/Timpani.dpcm"
		incpcm Tom,"res/pcm/Tom.dpcm"
		incpcm Bongo,"res/pcm/Bongo.dpcm"
		incpcm Clap,"res/pcm/Clap.dpcm"
		incpcm Scratch,"res/pcm/Scratch.dpcm"
		incpcm Sega,"res/pcm/SEGA.pcm"
; ---------------------------------------------------------------------------
	SMPS_even