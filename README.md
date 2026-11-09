# Frenzydriver - An SMPS fork for those who just need a semi-functional Z80 driver

Features:
- Z80 driver has zero cross-referencing or game specific hardcoding
- 68K API works on both ASM68K and ASL
- DPCM samples aren't bound by rom banks
- BGMs have infinite rom banks
- FM supports volume envelopes
- PSG3 can reliably switch between square and noise

Notes:
- DPCM samples have a 64kb size limit
- DPCM sample playback is still handicapped from lacking DMA protection and updating during the sequencer
- SFXs are still limited to only one bank
- You need to handle ring panning and CPZ ball gloop sound logic outside of the driver. smps-routines has commented code for handling that

Roadmap, no particular order:
- Support smps2asm version 1, as this was based on version 0
- Make 1UP jingle a per-BGM flag, rather then only being for one ID
- Move commands outside of the ID queues
- Time sequencer using YM timers instead of V-int (improves PAL playback)
- Update samples during the sequencer (improves playback quality)
- Make sequences not be bound by rom banks
- Add various features and conveniences, namely from SMPS-Dusted
- Native Mega CD/32X support
- DPCM-HQ support, because why not?
- Consider adding back compressed BGMs
