@echo off
setlocal enabledelayedexpansion

REM ==================================================
REM  AI‑Toolkit — Quick UI Launcher
REM  Double‑click to start / Ctrl+C to stop
REM ==================================================

REM  Assumptions:
REM   • This file sits **inside the ai-toolkit root folder**
REM     (next to the "ui" directory and "venv" folder).
REM   • You have already run the full installer once.
REM --------------------------------------------------

:: Activate Python virtual environment
if not exist "venv\Scripts\activate.bat" (
    echo [ERROR] venv not found. Run the installer first.
    pause
    exit /b 1
)
call "venv\Scripts\activate.bat"

:: Optional: free any orphaned Node servers (heavy‑handed but safe)
taskkill /F /IM node.exe >nul 2>&1

:: Change into the UI directory
cd ui

:: Launch the UI
echo Starting AI‑Toolkit UI...  (Press Ctrl+C to stop)
npm run build_and_start

endlocal
