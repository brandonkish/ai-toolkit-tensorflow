@echo off
setlocal enabledelayedexpansion

REM ==================================================
REM  AI-Toolkit — Secure UI Launcher (Password Prompt)
REM  Double-click to start / Ctrl+C to stop
REM ==================================================

REM  Assumptions:
REM   • This file lives inside the ai-toolkit root folder
REM     (next to the "ui" directory and "venv" folder).
REM   • You have already run the full installer once.
REM --------------------------------------------------

:: Check venv exists
if not exist "venv\Scripts\activate.bat" (
    echo [ERROR] venv not found. Run the installer first.
    pause
    exit /b 1
)

:: -------------------------------------------------
:: Ask for password
:: -------------------------------------------------
echo.
echo Enter a password to protect the AI‑Toolkit UI.
set /p UI_PWD=Password: 

if "%UI_PWD%"=="" (
    echo No password entered. Aborting.
    pause
    exit /b 1
)

set "AI_TOOLKIT_AUTH=%UI_PWD%"
echo Password set.

:: -------------------------------------------------
:: Activate Python venv
:: -------------------------------------------------
call "venv\Scripts\activate.bat"

:: Kill any stray Node servers (frees port & file locks)
taskkill /F /IM node.exe >nul 2>&1

:: Change into UI directory
cd ui

:: Launch UI with password protection
echo Starting AI‑Toolkit UI on http://localhost:3000
echo Press Ctrl+C to stop the server when you are done.
npm run build_and_start

endlocal
