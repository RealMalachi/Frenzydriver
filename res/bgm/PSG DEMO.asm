BGM_PSG3Test_Header:
	smpsHeaderStartSong	2
	smpsHeaderVoice		BGM_PSG3Test_Voices
	smpsHeaderChan		$00, $03
	smpsHeaderTempo		$01, $9F

	smpsHeaderPSG		BGM_PSG3Test_PSG1,	$F4, $03, $00, smlTone_03
	smpsHeaderPSG		BGM_PSG3Test_PSG2,	$F4, $00, $00, fTone_04
	smpsHeaderPSG		BGM_PSG3Test_PSG3,	$F4, $05, $00, fTone_0B

BGM_PSG3Test_PSG1:
	smpsAlterNote	$01
	dc.b	nG3, $04, nD3, nC3, nG2, nF3, nD3, nC3, nF2, nF2, nA2, nC3, nF3
	dc.b	nF2, nA2, nC3
	smpsPSGvoice	fTone_0B
	dc.b	nF3, $44
	smpsPSGAlterVol	$FE
	smpsPSGvoice	fTone_04

BGM_PSG3Test_PSG1_Jump:
	smpsCall	BGM_PSG3Test_Call00
	dc.b	nRst, $40
	smpsPSGAlterVol	$F4
	smpsLoop	$00, $02, BGM_PSG3Test_PSG1_Jump
	smpsCall	BGM_PSG3Test_Call02
	dc.b	nD3, nE3, nRst, nB3, $0C, nA3, $04, nRst, nG3, $20
	smpsCall	BGM_PSG3Test_Call02
	dc.b	nC3, $04, nD3, nRst, nDs3, $08, nAs2, $04, nE3, $0C, nF3, $04, nRst
	dc.b	nG2
	smpsModSet	$01, $01, $F0, $15
	dc.b	nG3, $02
	smpsModSet	$01, $01, $01, $02
	dc.b	smpsNoAttack, nB3, $06, nA3, $08
	smpsJump	BGM_PSG3Test_PSG1_Jump

BGM_PSG3Test_Call00:
	smpsCall	BGM_PSG3Test_Call01
	smpsPSGAlterVol	$03
	smpsLoop	$01, $04, BGM_PSG3Test_Call00
	smpsReturn

BGM_PSG3Test_Call02:
	smpsCall	BGM_PSG3Test_Call01
	smpsModSet	$01, $01, $01, $02
	smpsCall	BGM_PSG3Test_Call03
	dc.b	nD3, nE3, nRst, nG2, $0C, $04, nRst, nF2, $08, nRst, $04, nF2, $02
	dc.b	nRst, nG2, $10
	smpsCall	BGM_PSG3Test_Call01
	smpsModSet	$01, $01, $01, $02
	smpsCall	BGM_PSG3Test_Call03
	smpsReturn

BGM_PSG3Test_Call01:
	smpsModSet	$08, $01, $14, $15
	dc.b	nG3, $08, nRst
	smpsReturn

BGM_PSG3Test_Call03:
	dc.b	nD3, $04, nE3, nRst, nF3, $0C, $04, nRst, nE3, nRst, nD3, nRst
	smpsReturn

BGM_PSG3Test_PSG2:
	smpsNoteFill	$08
	smpsCall	BGM_PSG3Test_Call04
	dc.b	nE1
	smpsNoteFill	$00
	dc.b	nD1, $28
	smpsNoteFill	$08
	dc.b	nF1, $04, $0C, $04, $0C

BGM_PSG3Test_PSG2_Jump:
	smpsCall	BGM_PSG3Test_Call04
	dc.b	nE1, nD1
	smpsCall	BGM_PSG3Test_Call04
	dc.b	nF1, nF1
	smpsCall	BGM_PSG3Test_Call04
	dc.b	nE1, nD1
	smpsCall	BGM_PSG3Test_Call04
	dc.b	nE1, nF1
	smpsLoop	$00, $02, BGM_PSG3Test_PSG2_Jump
	smpsCall	BGM_PSG3Test_Call04
	dc.b	nE1, nD1
	smpsCall	BGM_PSG3Test_Call04
	dc.b	nF1, nF1
	smpsCall	BGM_PSG3Test_Call04
	dc.b	nE1, nD1
	dc.b	nD1, $08, nD1, $04, nDs1, $08, nD1, $04, nE1, $08, nD1, $04
	dc.b	nF1, $08, nDs1, $04, nFs1, $08, nG1
	smpsJump	BGM_PSG3Test_PSG2_Jump

BGM_PSG3Test_Call04:
	dc.b	nG1, $08, $08, nD1, nE1, $04, nF1, $08, $04, $08
	smpsReturn

BGM_PSG3Test_PSG3:
	smpsModSet	$01, $01, $01, $02
	dc.b	nG2, $20, nD2, $10, nG2, $08, nF2, $48

BGM_PSG3Test_PSG3_Jump:
	smpsAlterPitch	$0C
	smpsPSGAlterVol	$FB
	smpsPSGform	$E7
	smpsPSGvoice	fTone_02
	smpsModOff

BGM_PSG3Test_PSG3_Loop:
	dc.b	nG2, $04, nMaxPSG, nMaxPSG, nMaxPSG, nG4, nMaxPSG, nMaxPSG
	dc.b	nG4, nG2, nMaxPSG, nMaxPSG, nMaxPSG, nG4, nMaxPSG, nMaxPSG
	dc.b	nMaxPSG
	smpsLoop	$00, $0B, BGM_PSG3Test_PSG3_Loop
	smpsAlterPitch	$F4
	smpsPSGAlterVol	$05
	smpsPSGpulse
	smpsPSGvoice	fTone_0B
	smpsNoteFill	$10
	smpsModSet	$01, $01, $01, $02
	dc.b	nD2, $0C, nDs2, nE2, nF2, nFs2, nG2, $04
	smpsNoteFill	$00
	smpsJump	BGM_PSG3Test_PSG3_Jump

BGM_PSG3Test_DAC:
	smpsStop

BGM_PSG3Test_Voices: