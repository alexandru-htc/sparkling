@echo off
echo   Checking Poetry installation...
echo.

:: Check Poetry installation
poetry --version >nul 2>&1
if %errorLevel% equ 0 (
    echo Poetry found
    set POETRY_MISSING=false
) else (
    echo Poetry not found - will be installed
    set POETRY_MISSING=true
)
echo.