@echo off
echo =====================================================
echo PySpark Prerequisites Verification Script
echo =====================================================
echo.

echo   Testing Python installation...
python --version >nul 2>&1
if %errorLevel% equ 0 (
    for /f "tokens=2" %%i in ('python --version 2^>^&1') do set PYTHON_VER=%%i
    echo Python found: %PYTHON_VER%
) else (
    echo Python not found or not in PATH
)
echo.

echo   Testing Poetry installation...
poetry --version >nul 2>&1
if %errorLevel% equ 0 (
    echo Poetry found
) else (
    echo Poetry not found
)
echo.

echo   Testing Java installation...
java -version >nul 2>&1
if %errorLevel% equ 0 (
    echo Java found
    java -version 2>&1 | findstr /i "version"
) else (
    echo Java not found or not in PATH
)
echo.

echo   Testing Java compiler...
javac -version >nul 2>&1
if %errorLevel% equ 0 (
    echo Java compiler found
) else (
    echo Java compiler not found
)
echo.

echo   Checking environment variables...
echo JAVA_HOME: %JAVA_HOME%
if defined JAVA_HOME (
    echo JAVA_HOME is set
    if exist "%JAVA_HOME%\bin\java.exe" (
        echo JAVA_HOME points to valid Java installation
    ) else (
        echo JAVA_HOME path does not contain java.exe
    )
) else (
    echo JAVA_HOME is not set
)
echo.
echo HADOOP_HOME: %HADOOP_HOME%
if defined HADOOP_HOME (
    echo HADOOP_HOME is set
    if exist "%HADOOP_HOME%\bin\winutils.exe" (
        echo HADOOP_HOME contains winutils.exe
    ) else (
        echo HADOOP_HOME does not contain winutils.exe
    )
) else (
    echo HADOOP_HOME is not set
)
echo.

echo   Testing PySpark installation (if already installed)...
poetry run python -c "import pyspark; print('PySpark version:', pyspark.__version__)" >nul 2>&1
if %errorLevel% equ 0 (
    for /f "tokens=3" %%i in ('poetry run python -c "import pyspark; print(pyspark.__version__)" 2^>^&1') do set SPARK_VER=%%i
    echo PySpark found: %SPARK_VER%
    echo.
    echo Testing PySpark context creation...
    poetry run python -c "
import pyspark
from pyspark.sql import SparkSession
try:
    spark = SparkSession.builder.appName('Test').getOrCreate()
    print('✓ PySpark context created successfully')
    print('Spark version:', spark.version)
    spark.stop()
except Exception as e:
    print('✗ Failed to create PySpark context:', str(e))
" 2>nul
) else (
    echo PySpark not yet installed (this is expected if you haven't installed it)
    echo To install PySpark using Poetry, run: poetry add pyspark
)
echo.

echo =====================================================
echo Verification Summary
echo =====================================================
echo.
echo Status Legend:
echo = Component is properly installed and configured
echo = Component is missing or misconfigured
echo.
echo Required for PySpark:
echo - Python (✓ if found above)
echo - Java JDK (✓ if Java found above)
echo - JAVA_HOME environment variable (✓ if set above)
echo - HADOOP_HOME environment variable (✓ if set above)
echo - winutils.exe in HADOOP_HOME\bin\ (✓ if found above)
echo.
echo Optional but recommended:
echo - Poetry (✓ if found above)
echo.
echo Next steps:
echo 1. If any required components show ✗, install/configure them
echo 2. If all required components show ✓, install PySpark using Poetry:
echo    poetry add pyspark
echo 3. Test PySpark with: poetry run python -c "import pyspark; print(pyspark.__version__)"
echo.
pause