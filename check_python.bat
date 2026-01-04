@echo off
setlocal enabledelayedexpansion
echo   Checking Python installation...
echo.

:: Check Python installation
python --version >nul 2>&1
if %errorLevel% equ 0 (
    for /f "tokens=2" %%i in ('python --version 2^>^&1') do set PYTHON_VERSION=%%i
    echo Python found: !PYTHON_VERSION!
    set PYTHON_MISSING=false
) else (
    echo Python not found - will be installed
    set PYTHON_MISSING=true
)
echo.