@echo off
setlocal enabledelayedexpansion
if not exist out mkdir out
REM // /o c+
REM // -U
echo ============================================
echo Building the driver
tools\sjasmplus.exe src-z80/drv.a80 --nologo --msg=war -Wno-fileorg -DOUTPATH=\"out/drv.bin\" --raw=out/drv-raw.bin --lst=out/drv.lst --sym=out/drv.sym --exp=out/drv.exp >out\drv.txt
echo ============================================
echo Building the API for ASM68K (binary)
tools\asm68k.exe /k /m /p build_asm68k.asm,out\asm68k_binary.bin > out\asm68k_binary.log,out\asm68k_binary.sym,out\asm68k_binary.lst
type out\asm68k_binary.log
echo ============================================
echo Building the API for ASM68K (object)
tools\asm68k.exe /k /m /l build_asm68k.asm,out\asm68k_object.cof > out\asm68k_object.log,out\asm68k_object.sym,out\asm68k_object.lst
type out\asm68k_object.log
echo ============================================
echo Building the API for ASL
tools\asw.exe -xx -n -A -L -i . -g map -olist out\asl.lst -E out\asl.log build_asl.asm
tools\p2bin.exe build_asl.p out\asl.bin ""
move build_asl.p out
move build_asl.map out
echo ============================================
echo Building the test rom
tools\sjasmplus.exe "src-z80/entry.a80" --nologo --msg=war  --raw=out/entry-z80.bin
tools\asw.exe -xx -n -A -L -U -i . -g map -olist out\testrom.lst -E out\testrom.log build_testrom.asm
tools\p2bin.exe build_testrom.p smps-testrom.gen ""
move build_testrom.p out
move build_testrom.map out
echo ============================================
pause
:EOF
