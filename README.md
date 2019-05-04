# Intel Open Image Denoise - Windows Shell scripts (Drag&Drop)

Simple Windows shell scripts with Drag&Drop support, just drag the image you want to denoise onto the cmd-file

## Scripts

**DenoiseHDR.cmd** - For denoising HighDynamicRange images (openEXR)

**DenoiseHDR_Alpha.cmd** - Same as DenoiseHDR but keeps the Alpha Channel

**DenoiseLDR.cmd** - For denoising LowDynamicRange images (Standard 8bit srgb images) (recommended format .png)

**DenoiseLDR_Alpha.cmd** - Same as DenoiseLDR but keeps the Alpha Channel

**DenoiseLDR_Anim.cmd** - For denoising Animations, simply drag the image sequence onto this script

**Heads up**: Currently the shell scripts perform the most basic denoise the binary offers, taking only the beauty pass render

*The denoiser offers input for 3 passes (beauty, albedo, normal) and delivers way better results but these shell scripts don't offer that (yet).*

## Installing

These shell scripts rely on ImageMagick in addition to the IntelOpenImageDenoiser and expect the binaries to reside
in the following folder structure
```
.
+-- lib/
    +-- ImageMagick/
    +-- OIDN/
DenoiseHDR.cmd
DenoiseHDR_Alpha.cmd
...
```
get the required binaries here:

* [ImageMagick](https://imagemagick.org/download/binaries/ImageMagick-7.0.8-41-portable-Q16-x64.zip) - ImageMagick Portable 64-bit (7.0.8.41)

* [IntelOpenImageDenoise](https://github.com/OpenImageDenoise/oidn/releases/download/v0.8.2/oidn-0.8.2.x64.vc14.windows.zip) - oidn-0.8.2.x64.vc.windows.zip

* unzip ImageMagick and place the contents of the folder into lib/ImageMagick

* unzip oidn and place the contents of the folder into lib/OIDN

Your Folder structure should look like this in the end:

```
.
+-- lib/
    ~-- ImageMagick/
        +-- images
        +-- www
        Changelog
        colors.xml
        ...
    ~-- OIDN/
        +-- bin
        +-- doc
        +-- include
        +-- lib
DenoiseHDR.cmd
DenoiseHDR_Alpha.cmd
...
```
