@echo off
chcp 65001 >nul
title Instalador da Tradução PT-BR - Midnight Club 3 Remix PC Recomp
cls

echo ======================================================================
echo    MIDNIGHT CLUB 3: DUB EDITION REMIX - PC RECOMP (XREVIVE)
echo          TRADUÇÃO PARA PORTUGUÊS DO BRASIL (PT-BR) v1.0
echo ======================================================================
echo.
echo Baseada na Tradução V3 para PS2 feita por [refresh]
echo Adaptada, convertida e expandida para PC Recomp por AI Agent / Modding Team
echo.

:: Detectar se o script está na raiz do jogo ou dentro da subpasta Traducao_PTBR_MC3_Recomp
set "GAME_ROOT=%~dp0"
if exist "%GAME_ROOT%xrevive.exe" goto FOUND_ROOT
if exist "%GAME_ROOT%midnightclub3.exe" goto FOUND_ROOT
if exist "%GAME_ROOT%extracted" goto FOUND_ROOT

:: Se estiver dentro da subpasta
if exist "%GAME_ROOT%..\extracted" (
    set "GAME_ROOT=%GAME_ROOT%..\"
    goto FOUND_ROOT
)

echo [AVISO] O executavel do jogo ou a pasta "extracted" nao foram encontrados automaticamente.
echo Certifique-se de que esta pasta de traducao esteja dentro da pasta principal do Midnight Club 3 Recomp.
echo.
pause
goto END

:FOUND_ROOT
echo [OK] Pasta principal do jogo detectada em:
echo      "%GAME_ROOT%"
echo.

echo ----------------------------------------------------------------------
echo 1. Instalando arquivos da traducao...
echo ----------------------------------------------------------------------

:: 1. Copiar arquivos de addons/mc3-vip (se existir a pasta de addons/mc3-vip no jogo)
if exist "%GAME_ROOT%addons\mc3-vip" (
    echo [i] Mod MC3-VIP detectado! Atualizando textos VIP e manifesto de integridade...
    if not exist "%GAME_ROOT%addons\mc3-vip\content\fonts" mkdir "%GAME_ROOT%addons\mc3-vip\content\fonts"
    copy /y "%~dp0addons\mc3-vip\content\fonts\mcstrings_x.strtbl" "%GAME_ROOT%addons\mc3-vip\content\fonts\" >nul
    copy /y "%~dp0addons\mc3-vip\vip-manifest.json" "%GAME_ROOT%addons\mc3-vip\" >nul
    echo    - Textos VIP (10.996 strings) instalados com sucesso!
) else (
    echo [!] Mod MC3-VIP nao encontrado, ignorando etapa VIP.
)

:: 2. Copiar texturas de fonte HD-HUD (se existir addons/mc3-hd-hud)
if exist "%GAME_ROOT%addons\mc3-hd-hud" (
    echo [i] Mod HD-HUD detectado! Instalando fontes HD com acentuacao corrigida (ã e õ)...
    if not exist "%GAME_ROOT%addons\mc3-hd-hud\texture_x" mkdir "%GAME_ROOT%addons\mc3-hd-hud\texture_x"
    copy /y "%~dp0addons\mc3-hd-hud\texture_x\smallspace_05.tex" "%GAME_ROOT%addons\mc3-hd-hud\texture_x\" >nul
    copy /y "%~dp0addons\mc3-hd-hud\texture_x\smallspace_05s.tex" "%GAME_ROOT%addons\mc3-hd-hud\texture_x\" >nul
    echo    - Texturas de fonte HD 512x512 instaladas com sucesso!
) else (
    echo [!] Mod HD-HUD nao encontrado, ignorando etapa HD-HUD.
)

:: 3. Copiar arquivos para extracted/fonts/ (Jogo Base / Stock / Telas de Carregamento)
echo [i] Instalando textos do jogo base e telas de carregamento em extracted\fonts\...
if not exist "%GAME_ROOT%extracted\fonts" mkdir "%GAME_ROOT%extracted\fonts"
if not exist "%GAME_ROOT%extracted\fonts\texture_x" mkdir "%GAME_ROOT%extracted\fonts\texture_x"

copy /y "%~dp0extracted\fonts\mcstrings_x.strtbl" "%GAME_ROOT%extracted\fonts\" >nul
copy /y "%~dp0extracted\fonts\mcloadstrings.strtbl" "%GAME_ROOT%extracted\fonts\" >nul
copy /y "%~dp0extracted\fonts\mcloadstrings_x.strtbl" "%GAME_ROOT%extracted\fonts\" >nul
copy /y "%~dp0extracted\fonts\texture_x\smallspace_05.tex" "%GAME_ROOT%extracted\fonts\texture_x\" >nul
copy /y "%~dp0extracted\fonts\texture_x\smallspace_05s.tex" "%GAME_ROOT%extracted\fonts\texture_x\" >nul
echo    - Textos base (9.034 strings) e carregamento (610 strings) instalados!

echo.
echo ----------------------------------------------------------------------
echo 2. Configurando loose_files=1 nas configuracoes do recomp...
echo ----------------------------------------------------------------------

set "SETTINGS_FILE=%GAME_ROOT%SaveData\Midnight Club 3_ DUB edition\recomp-settings.dat"
if exist "%SETTINGS_FILE%" (
    powershell -Command "$p = '%SETTINGS_FILE%'; if (Test-Path $p) { $c = [System.IO.File]::ReadAllText($p); if ($c -match 'loose_files=0') { $c = $c -replace 'loose_files=0','loose_files=1'; [System.IO.File]::WriteAllText($p, $c); Write-Host '   - loose_files ativado com sucesso em recomp-settings.dat!' } else { Write-Host '   - loose_files ja estava ativado ou configurado.' } }"
) else (
    echo [AVISO] recomp-settings.dat nao encontrado (o jogo pode ainda nao ter sido aberto pela primeira vez).
    echo Ao abrir o jogo ou configurar pelo menu F10, certifique-se de manter "Loose Files" ativado.
)

echo.
echo ======================================================================
echo               INSTALAÇÃO CONCLUÍDA COM SUCESSO!
echo ======================================================================
echo Agora basta iniciar o jogo pelo executavel original.
echo O jogo iniciara completamente em Portugues do Brasil (PT-BR).
echo.
pause
:END
