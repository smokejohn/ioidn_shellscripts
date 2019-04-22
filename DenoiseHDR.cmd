@echo off
set mconvert="%~dp0lib\ImageMagick\convert.exe"
set denoise="%~dp0lib\OIDN\bin\denoise.exe"

%mconvert% %1 -endian LSB tmp_converted.pfm

echo =================
echo Starting Denoiser
echo =================
%denoise% -hdr tmp_converted.pfm -o tmp_denoised.pfm
%mconvert% tmp_denoised.pfm -compress zip "%~n1_denoised%~x1"

echo =================
echo Creating Previews
echo =================
%mconvert% %1 -colorspace RGB -colorspace sRGB tmp_before.png
%mconvert% "%~dpn1_denoised%~x1" -colorspace RGB -colorspace sRGB tmp_after.png

echo =====================
echo Cleaning up directory
echo =====================
del tmp_converted.pfm
del tmp_denoised.pfm

echo ==========
echo Job done!
echo ==========
pause
