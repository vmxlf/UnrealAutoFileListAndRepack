@echo off
setlocal enabledelayedexpansion
chcp 65001 > nul

for %%p in ("%~1\..") do set "parentDir=%%~fp"

(
    for /f "delims=" %%i in ('dir /s /b /a-d "%~1"') do (
        set "fullPath=%%i"
        set "relativePath=!fullPath:%parentDir%\=!"
        echo "../../../!relativePath!"
    )
) > "list.txt"

endlocal
echo list.txt 파일 생성이 완료되었습니다.

Engine\Binaries\Win64\UnrealPak.exe ..\..\..\modpak_P.pak -Create=..\..\..\list.txt -compress

echo modpak_P.pak 파일 생성이 완료되었습니다.
pause