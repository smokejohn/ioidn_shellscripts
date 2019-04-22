@echo off
set mconvert="%~dp0lib\ImageMagick\convert.exe"
set denoise="%~dp0lib\OIDN\bin\denoise.exe"

mkdir denoised
if [%1]==[] goto :eof
:loop
echo %1
%mconvert% %1 -endian LSB denoised\tmp_converted.pfm
echo =================
echo Starting Denoiser
echo =================
%denoise% -ldr denoised\tmp_converted.pfm -o denoised\tmp_denoised.pfm
%mconvert% denoised\tmp_denoised.pfm "denoised\d_%~n1%~x1"
shift
if not [%1]==[] goto loop

echo =====================
echo Cleaning up directory
echo =====================
del denoised\tmp_converted.pfm
del denoised\tmp_denoised.pfm

echo ==========
echo Job done!
echo ==========
pause
