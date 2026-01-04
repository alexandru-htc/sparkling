@echo off
echo   Checking JAVA_HOME environment variable...
echo.

:: Check if JAVA_HOME is already set
if defined JAVA_HOME (
    echo JAVA_HOME is already set to: %JAVA_HOME%
    set JAVA_HOME_SET=true
) else (
    echo ERROR: JAVA_HOME environment variable is not set
    echo JAVA_HOME is required for PySpark to function properly
    echo.
    echo Please set JAVA_HOME environment variable to your Java installation directory
    echo Example: setx JAVA_HOME "C:\Program Files\Java\jdk-11.0.16" /M
    echo.
    set JAVA_HOME_SET=false
    set HAS_ERROR=true
)
echo.