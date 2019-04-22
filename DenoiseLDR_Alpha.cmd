@echo off
set mconvert="%~dp0lib\ImageMagick\convert.exe"
set denoise="%~dp0lib\OIDN\bin\denoise.exe"

%mconvert% %1 -endian LSB tmp_converted.pfm

echo =================
echo Starting Denoiser
echo =================
%denoise% -ldr tmp_converted.pfm -o tmp_denoised.pfm
%mconvert% tmp_denoised.pfm "tmp_denoised_noalpha%~x1"

echo =====================
echo Copying Alpha Channel
echo =====================
%mconvert% "tmp_denoised_noalpha%~x1" %1 -compose CopyOpacity -composite PNG32:"%~n1_denoised%~x1"

echo =====================
echo Cleaning up directory
echo =====================
del tmp_converted.pfm
del tmp_denoised.pfm
del "tmp_denoised_noalpha%~x1"

echo ==========
echo Job done!
echo ==========
pause
