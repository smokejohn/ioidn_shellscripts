@echo off
set mconvert="%~dp0lib\ImageMagick\convert.exe"
set denoise="%~dp0lib\OIDN\bin\denoise.exe"

%mconvert% %1 -endian LSB tmp_converted.pfm

echo =================
echo Starting Denoiser
echo =================
%denoise% -hdr tmp_converted.pfm -o tmp_denoised.pfm
%mconvert% tmp_denoised.pfm "tmp_denoised_noalpha%~x1"

echo =====================
echo Copying Alpha Channel
echo =====================
%mconvert% "tmp_denoised_noalpha%~x1" %1 -compose CopyOpacity -composite -compress zip "%~n1_denoised%~x1"

echo =================
echo Creating Previews
echo =================
%mconvert% %1 -colorspace RGB -colorspace sRGB -alpha on tmp_before.png
%mconvert% "%~n1_denoised%~x1" -colorspace RGB -colorspace sRGB -alpha on tmp_after.png

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
