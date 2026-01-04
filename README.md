
## N O T  W O R K I N G   Y E T

# PySpark Prerequisites Installation Scripts for Windows

This directory contains scripts to install all prerequisites needed for running PySpark tests on Windows.

## Files

- `install_pyspark_prerequisites.bat` - Main batch script for prerequisite installation
- `verify_installation.bat` - Verification script to test the installation
- `set_spark_env.bat` - Environment variables setup script (generated automatically during installation)

## Prerequisites Overview

The following components are required for PySpark development and testing:

### 1. Python (3.8+)
- **Purpose**: PySpark runs on Python
- **Installation**: Download from [python.org](https://www.python.org/downloads/)
- **Requirements**: Must include pip, add to PATH

### 2. Java Development Kit (JDK 8+)
- **Purpose**: PySpark runs on JVM
- **Recommended**: OpenJDK 11 or 17 from [Adoptium](https://adoptium.net/)
- **Alternative**: Oracle JDK or Microsoft Build of OpenJDK
- **Environment Variable**: `JAVA_HOME` must be set

### 3. Poetry Package Manager
- **Purpose**: Modern Python dependency management
- **Installation**: Installed automatically by the script
- **Usage**: Replaces pip for all package management

### 4. Hadoop Windows Utilities (winutils.exe)
- **Purpose**: Required for PySpark to work on Windows
- **Source**: [GitHub - steveloughran/winutils](https://github.com/steveloughran/winutils)
- **Setup**: Download `winutils.exe` for Hadoop 3.3.1+ and place in `C:\hadoop\bin\`
- **Environment Variable**: `HADOOP_HOME=C:\hadoop`

### Generated Environment Setup Script
- **File**: `set_spark_env.bat` (created during installation)
- **Purpose**: Sets JAVA_HOME and HADOOP_HOME environment variables
- **Usage**: Run this file after installation to configure your environment
- **Note**: Must be run in each new command prompt session or added to system PATH

## Usage Instructions

### Batch Script Method

1. **Right-click** on `install_pyspark_prerequisites.bat`
2. Select **"Run as Administrator"** for best results
3. Follow the on-screen prompts
4. Complete any manual installations required
5. The script will generate `set_spark_env.bat` - run this to set environment variables
6. Use `verify_installation.bat` to test the complete setup

## Manual Installation Links

If automatic installation fails, use these direct links:

### Python
- Download: [https://www.python.org/downloads/](https://www.python.org/downloads/)
- During installation, check "Add Python to PATH"

### Java JDK
- **OpenJDK** (Recommended): [https://adoptium.net/](https://adoptium.net/)
- **Microsoft Build**: [https://docs.microsoft.com/en-us/java/](https://docs.microsoft.com/en-us/java/)
- **Oracle**: [https://www.oracle.com/java/technologies/downloads/](https://www.oracle.com/java/technologies/downloads/)

### Winutils
- Repository: [https://github.com/steveloughran/winutils](https://github.com/steveloughran/winutils)
- Download `winutils.exe` for Hadoop 3.3.1 or later

## Environment Variables Setup

After installations, check these environment variables:

```batch
set JAVA_HOME=... path to your java environment ...
set HADOOP_HOME=... path to hadoop ...
check if path contains the following paths
%JAVA_HOME%\bin;%HADOOP_HOME%\bin;%PATH%
```

## Testing the Installation

After completing all installations:

1. Open a new command prompt
2. Test Python:
   ```cmd
   python --version
   ```
3. Test Poetry:
   ```cmd
   poetry --version
   ```
4. Test Java:
   ```cmd
   java -version
   javac -version
   ```
5. Run the verification script:
   ```cmd
   verify_installation.bat
   ```
6. Test PySpark installation (after installing PySpark):
   ```cmd
   poetry add pyspark
   poetry run python -c "import pyspark; print(pyspark.__version__)"
   ```

## Poetry Usage for PySpark

### Install PySpark
```cmd
poetry add pyspark
```

### Run PySpark code
```cmd
poetry run python your_script.py
```

### Install additional testing dependencies
```cmd
poetry add --group dev pytest pandas numpy
```

### Run tests
```cmd
poetry run pytest
```

## Common Issues and Solutions

### Issue: "java command not found"
**Solution**: Install JDK and set JAVA_HOME environment variable

### Issue: "Python command not found"
**Solution**: Reinstall Python with "Add to PATH" option checked

### Issue: "Poetry command not found"
**Solution**: Restart command prompt after installation or manually install Poetry

### Issue: PySpark fails with Hadoop native libraries error
**Solution**: Install winutils.exe and set HADOOP_HOME

### Issue: Permission denied errors
**Solution**: Run scripts as Administrator

## Next Steps

After running the installation script:

1. Run the generated `set_spark_env.bat` to configure environment variables
2. Initialize Poetry project (if not already done): `poetry init`
3. Install PySpark: `poetry add pyspark`
4. Install additional testing dependencies: `poetry add --group dev pytest pandas numpy`
5. Set up your development environment
6. Run PySpark tests: `poetry run pytest`

## Support

For PySpark-specific issues, refer to:
- [PySpark Documentation](https://spark.apache.org/docs/latest/api/python/)
- [PySpark Installation Guide](https://spark.apache.org/docs/latest/api/python/getting_started/install.html)

For Poetry usage:
- [Poetry Documentation](https://python-poetry.org/docs/)
- [Poetry GitHub Repository](https://github.com/python-poetry/poetry)