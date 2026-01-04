@echo off
echo   Checking Hadoop directory and HADOOP_HOME...
echo.


echo Assuming HADOOP_HOME set to: %SCRIPT_HADOOP_HOME%

:: Check if HADOOP_HOME is set
if defined HADOOP_HOME (
    echo HADOOP_HOME is set to: %HADOOP_HOME%
    set HADOOP_HOME_SET=true
) else (
    echo ERROR: HADOOP_HOME environment variable is not set
    echo HADOOP_HOME is required for PySpark to work on Windows
    echo.
    echo Please set HADOOP_HOME environment variable
    echo Example: setx HADOOP_HOME "%SCRIPT_HADOOP_HOME%" /M
    echo.
    set HADOOP_HOME_SET=false
    set HAS_ERROR=true
)

:: Check if Hadoop directory exists
if not exist "%SCRIPT_HADOOP_HOME%" (
    echo ERROR: Hadoop directory %SCRIPT_HADOOP_HOME% does not exist
    echo Please create the directory manually or ensure you have proper permissions
    echo.
    echo You can create it with: mkdir "%SCRIPT_HADOOP_HOME%"
    echo.
    set HAS_ERROR=true
) else (
    echo Hadoop directory exists: %SCRIPT_HADOOP_HOME%
)

:: Check if bin directory exists
if not exist "%SCRIPT_HADOOP_HOME%\bin" (
    echo WARNING: Hadoop bin directory does not exist
) else (
    echo Hadoop bin directory exists
)

echo.