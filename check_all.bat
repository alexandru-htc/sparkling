@echo off
echo =====================================================
echo PySpark Prerequisites Installation Script for Windows
echo =====================================================
echo.

set SCRIPT_HADOOP_HOME=C:\Alex\Code\Hadoop

echo Starting checks...
echo.

:: Initialize error tracking
set HAS_ERROR=false

:: Function to check if a command exists
where cmd >nul 2>nul
if %errorLevel% neq 0 (
    echo ERROR: cmd not found. This should not happen on Windows.
    exit /b 1
)

echo   Checking current installations...
echo.

:: Call individual check scripts
call check_python.bat
call check_poetry.bat
call check_java.bat
call check_java_home.bat
call check_hadoop.bat
call check_path.bat
call check_winutils.bat

echo =====================================================
echo Check summary
echo =====================================================
echo.
echo Prerequisites check completed:
if "%PYTHON_MISSING%"=="false" (echo Python is installed) else (echo Python is missing)
if "%JAVA_MISSING%"=="false" (echo Java is installed) else (echo Java is missing)
if "%POETRY_MISSING%"=="false" (echo Poetry is installed) else (echo Poetry is missing)
if "%JAVA_HOME_SET%"=="true" (echo JAVA_HOME is set) else (echo JAVA_HOME is missing)
if "%HADOOP_HOME_SET%"=="true" (echo HADOOP_HOME is set) else (echo HADOOP_HOME is missing)
if "%PATH_OK%"=="true" (echo PATH is configured) else (echo PATH is not configured)
if "%WINUTILS_MISSING%"=="false" (echo winutils.exe is available) else (echo winutils.exe is missing)
echo.
echo After resolving any missing prerequisites, follow these steps to install PySpark:
echo 1. Ensure all manual installations are completed
echo 2. Create a new virtual environment (if not already done)
echo 3. Activate the virtual environment
echo 4. Install PySpark using Poetry: poetry add pyspark
echo 5. Test installation: poetry run python -c "import pyspark; print(pyspark.__version__)"
echo.
echo Manual installations required:
if "%PYTHON_MISSING%"=="true" echo - Install Python from https://www.python.org/downloads/
if "%JAVA_MISSING%"=="true" echo - Install Java JDK from https://adoptium.net/ and restart your computer if needed
if "%POETRY_MISSING%"=="true" echo - Install Poetry from https://python-poetry.org/docs/
if "%WINUTILS_MISSING%"=="true" echo - Download winutils.exe and set up %SCRIPT_HADOOP_HOME%\bin\


if "%HAS_ERROR%"=="true" (
    echo.
    echo ERROR: Some prerequisites are missing. Please resolve the issues above and run this script again.
    echo.
    pause
    exit /b 1
)

echo All prerequisites are properly configured!
echo.
pause
