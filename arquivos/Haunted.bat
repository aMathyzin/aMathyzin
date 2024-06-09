@echo off
color 0f
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
if '%errorlevel%' EQU '0' ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

@chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a" & set "ESC=%%b")
call :POWERSHELL "$Host.UI.RawUI.WindowTitle = '[👻] Haunted Mathy'"

::Colors
set [RESET]=%ESC%[97m
set [DARK_MAGENTA]=%ESC%[1;35m
set [BRIGHT_MAGENTA]=%ESC%[1;95m
set [DARK_RED]=%ESC%[1;31m
set [BRIGHT_RED]=%ESC%[1;91m
set [BRIGHT_BLACK]=%ESC%[1;90m
set [BRIGHT_GREEN]=%ESC%[1;92m

::Tweaks
set "t_mouse_teclado=0"
set "t_conexao=0"
set "t_ram=0"
set "t_latencia_fps=0"

::misc
set restore=0

dir "C:\Program Files\Windows Media Player" >nul 2>&1
if %errorlevel% EQU 0 (
    set WMPlayer=1
) else (
    set WMPlayer=0
)
::Resources
if not exist "%temp%\loading.vbs" (
    ::Loading
    echo>%temp%\loading.vbs Set Sound ^= CreateObject^("WMPlayer.OCX.7"^)
    echo>>%temp%\loading.vbs Sound.URL ^= "C:\Windows\media\Alarm03.wav"
    echo>>%temp%\loading.vbs Sound.Controls.play
    echo>>%temp%\loading.vbs do while Sound.currentmedia.duration ^= 0
    echo>>%temp%\loading.vbs    wscript.sleep 100
    echo>>%temp%\loading.vbs    loop
    echo>>%temp%\loading.vbs    wscript.sleep ^(int^(Sound.currentmedia.duration^)+1^)*1000
)
if not exist "%temp%\opening.vbs" (
    ::Opening
    echo>%temp%\opening.vbs Set Sound ^= CreateObject^("WMPlayer.OCX.7"^)
    echo>>%temp%\opening.vbs Sound.URL ^= "C:\Windows\media\notify.wav"
    echo>>%temp%\opening.vbs Sound.Controls.play
    echo>>%temp%\opening.vbs do while Sound.currentmedia.duration ^= 0
    echo>>%temp%\opening.vbs    wscript.sleep 100
    echo>>%temp%\opening.vbs    loop
    echo>>%temp%\opening.vbs    wscript.sleep ^(int^(Sound.currentmedia.duration^)+1^)*1000
) 
if not exist "%temp%\ok.vbs" (
    ::Ok
    echo>%temp%\ok.vbs Set Sound ^= CreateObject^("WMPlayer.OCX.7"^)
    echo>>%temp%\ok.vbs Sound.URL ^= "C:\Windows\media\Speech On.wav"
    echo>>%temp%\ok.vbs Sound.Controls.play
    echo>>%temp%\ok.vbs do while Sound.currentmedia.duration ^= 0
    echo>>%temp%\ok.vbs 	wscript.sleep 100
    echo>>%temp%\ok.vbs 	loop
    echo>>%temp%\ok.vbs 	wscript.sleep ^(int^(Sound.currentmedia.duration^)+1^)*1000

)
if not exist "%temp%\error.vbs" (
    ::error
    echo>%temp%\error.vbs Set Sound ^= CreateObject^("WMPlayer.OCX.7"^)
    echo>>%temp%\error.vbs Sound.URL ^= "C:\Windows\media\Windows Critical Stop.wav"
    echo>>%temp%\error.vbs Sound.Controls.play
    echo>>%temp%\error.vbs do while Sound.currentmedia.duration ^= 0
    echo>>%temp%\error.vbs 	wscript.sleep 100
    echo>>%temp%\error.vbs 	loop
    echo>>%temp%\error.vbs 	wscript.sleep ^(int^(Sound.currentmedia.duration^)+1^)*1000

)
::É uma forma de guardar o programa dentro do próprio batch, não se preocupe é apenas um plugin para ajudar na aparência do script!
if not exist "%temp%\batbox.exe" (
    call :POWERSHELL "$base64Content = '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'; $bytes = [System.Convert]::FromBase64String($base64Content); [System.IO.File]::WriteAllBytes('%temp%\batbox.exe', $bytes)"
)
%temp%\batbox /h 0
mode 82,33
timeout /T 2 >NUL

if %WMPlayer% EQU 1 start /MIN %temp%\loading.vbs
echo.
call :ani 3 
echo  ┌──────────────────────────────────────────────────────────────────────────────┐
call :ani 3 
echo  │                                                                              │
call :ani 3 
echo  │     %[DARK_MAGENTA]% ▄▀▀▄ ▄▄   ▄▀▀█▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀▄ ▀▄  ▄▀▀▀█▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀█▄▄  %[RESET]%      │
call :ani 3 
echo  │     %[DARK_MAGENTA]%█  █   ▄▀ ▐ ▄▀ ▀▄ █   █    █ █  █ █ █ █    █  ▐ ▐  ▄▀   ▐ █ ▄▀   █ %[RESET]%      │
call :ani 3 
echo  │     %[DARK_MAGENTA]%▐  █▄▄▄█    █▄▄▄█ ▐  █    █  ▐  █  ▀█ ▐   █       █▄▄▄▄▄  ▐ █    █ %[RESET]%      │
call :ani 3 
echo  │     %[DARK_MAGENTA]%   █   █   ▄▀   █   █    █     █   █     █        █    █    █    █ %[RESET]%      │
call :ani 3 
echo  │     %[DARK_MAGENTA]%  ▄▀  ▄▀  █   ▄▀     ▀▄▄▄▄▀  ▄▀   █    ▄▀        ▄▀▄▄▄▄    ▄▀▄▄▄▄▀ %[RESET]%      │
call :ani 3 
echo  │     %[DARK_MAGENTA]% █   █    ▐   ▐              █    ▐   █          █    ▐   █     ▐  %[RESET]%      │
call :ani 3 
echo  │     %[DARK_MAGENTA]% ▐   ▐                       ▐        ▐          ▐        ▐        %[RESET]%      │
call :ani 3 
echo  │                                                                              │
call :ani 3 
echo  └──────────────────────────────────────────────────────────────────────────────┘
echo.
call :ani 3 
call :ESCorText 0D "                                   @"
call :ani 3 
call :ESCorText 0f " L"
call :ani 3 
call :ESCorText 0f "o"
call :ani 3
call :ESCorText 0f "a"
call :ani 3 
call :ESCorText 0f "d"
call :ani 3 
call :ESCorText 0f "i"
call :ani 3 
call :ESCorText 0f "n"
call :ani 3 
call :ESCorText 0f "g"
call :ani 3
call :ESCorText 0D " @"
call :ani 3 
echo.
echo.

:loading
set /A title_number=(%random% %%4)+1
set /A count+=%title_number%
title [👻] Haunted Mathy - [ %%%count% ]
IF %count% GEQ 100 (title [👻] Haunted Mathy - [ %%100 ] & GOTO :end)
%temp%\batbox.exe /g 0 20
echo             ◄ ~ ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ ~ ►
call :ani 15
%temp%\batbox.exe /g 0 20
echo             ◄ ~ ██████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ ~ ►
call :ani 15
set /A title_number=(%random% %%3)+1
set /A count+=%title_number%
title [👻] Haunted Mathy - [ %%%count% ]
IF %count% GEQ 100 (title [👻] Haunted Mathy - [ %%100 ] & GOTO :end)
%temp%\batbox.exe /g 0 20
echo             ◄ ~ ███████████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ ~ ►
call :ani 15
set /A title_number=(%random% %%4)+1
set /A count+=%title_number%
title [👻] Haunted Mathy - [ %%%count% ]
IF %count% GEQ 100 (title [👻] Haunted Mathy - [ %%100 ] & GOTO :end)
%temp%\batbox.exe /g 0 20
echo             ◄ ~ ████████████████████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ ~ ►
call :ani 15
set /A title_number=(%random% %%4)+1
set /A count+=%title_number%
title [👻] Haunted Mathy - [ %%%count% ]
IF %count% GEQ 100 (title [👻] Haunted Mathy - [ %%100 ] & GOTO :end)
%temp%\batbox.exe /g 0 20
echo             ◄ ~ ██████████████████████████████████████████▒▒▒▒▒▒▒ ~ ►
call :ani 15
set /A title_number=(%random% %%4)+1
set /A count+=%title_number%
title [👻] Haunted Mathy - [ %%%count% ]
IF %count% GEQ 100 (title [👻] Haunted Mathy - [ %%100 ] & GOTO :end)
%temp%\batbox.exe /g 0 20
echo             ◄ ~ █████████████████████████████████████████████████ ~ ►
call :ani 15
set /A title_number=(%random% %%6)+1
set /A count+=%title_number%
title [👻] Haunted Mathy - [ %%%count% ]
IF %count% GEQ 100 (title [👻] Haunted Mathy - [ %%100 ] & GOTO :end)
%temp%\batbox.exe /g 0 20
echo             ◄ ~ ▒▒▒▒▒▒▒██████████████████████████████████████████ ~ ►
call :ani 15
set /A title_number=(%random% %%4)+1
set /A count+=%title_number%
title [👻] Haunted Mathy - [ %%%count% ]
IF %count% GEQ 100 (title [👻] Haunted Mathy - [ %%100 ] & GOTO :end)
%temp%\batbox.exe /g 0 20
echo             ◄ ~ ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒████████████████████████████████ ~ ►
call :ani 15
set /A title_number=(%random% %%2)+1
set /A count+=%title_number%
title [👻] Haunted Mathy - [ %%%count% ]
IF %count% GEQ 100 (title [👻] Haunted Mathy - [ %%100 ] & GOTO :end)
%temp%\batbox.exe /g 0 20
echo             ◄ ~ ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███████████████████████ ~ ►
call :ani 15
set /A title_number=(%random% %%3)+1
set /A count+=%title_number%
title [👻] Haunted Mathy - [ %%%count% ]
IF %count% GEQ 100 (title [👻] Haunted Mathy - [ %%100 ] & GOTO :end)
%temp%\batbox.exe /g 0 20
echo             ◄ ~ ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██████████████ ~ ►
call :ani 15
%temp%\batbox.exe /g 0 20
echo             ◄ ~ ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ ~ ►
call :ani 15
IF %count% GEQ 100 ( title [👻] Haunted Mathy - [ %%100 ] & GOTO :end ) ELSE ( GOTO :loading )

:end
if %WMPlayer% EQU 1 start /MIN %temp%\opening.vbs
call :POWERSHELL "$Host.UI.RawUI.WindowTitle = '[👻] Haunted Mathy - ©Copyright Grupo aMathyzin 2024'"
set /A count=0

:home
cls
mode 115,33
echo.
echo  ┌──────────────────────────────────────────────────────────────────────────────┐
echo  │                                                                              │
echo  │     %[DARK_MAGENTA]% ▄▀▀▄ ▄▄   ▄▀▀█▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀▄ ▀▄  ▄▀▀▀█▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀█▄▄  %[RESET]%      │
echo  │     %[DARK_MAGENTA]%█  █   ▄▀ ▐ ▄▀ ▀▄ █   █    █ █  █ █ █ █    █  ▐ ▐  ▄▀   ▐ █ ▄▀   █ %[RESET]%      │             ┌────────────────┐
echo  │     %[DARK_MAGENTA]%▐  █▄▄▄█    █▄▄▄█ ▐  █    █  ▐  █  ▀█ ▐   █       █▄▄▄▄▄  ▐ █    █ %[RESET]%      │             │ W = Cima       │
echo  │     %[DARK_MAGENTA]%   █   █   ▄▀   █   █    █     █   █     █        █    █    █    █ %[RESET]%      │             │ S = Baixo      │
echo  │     %[DARK_MAGENTA]%  ▄▀  ▄▀  █   ▄▀     ▀▄▄▄▄▀  ▄▀   █    ▄▀        ▄▀▄▄▄▄    ▄▀▄▄▄▄▀ %[RESET]%      │             └────────────────┘
echo  │     %[DARK_MAGENTA]% █   █    ▐   ▐              █    ▐   █          █    ▐   █     ▐  %[RESET]%      │
echo  │     %[DARK_MAGENTA]% ▐   ▐                       ▐        ▐          ▐        ▐        %[RESET]%      │
echo  │                                                                              │
echo  └──────────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌────────────────────────────────┐     %[BRIGHT_MAGENTA]%▲%[RESET]% Seja bem-vindo %[BRIGHT_MAGENTA]%%USERNAME%%[RESET]%, espero que aproveite.
echo  │            → %[BRIGHT_MAGENTA]%Home%[RESET]%              │  ┌──────────────────────────────────────────────────┐ 
echo  │                                │  │ %[BRIGHT_RED]%▼ AVISO^^!%[RESET]%                                         │ 
echo  │             Tweaks             │  │                                                  │ 
echo  │                                │  │ %[BRIGHT_RED]%●%[RESET]% É recomendado criar um ponto de restauração.   │ 
echo  │      Ponto de restauração      │  │                                                  │ 
echo  │                                │  │ %[BRIGHT_RED]%●%[RESET]% Entenda oque cada opção faz antes de aplicar.  │ 
echo  │            Créditos            │  │                                                  │ 
echo  └────────────────────────────────┘  └──────────────────────────────────────────────────┘
call :ani 5
choice /c:WS /n /m " " >nul 2>&1
set keyboard=%errorlevel%
if "%keyboard%" EQU "1" goto :credit
if "%keyboard%" EQU "2" goto :tweaks
goto :home

:tweaks
cls
mode 115,33
echo.
echo  ┌──────────────────────────────────────────────────────────────────────────────┐
echo  │                                                                              │
echo  │     %[DARK_MAGENTA]% ▄▀▀▄ ▄▄   ▄▀▀█▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀▄ ▀▄  ▄▀▀▀█▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀█▄▄  %[RESET]%      │
echo  │     %[DARK_MAGENTA]%█  █   ▄▀ ▐ ▄▀ ▀▄ █   █    █ █  █ █ █ █    █  ▐ ▐  ▄▀   ▐ █ ▄▀   █ %[RESET]%      │             ┌────────────────┐
echo  │     %[DARK_MAGENTA]%▐  █▄▄▄█    █▄▄▄█ ▐  █    █  ▐  █  ▀█ ▐   █       █▄▄▄▄▄  ▐ █    █ %[RESET]%      │             │ W = Cima       │
echo  │     %[DARK_MAGENTA]%   █   █   ▄▀   █   █    █     █   █     █        █    █    █    █ %[RESET]%      │             │ S = Baixo      │
echo  │     %[DARK_MAGENTA]%  ▄▀  ▄▀  █   ▄▀     ▀▄▄▄▄▀  ▄▀   █    ▄▀        ▄▀▄▄▄▄    ▄▀▄▄▄▄▀ %[RESET]%      │             │ X = Aplicar    │
echo  │     %[DARK_MAGENTA]% █   █    ▐   ▐              █    ▐   █          █    ▐   █     ▐  %[RESET]%      │             └────────────────┘
echo  │     %[DARK_MAGENTA]% ▐   ▐                       ▐        ▐          ▐        ▐        %[RESET]%      │
echo  │                                                                              │
echo  └──────────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌────────────────────────────────┐  ┌──────────────────────────────────────────────────┐
if "%t_mouse_teclado%" EQU "1" (
    echo  │              Home              │  │       [%[BRIGHT_MAGENTA]%0%[RESET]%]  %[BRIGHT_GREEN]%●%[RESET]% Otimizar mouse/teclado              │
    ) else (
    echo  │              Home              │  │       [%[BRIGHT_MAGENTA]%0%[RESET]%]  %[BRIGHT_BLACK]%●%[RESET]% Otimizar mouse/teclado              │
    )
echo  │                                │  │                                                  │
if "%t_conexao%" EQU "1" (
    echo  │           → %[BRIGHT_MAGENTA]%Tweaks%[RESET]%             │  │       [%[BRIGHT_MAGENTA]%1%[RESET]%]  %[BRIGHT_GREEN]%●%[RESET]% Otimizar Conexão                    │
    ) else (
    echo  │           → %[BRIGHT_MAGENTA]%Tweaks%[RESET]%             │  │       [%[BRIGHT_MAGENTA]%1%[RESET]%]  %[BRIGHT_BLACK]%●%[RESET]% Otimizar Conexão                    │
    )
echo  │                                │  │                                                  │
if "%t_ram%" EQU "1" (
    echo  │      Ponto de restauração      │  │       [%[BRIGHT_MAGENTA]%2%[RESET]%]  %[BRIGHT_GREEN]%●%[RESET]% Otimizar memória RAM                │
    ) else (
    echo  │      Ponto de restauração      │  │       [%[BRIGHT_MAGENTA]%2%[RESET]%]  %[BRIGHT_BLACK]%●%[RESET]% Otimizar memória RAM                │
    )
echo  │                                │  │                                                  │
if "%t_latencia_fps%" EQU "1" (
    echo  │            Créditos            │  │       [%[BRIGHT_MAGENTA]%3%[RESET]%]  %[BRIGHT_GREEN]%●%[RESET]% Melhorar latência/FPS               │
    ) else (
    echo  │            Créditos            │  │       [%[BRIGHT_MAGENTA]%3%[RESET]%]  %[BRIGHT_BLACK]%●%[RESET]% Melhorar latência/FPS               │
    )
echo  └────────────────────────────────┘  └──────────────────────────────────────────────────┘
call :ani 5
choice /c:WS0123X /n /m " " >nul 2>&1
set keyboard=%errorlevel%
if "%keyboard%" EQU "1" goto :home
if "%keyboard%" EQU "2" goto :restore_point
if "%keyboard%" EQU "3" (
    if "%t_mouse_teclado%" EQU "1" (
        set "t_mouse_teclado=0"
    ) else (
        set "t_mouse_teclado=1"
    )
) else if "%keyboard%" EQU "4" (
    if "%t_conexao%" EQU "1" (
        set "t_conexao=0"
    ) else (
        set "t_conexao=1"
    )
) else if "%keyboard%" EQU "5" (
    if "%t_ram%" EQU "1" (
        set "t_ram=0"
    ) else (
        set "t_ram=1"
    )
) else if "%keyboard%" EQU "6" (
    if "%t_latencia_fps%" EQU "1" (
        set "t_latencia_fps=0"
    ) else (
        set "t_latencia_fps=1"
    )
)
if "%keyboard%" EQU "7" (
    if "%t_mouse_teclado%" EQU "0" (
        if "%t_conexao%" EQU "0" (
            if "%t_ram%" EQU "0" (
                if "%t_latencia_fps%" EQU "0" (
                    if %WMPlayer% EQU 1 start /MIN /I %temp%\error.vbs
                    goto :tweaks
                )
            )
        )
    )
    goto :aply
)
goto :tweaks

:restore_point
wmic /namespace:\\root\default path SystemRestore get Description | findstr /I "Haunted" >nul 2>&1 && set restore=1
cls
mode 115,33
echo.
echo  ┌──────────────────────────────────────────────────────────────────────────────┐
echo  │                                                                              │
echo  │     %[DARK_MAGENTA]% ▄▀▀▄ ▄▄   ▄▀▀█▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀▄ ▀▄  ▄▀▀▀█▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀█▄▄  %[RESET]%      │
echo  │     %[DARK_MAGENTA]%█  █   ▄▀ ▐ ▄▀ ▀▄ █   █    █ █  █ █ █ █    █  ▐ ▐  ▄▀   ▐ █ ▄▀   █ %[RESET]%      │             ┌────────────────┐
echo  │     %[DARK_MAGENTA]%▐  █▄▄▄█    █▄▄▄█ ▐  █    █  ▐  █  ▀█ ▐   █       █▄▄▄▄▄  ▐ █    █ %[RESET]%      │             │ W = Cima       │
echo  │     %[DARK_MAGENTA]%   █   █   ▄▀   █   █    █     █   █     █        █    █    █    █ %[RESET]%      │             │ S = Baixo      │
echo  │     %[DARK_MAGENTA]%  ▄▀  ▄▀  █   ▄▀     ▀▄▄▄▄▀  ▄▀   █    ▄▀        ▄▀▄▄▄▄    ▄▀▄▄▄▄▀ %[RESET]%      │             └────────────────┘
echo  │     %[DARK_MAGENTA]% █   █    ▐   ▐              █    ▐   █          █    ▐   █     ▐  %[RESET]%      │
echo  │     %[DARK_MAGENTA]% ▐   ▐                       ▐        ▐          ▐        ▐        %[RESET]%      │
echo  │                                                                              │
echo  └──────────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌────────────────────────────────┐
echo  │              Home              │ 
echo  │                                │  ┌──────────────────────────────────────────────────┐ 
echo  │             Tweaks             │  │                                                  │
if %restore% EQU 1 (
    echo  │                                │  │       [%[BRIGHT_MAGENTA]%0%[RESET]%]  %[BRIGHT_GREEN]%●%[RESET]% Criar ponto de restauração          │
) else (
    echo  │                                │  │       [%[BRIGHT_MAGENTA]%0%[RESET]%]  %[BRIGHT_BLACK]%●%[RESET]% Criar ponto de restauração          │
)
echo  │    → %[BRIGHT_MAGENTA]%Ponto de restauração%[RESET]%      │  │                                                  │
echo  │                                │  └──────────────────────────────────────────────────┘
echo  │            Créditos            │ 
echo  └────────────────────────────────┘
call :ani 5
choice /c:WS0 /n /m " " >nul 2>&1
set keyboard=%errorlevel%
if "%keyboard%" EQU "1" goto :tweaks
if "%keyboard%" EQU "2" goto :credit
if "%keyboard%" EQU "3" (
    if "%restore%" EQU "1" (
        goto :ask_restore
    ) else (
        goto :create_restore_point
    )
)
goto :restore_point

:ask_restore
if %WMPlayer% EQU 1 start /MIN %temp%\error.vbs
        cls
        mode 115,33
        echo.
        echo.
        echo                  ┌──────────────────────────────────────────────────────────────────────────────┐
        echo                  │                                                                              │
        echo                  │     %[DARK_MAGENTA]% ▄▀▀▄ ▄▄   ▄▀▀█▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀▄ ▀▄  ▄▀▀▀█▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀█▄▄  %[RESET]%      │
        echo                  │     %[DARK_MAGENTA]%█  █   ▄▀ ▐ ▄▀ ▀▄ █   █    █ █  █ █ █ █    █  ▐ ▐  ▄▀   ▐ █ ▄▀   █ %[RESET]%      │   
        echo                  │     %[DARK_MAGENTA]%▐  █▄▄▄█    █▄▄▄█ ▐  █    █  ▐  █  ▀█ ▐   █       █▄▄▄▄▄  ▐ █    █ %[RESET]%      │   
        echo                  │     %[DARK_MAGENTA]%   █   █   ▄▀   █   █    █     █   █     █        █    █    █    █ %[RESET]%      │   
        echo                  │     %[DARK_MAGENTA]%  ▄▀  ▄▀  █   ▄▀     ▀▄▄▄▄▀  ▄▀   █    ▄▀        ▄▀▄▄▄▄    ▄▀▄▄▄▄▀ %[RESET]%      │   
        echo                  │     %[DARK_MAGENTA]% █   █    ▐   ▐              █    ▐   █          █    ▐   █     ▐  %[RESET]%      │   
        echo                  │     %[DARK_MAGENTA]% ▐   ▐                       ▐        ▐          ▐        ▐        %[RESET]%      │
        echo                  │                                                                              │
        echo                  └──────────────────────────────────────────────────────────────────────────────┘
        echo.
        echo                        %[BRIGHT_RED]%Você já tem um ponto de restauração criado, deseja criar novamente?%[RESET]%
        echo.
        echo                                                1 - %[BRIGHT_GREEN]%Sim%[RESET]% ^| 2 - %[BRIGHT_RED]%Não%[RESET]%
        call :ani 5
        choice /c:12 /n /m " " >nul 2>&1
        set keyboard=%errorlevel%
        if "%keyboard%" EQU "1" goto :create_restore_point
        if "%keyboard%" EQU "2" goto :restore_point

:credit
cls
mode 115,33
echo.
echo  ┌──────────────────────────────────────────────────────────────────────────────┐
echo  │                                                                              │
echo  │     %[DARK_MAGENTA]% ▄▀▀▄ ▄▄   ▄▀▀█▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀▄ ▀▄  ▄▀▀▀█▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀█▄▄  %[RESET]%      │
echo  │     %[DARK_MAGENTA]%█  █   ▄▀ ▐ ▄▀ ▀▄ █   █    █ █  █ █ █ █    █  ▐ ▐  ▄▀   ▐ █ ▄▀   █ %[RESET]%      │             ┌────────────────┐
echo  │     %[DARK_MAGENTA]%▐  █▄▄▄█    █▄▄▄█ ▐  █    █  ▐  █  ▀█ ▐   █       █▄▄▄▄▄  ▐ █    █ %[RESET]%      │             │ W = Cima       │
echo  │     %[DARK_MAGENTA]%   █   █   ▄▀   █   █    █     █   █     █        █    █    █    █ %[RESET]%      │             │ S = Baixo      │
echo  │     %[DARK_MAGENTA]%  ▄▀  ▄▀  █   ▄▀     ▀▄▄▄▄▀  ▄▀   █    ▄▀        ▄▀▄▄▄▄    ▄▀▄▄▄▄▀ %[RESET]%      │             └────────────────┘
echo  │     %[DARK_MAGENTA]% █   █    ▐   ▐              █    ▐   █          █    ▐   █     ▐  %[RESET]%      │ 
echo  │     %[DARK_MAGENTA]% ▐   ▐                       ▐        ▐          ▐        ▐        %[RESET]%      │
echo  │                                                                              │
echo  └──────────────────────────────────────────────────────────────────────────────┘
echo.
echo  ┌────────────────────────────────┐
echo  │              Home              │ 
echo  │                                │  ┌───────────────────────────────────────────────────┐ 
echo  │             Tweaks             │  │                                                   │
echo  │                                │  │   Criado por @%[DARK_MAGENTA]%based_miguelin%[RESET]% no Grupo %[DARK_RED]%aMathyzin%[RESET]%   │
echo  │      Ponto de restauração      │  │                                                   │
echo  │                                │  └───────────────────────────────────────────────────┘
echo  │          → %[BRIGHT_MAGENTA]%Créditos%[RESET]%            │ 
echo  └────────────────────────────────┘
call :ani 5
choice /c:WS /n /m " " >nul 2>&1
set keyboard=%errorlevel%
if "%keyboard%" EQU "1" goto :restore_point
if "%keyboard%" EQU "2" goto :home

:aply
if %WMPlayer% EQU 1 start /MIN %temp%\ok.vbs
cls
mode 115,33
echo.
echo                  ┌──────────────────────────────────────────────────────────────────────────────┐
echo                  │                                                                              │
echo                  │     %[DARK_MAGENTA]% ▄▀▀▄ ▄▄   ▄▀▀█▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀▄ ▀▄  ▄▀▀▀█▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀█▄▄  %[RESET]%      │
echo                  │     %[DARK_MAGENTA]%█  █   ▄▀ ▐ ▄▀ ▀▄ █   █    █ █  █ █ █ █    █  ▐ ▐  ▄▀   ▐ █ ▄▀   █ %[RESET]%      │   
echo                  │     %[DARK_MAGENTA]%▐  █▄▄▄█    █▄▄▄█ ▐  █    █  ▐  █  ▀█ ▐   █       █▄▄▄▄▄  ▐ █    █ %[RESET]%      │   
echo                  │     %[DARK_MAGENTA]%   █   █   ▄▀   █   █    █     █   █     █        █    █    █    █ %[RESET]%      │   
echo                  │     %[DARK_MAGENTA]%  ▄▀  ▄▀  █   ▄▀     ▀▄▄▄▄▀  ▄▀   █    ▄▀        ▄▀▄▄▄▄    ▄▀▄▄▄▄▀ %[RESET]%      │   
echo                  │     %[DARK_MAGENTA]% █   █    ▐   ▐              █    ▐   █          █    ▐   █     ▐  %[RESET]%      │   
echo                  │     %[DARK_MAGENTA]% ▐   ▐                       ▐        ▐          ▐        ▐        %[RESET]%      │
echo                  │                                                                              │
echo                  └──────────────────────────────────────────────────────────────────────────────┘
echo.
call :ani 3 
call :ESCorText 0D "                                         @"
call :ani 3 
call :ESCorText 0f " Aplicando Tweaker, aguarde"
call :ani 3
call :ESCorText 0D " @"
call :ani 3 
timeout /T 1 >NUL
echo.
echo.
call :ani 3 
if "%t_mouse_teclado%" EQU "1" call :t_mouse_teclado && echo                                               %[BRIGHT_MAGENTA]%@%[RESET]% Mouse / Teclado %[BRIGHT_MAGENTA]%@%[RESET]%
echo.
call :ani 3 
if "%t_conexao%" EQU "1" call :t_conexao && echo                                                   %[BRIGHT_MAGENTA]%@%[RESET]% Conexão %[BRIGHT_MAGENTA]%@%[RESET]%
echo.
call :ani 3 
if "%t_ram%" EQU "1" call :t_ram && echo                                                     %[BRIGHT_MAGENTA]%@%[RESET]% RAM %[BRIGHT_MAGENTA]%@%[RESET]%
echo.
call :ani 3 
if "%t_latencia_fps%" EQU "1" call :t_latencia_fps && echo                                                 %[BRIGHT_MAGENTA]%@%[RESET]% Latência/FPS %[BRIGHT_MAGENTA]%@%[RESET]%
echo.
echo.
echo.
set /A R=235
set /A G=50
set /A B=255

set "art[1]=┏┓"
set "art[2]=┃┃┏┓┏┓┏┓╋┏┓"
set "art[3]=┣┛┛ ┗┛┛┗┗┗┛"

for /L %%i in (1,1,3) do (
    set cor=!ESC![38;2;!R!;!G!;!B!m
    echo                                                   !cor!!art[%%i]!
    set /A R=!R! / 2 + 8,5
    set /A G=!G! / 2 + 11
    set /A B=!B! / 2 + 16
)
echo ![RESET]!
timeout /T 5 >NUL
goto :tweaks

:create_restore_point
if %WMPlayer% EQU 1 start /MIN %temp%\ok.vbs
cls
mode 115,33
echo.
echo                  ┌──────────────────────────────────────────────────────────────────────────────┐
echo                  │                                                                              │
echo                  │     %[DARK_MAGENTA]% ▄▀▀▄ ▄▄   ▄▀▀█▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀▄ ▀▄  ▄▀▀▀█▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀█▄▄  %[RESET]%      │
echo                  │     %[DARK_MAGENTA]%█  █   ▄▀ ▐ ▄▀ ▀▄ █   █    █ █  █ █ █ █    █  ▐ ▐  ▄▀   ▐ █ ▄▀   █ %[RESET]%      │   
echo                  │     %[DARK_MAGENTA]%▐  █▄▄▄█    █▄▄▄█ ▐  █    █  ▐  █  ▀█ ▐   █       █▄▄▄▄▄  ▐ █    █ %[RESET]%      │   
echo                  │     %[DARK_MAGENTA]%   █   █   ▄▀   █   █    █     █   █     █        █    █    █    █ %[RESET]%      │   
echo                  │     %[DARK_MAGENTA]%  ▄▀  ▄▀  █   ▄▀     ▀▄▄▄▄▀  ▄▀   █    ▄▀        ▄▀▄▄▄▄    ▄▀▄▄▄▄▀ %[RESET]%      │   
echo                  │     %[DARK_MAGENTA]% █   █    ▐   ▐              █    ▐   █          █    ▐   █     ▐  %[RESET]%      │   
echo                  │     %[DARK_MAGENTA]% ▐   ▐                       ▐        ▐          ▐        ▐        %[RESET]%      │
echo                  │                                                                              │
echo                  └──────────────────────────────────────────────────────────────────────────────┘
echo.
call :ani 3 
call :ESCorText 0D "                                            @"
call :ani 3 
call :ESCorText 0f " Criando... aguarde"
call :ani 3
call :ESCorText 0D " @"
call :ani 3 
call :POWERSHELL "Enable-ComputerRestore -Drive '%systemdrive%'"
call :POWERSHELL "Checkpoint-Computer -Description 'Haunted - %date% - %time%' -RestorePointType 'MODIFY_SETTINGS'"
call :POWERSHELL "$Host.UI.RawUI.WindowTitle = '[👻] Haunted Mathy - ©Copyright Grupo aMathyzin 2024'"
goto :restore_point

:POWERSHELL
chcp 437 >nul 2>&1 & powershell -nop -noni -exec bypass -c %* >nul 2>&1 & chcp 65001 >nul 2>&1
exit /b

:t_mouse_teclado
(
reg add "HKU\.DEFAULT\Control Panel\Accessibility\HighContrast" /v "Flags" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Accessibility\SoundSentry" /v "Flags" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Accessibility\TimeOut" /v "Flags" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "0" /f

reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "0" /f 
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v "MaximumSpeed" /t REG_SZ /d "80" /f 
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v "TimeToMaximumSpeed" /t REG_SZ /d "3000" /f 

reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatDelay" /t REG_SZ /d "200" /f 
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatRate" /t REG_SZ /d "33" /f 
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "BounceTime" /t REG_SZ /d "0" /f 
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "DelayBeforeAcceptance" /t REG_SZ /d "0" /f 
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "0" /f 
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last BounceKey Setting" /t REG_DWORD /d "0" /f 
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Delay" /t REG_DWORD /d "0" /f 
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Repeat" /t REG_DWORD /d "0" /f 
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Last Valid Wait" /t REG_DWORD /d "1000" /f 

reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f

reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f

reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t REG_BINARY /d "0000000000000000000038000000000000007000000000000000A800000000000000E00000000000" /f
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t REG_BINARY /d "00000000000000000000000000000000000000000000000000000000000000000000000000000000" /f

reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f


reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DebugPollInterval" /t REG_DWORD /d "1000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f

reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "AttractionRectInsetInDIPS" /t REG_DWORD /d "5" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "DistanceThresholdInDIPS" /t REG_DWORD /d "40" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismDelayInMilliseconds" /t REG_DWORD /d "50" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismUpdateIntervalInMilliseconds" /t REG_DWORD /d "16" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "VelocityInDIPSPerSecond" /t REG_DWORD /d "360" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "CursorUpdateInterval" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "IRRemoteNavigationDelta" /t REG_DWORD /d "1" /f
) >nul 2>&1
goto :EOF

:t_conexao
for /f %%a in ('wmic path Win32_NetworkAdapter get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
	for /f "tokens=3" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\%%a" /v "Driver"') do (
        set "netKey=HKLM\SYSTEM\CurrentControlSet\Control\Class\%%b"
    )
) >nul 2>&1

for /f %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces" /s /f "NetbiosOptions"^| findstr "HKEY"') do (
	reg add "%%i" /v "NetbiosOptions" /t REG_DWORD /d "2" /f
) >nul 2>&1

for %%a in (
    "NicAutoPowerSaver"
    "AdvancedEEE"
    "AlternateSemaphoreDelay"
    "ApCompatMode"
    "ARPOffloadEnable"
    "AutoDisableGigabit"
    "AutoPowerSaveModeEnabled"
    "bAdvancedLPs"
    "bLeisurePs"
    "bLowPowerEnable"
    "DeviceSleepOnDisconnect"
    "DMACoalescing"
    "EEE"
    "EEELinkAdvertisement"
    "EeePhyEnable"
    "Enable9KJFTpt"
    "EnableConnectedPowerGating"
    "EnableDynamicPowerGating"
    "EnableEDT"
    "EnableGreenEthernet"
    "EnableModernStandby"
    "EnablePME"
    "EnablePowerManagement"
    "EnableSavePowerNow"
    "EnableWakeOnLan"
    "FlowControl"
    "FlowControlCap"
    "GigaLite"
    "GPPSW"
    "GTKOffloadEnable"
    "InactivePs"
    "LargeSendOffload"
    "LargeSendOffloadJumboCombo"
    "LogLevelWarn"
    "LsoV1IPv4"
    "LsoV2IPv4"
    "LsoV2IPv6"
    "MasterSlave"
    "ModernStandbyWoLMagicPacket"
    "MPC"
    "NicAutoPowerSaver"
    "Node"
    "NSOffloadEnable"
    "PacketCoalescing"
    "PMWiFiRekeyOffload"
    "PowerDownPll"
    "PowerSaveMode"
    "PowerSavingMode"
    "PriorityVLANTag"
    "ReduceSpeedOnPowerDown"
    "S5WakeOnLan"
    "SavePowerNowEnabled"
    "SelectiveSuspend"
    "SipsEnabled"
    "uAPSDSupport"
    "ULPMode"
    "WaitAutoNegComplete"
    "WakeOnDisconnect"
    "WakeOnLink"
    "WakeOnMagicPacket"
    "WakeOnPattern"
    "WakeOnSlot"
    "WakeUpModeCap"
    "WoWLANLPSLevel"
    "WoWLANS5Support"
    "TxIntDelay"
    "TxAbsIntDelay"
    "RxIntDelay"
    "RxAbsIntDelay"
    "FatChannelIntolerant"
    "InterruptModeration"
) do (

    for /f %%b in ('reg query "%netKey%" /v "%%~a" 2^>nul ^| findstr "HKEY" 2^>nul') do (
        reg add "%netKey%" /v "%%~a" /t REG_SZ /d "0" /f > nul
    )

    for /f %%b in ('reg query "%netKey%" /v "*%%~a" 2^>nul ^| findstr "HKEY" 2^>nul') do (
        reg add "%netKey%" /v "*%%~a" /t REG_SZ /d "0" /f > nul
    )
) >nul 2>&1

for /f %%a in ('wmic path Win32_NetworkAdapter get GUID ^| findstr "{"') do (
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%a" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%a" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%a" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%a" /v "TcpInitialRTT" /t reg_DWORD /d "300" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%a" /v "UseZeroBroadcast" /t reg_DWORD /d "0" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%a" /v "NonBestEffortLimit" /t reg_DWORD /d "10" /f 
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%a" /v "PerformRouterDiscovery" /t reg_DWORD /d "1" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%a" /v "DeadGWDetectDefault" /t reg_DWORD /d "1" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%a" /v "CurrentHopLimit" /t REG_DWORD /d "0" /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%a" /v "TcpInitialCongestionWindow" /t REG_DWORD /d "10" /f

) >nul 2>&1

(
reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t reg_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters\OCMsetup" /f
reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters\Security" /v "SecureDSCommunication" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters\setup" /f
reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Setup" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "Application DSCP Marking Request" /t REG_SZ /d "Allowed" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "Do not use NLA" /t REG_SZ /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "Tcp Autotuning Level" /t REG_SZ /d "Disabled" /f
) >nul 2>&1

call :POWERSHELL "Set-NetTCPSetting -SettingName '*' -MemoryPressureProtection Disabled"
goto :EOF

:t_ram
(
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "04000000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t Reg_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePageCombining" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "HeapDeCommitFreeBlockThreshold" /t REG_DWORD /d "262144" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
) >nul 2>&1
call :POWERSHELL "Get-ChildItem 'HKLM:\SYSTEM\CurrentControlSet\Services' | ? { $_.Name -notmatch 'Xbl|Xbox' } | % { $a = Get-ItemProperty -Path 'Registry::$_' -EA SilentlyContinue; if ($null -ne $a.Start) { Set-ItemProperty -Path 'Registry::$_' -Name 'SvcHostSplitDisable' -Type DWORD -Value 1 -Force -EA SilentlyContinue } }"
call :POWERSHELL "Disable-MMAgent -PageCombining -mc"
goto :EOF

:t_latencia_fps
for /f "tokens=2 delims==" %%I in ('wmic cpu get L2CacheSize /value ^| find "L2CacheSize"') do set L2CacheSize=%%I
for /f "tokens=2 delims==" %%I in ('wmic cpu get L3CacheSize /value ^| find "L3CacheSize"') do set L3CacheSize=%%I
for /f "tokens=2 delims==" %%b in ('wmic logicaldisk where "DeviceID='%systemDrive%'" get drivetype /value') do set "driveType=%%b"
(
bcdedit /deletevalue useplatformclock
bcdedit /set useplatformclock No
bcdedit /set tscsyncpolicy legacy
bcdedit /set bootmenupolicy Legacy
bcdedit /set quietboot Yes
bcdedit /set nx AlwaysOff
bcdedit /set forcefipscrypto No

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "%L2CacheSize%" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ThirdLevelDataCache" /t REG_DWORD /d "%L3CacheSize%" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SwapfileControl" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d "96" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableWpbtExecution" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "AlpcWakePolicy" /t REG_DWORD /d "1" /f

reg add "HKU\!USER_SID!\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
reg add "HKU\!USER_SID!\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "2000" /f
reg add "HKU\!USER_SID!\Control Panel\Desktop" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f
reg add "HKU\!USER_SID!\Control Panel\Desktop" /v "WaitToKillAppTimeOut" /t REG_SZ /d "2000" /f
reg add "HKU\!USER_SID!\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceIdleResiliency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceVSyncEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MfBufferingThreshold" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\FTH" /v "Enabled" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingCombining" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DWMWA_TRANSITIONS_FORCEDISABLED" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DisallowAnimations" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DisallowComposition" /t REG_DWORD /d "1" /f

if %driveType% NEQ 3 (
sc start SysMain
sc config SysMain start=auto
) else (
sc stop SysMain
sc config SysMain start=disabled
)
) >nul 2>&1
call :POWERSHELL "Disable-MMAgent -PageCombining -mc"
goto :EOF

:ani
(
for /l %%i in (1,1,%1) do ping 127.0.0.1 -4 -n 1
) >nul 2>&1
exit /b

:ESCorText
@echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
exit /b