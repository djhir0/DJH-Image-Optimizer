@echo off
setlocal EnableDelayedExpansion

REM ============================================================
REM DJH IMAGE OPTIMIZER v8.2 AI CDN (DATE SUFFIX FIX) @djh.ir
REM ADDS YYYYMMDD TO ALL OUTPUT FILES @ _20260620-190058
REM ============================================================

set "VERSION=v8.2"
set "BUILD_DATE=2026-06-14"

set "MAGICK=C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe"
set "PYTHON=C:\Python312\python.exe"

set "CDN_BASE=/images/"

REM ============================================================
REM DATE (ONLY YYYYMMDD)
REM ============================================================

for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd"') do set DATEONLY=%%i

REM ============================================================
REM INPUT CHECK
REM ============================================================

if "%~1"=="" (
    echo Drag images onto this BAT file
    pause
    exit /b
)

REM ============================================================
REM FOLDER FILES
REM ============================================================

set "FOLDER=%~dp1"

set "SEOFILE=%FOLDER%image-seo-index-%DATEONLY%.html"
set "SITEMAP=%FOLDER%sitemap-images-%DATEONLY%.xml"
set "MANIFEST=%FOLDER%image-manifest-%DATEONLY%.json"

REM ============================================================
REM INIT SEO FILE
REM ============================================================

echo ^<!DOCTYPE html^> > "%SEOFILE%"
echo ^<html^>^<body^> >> "%SEOFILE%"
echo ^<h1^>DJH AI CDN v8.2^</h1^> >> "%SEOFILE%"

echo ^<?xml version="1.0" encoding="UTF-8"?^> > "%SITEMAP%"
echo ^<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"^> >> "%SITEMAP%"

echo { > "%MANIFEST%"
echo "images":[ >> "%MANIFEST%"

REM ============================================================
REM COUNTERS
REM ============================================================

set COUNT=0
set SUCCESS=0
set FAIL=0

set /a TOTAL_ORIG=0
set /a TOTAL_JPG=0
set /a TOTAL_WEBP=0
set /a TOTAL_AVIF=0

REM ============================================================
REM LOOP
REM ============================================================

:LOOP
if "%~1"=="" goto END

set /a COUNT+=1

set "FILE=%~1"
set "NAME=%~n1"
set "NAME=%NAME: =-%"

echo.
echo  ============================================================
echo  DJH IMAGE OPTIMIZER v8.2 AI CDN (DATE SUFFIX FIX)
echo  ADDS YYYYMMDD TO ALL OUTPUT FILES
echo ============================================================

echo "VERSION=v8.2"
echo "BUILD_DATE=2026-06-14"

echo "MAGICK=C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe"
echo "PYTHON=C:\Python312\python.exe"

echo "CDN_BASE=/images/"
echo .
echo ============================================================
echo Processing: %~nx1
echo ============================================================

for %%A in ("%FILE%") do set /a ORIGKB=%%~zA/1024

REM ============================================================
REM OUTPUT FILES (WITH DATE SUFFIX)
REM ============================================================

set "JPG=%FOLDER%%NAME%_djhir-%DATEONLY%.jpg"
set "WEBP=%FOLDER%%NAME%_djhir-%DATEONLY%.webp"
set "AVIF=%FOLDER%%NAME%_djhir-%DATEONLY%.avif"

REM ============================================================
REM IMAGE PROCESSING
REM ============================================================

"%MAGICK%" "%FILE%" -auto-orient -resize "900x900>" -quality 72 "%JPG%"
"%MAGICK%" "%FILE%" -auto-orient -resize "900x900>" -quality 68 "%WEBP%"

"%PYTHON%" -c "from PIL import Image; import pillow_avif; img=Image.open(r'%FILE%'); img.thumbnail((900,900)); img.save(r'%AVIF%', 'AVIF', quality=45)" >nul 2>&1

REM ============================================================
REM SIZE CALC
REM ============================================================

for %%A in ("%JPG%") do set /a JPGKB=%%~zA/1024
for %%A in ("%WEBP%") do set /a WEBPKB=%%~zA/1024

set "AVIF_OK=0"
if exist "%AVIF%" (
    for %%A in ("%AVIF%") do set /a AVIFKB=%%~zA/1024
    set "AVIF_OK=1"
) else (
    set "AVIFKB=0"
)

set /a SUCCESS+=1
set /a TOTAL_ORIG+=ORIGKB
set /a TOTAL_JPG+=JPGKB
set /a TOTAL_WEBP+=WEBPKB
set /a TOTAL_AVIF+=AVIFKB

REM ============================================================
REM OUTPUT
REM ============================================================

echo OK
echo Original : !ORIGKB! KB
echo JPG      : !JPGKB! KB
echo WEBP     : !WEBPKB! KB
echo AVIF     : !AVIFKB! KB

REM ============================================================
REM SEO OUTPUT (UPDATED FILE NAMES)
REM ============================================================

echo ^<div class="img-block"^>>> "%SEOFILE%"
echo ^<picture^>>> "%SEOFILE%"

if %AVIF_OK%==1 (
echo ^<source srcset="%CDN_BASE%%NAME%_djhir-%DATEONLY%.avif" type="image/avif"^>>> "%SEOFILE%"
)

echo ^<source srcset="%CDN_BASE%%NAME%_djhir-%DATEONLY%.webp" type="image/webp"^>>> "%SEOFILE%"
echo ^<img src="%CDN_BASE%%NAME%_djhir-%DATEONLY%.jpg" alt="%NAME%" loading="lazy" width="900"^>>> "%SEOFILE%"
echo ^</picture^>>> "%SEOFILE%"
echo ^</div^>>> "%SEOFILE%"
echo.>> "%SEOFILE%"

REM ============================================================
REM MANIFEST
REM ============================================================

echo {>> "%MANIFEST%"
echo "name":"%NAME%",>> "%MANIFEST%"
echo "jpg":"%CDN_BASE%%NAME%_djhir-%DATEONLY%.jpg",>> "%MANIFEST%"
echo "webp":"%CDN_BASE%%NAME%_djhir-%DATEONLY%.webp",>> "%MANIFEST%"
echo "avif":"%CDN_BASE%%NAME%_djhir-%DATEONLY%.avif">> "%MANIFEST%"
echo },>> "%MANIFEST%"

shift
goto LOOP

REM ============================================================
REM END
REM ============================================================

:END

echo ]>> "%MANIFEST%"
echo ^</urlset^> >> "%SITEMAP%"
echo ^</body^>^</html^> >> "%SEOFILE%"

echo.
echo ============================================================
echo SUMMARY
echo ============================================================
echo Files Processed : %COUNT%
echo Successful      : %SUCCESS%
echo Failed          : %FAIL%
echo.
echo Total Original KB : %TOTAL_ORIG%
echo Total JPG KB      : %TOTAL_JPG%
echo Total WEBP KB     : %TOTAL_WEBP%
echo Total AVIF KB     : %TOTAL_AVIF%
echo.
echo SEO FILE : %SEOFILE%
echo ============================================================

pause