@echo off
:: Activate Python virtual environment
if not exist "venv\Scripts\activate.bat" (
    echo [ERROR] venv not found. Run the installer first.
    pause
    exit /b 1
)
call "venv\Scripts\activate.bat"


:: Launch TensorBoard with the 'run' directory as the log directory
tensorboard --logdir=.\run --host=localhost --port=6006