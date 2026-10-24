## What we need to run the project
 
# If you are on MacOS, *NIX
    You know what to do, don't read further :-)

# If you are on Windows
  a big fight is waiting for you :-). Remember, it is perhaps necessary to logoff/login or reboot in order that the new environment variables are active in your session. Your mileage my vary.
 
[Install wsl](https://learn.microsoft.com/en-us/windows/wsl/install) if not already installed

Install a distribution  in the wsl, start a command prompt:
```
wsl.exe --list --online
wsl.exe --install [Distro]
```
Where distro is a distro like Ubuntu

__The following commands will be started in wsl terminal !!!__ 

For Databricks Runtime 16..3 see the branch [DBKS_RUNTIME_16_4]https://github.com/alexandru-htc/sparkling/tree/DBKS_RUNTIME_16_4. There are some other Databricks versions tested, look for the branches. Basically, the difference here is the java version and the pyspark version (using here hardcoded 4.2.0)

[Install Python](https://www.python.org/downloads/latest/python3.12/) if not already installed

pip shall now be installed togheter with python.  
[Install pipx](https://pipx.pypa.io/stable/installation/). Is needed for poetry  
[Install pyenv](https://github.com/pyenv/pyenv) Will be used if we want more than one python version locally available. Be aware, you will have to change your ~/.bashrc

[Install poetry](https://python-poetry.org/docs/#installation), needed for project install

[install SDKMAN](https://sdkman.io/), zip and unzip are prerequisites!
```
curl -s "https://get.sdkman.io" | bash
# install java:
sdk install java 21.0.12.fx-zulu
# set home:
sdk default java  21.0.12.fx-zulu
# kill terminal / restart
java --version
openjdk 21.0.12 2026-07-21 LTS
OpenJDK Runtime Environment Zulu21.52+15-CA (build 21.0.12+8-LTS)
OpenJDK 64-Bit Server VM Zulu21.52+15-CA (build 21.0.12+8-LTS, mixed mode, sharing)
```
Clone the project
```
git clone https://github.com/alexandru-htc/sparkling.git
```
assuming that sparkling is the folder where the project is located (for instance where the file pyproject.toml exists), open a command prompt there.
Create the virtual environment and install the project
```
python -m venv .venv
poetry lock
poetry install
```
Needed only once, if you want the precommit hooks
```
pre-commit install
# if you want to test the precommit
pre-commit run --all-files
```
Check if the test is working
```
pytest code/test_installed.py
```
Start the vscode in wsl, if needed
```
code .
# ensure that your virtual environment is activated  
# (depending on VSCODE, it can be, that the environment  
# will be automically activated)! If not, in the terminal run 
source ./.venv/bin/activate
```
Now, the command prompt shall begin with something like 
```
((.venv)) your_username: ....
```
You can do the same test in the vscode terminal
```
pytest code/test_installed.py
pytest code/test_installed.py
=========================== test session starts ==========================
platform linux -- Python 3.12.12, pytest-8.4.2, pluggy-1.6.0
rootdir: /home/alex/code/sparkling
configfile: pyproject.toml
collected 1 item 
code/test_installed.py .                                             [100%]

=========================== 1 passed in 19.70s ===========================
```





