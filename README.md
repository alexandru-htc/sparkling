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

The following command will be started in wsl terminal 

[Install Python](https://www.python.org/downloads/latest/python3.12/) if not already installed

pip shall now be installed togheter with python.  
[Install pipx](https://pipx.pypa.io/stable/installation/). Is needed for poetry  
[Install pyenv](https://github.com/pyenv/pyenv) Will be used if we want more than one python version locally available. Be aware, you will have to change your ~/.bashrc

[Install poetry](https://python-poetry.org/docs/#installation), needed for project install

[install java](https://www.azul.com/downloads/?version=java-8-lts&os=ubuntu&package=jdk#zulu) The link is for the version 1.8. The project is tested with THIS version. Other versions can work or not.
```
java -version
openjdk version "1.8.0_472"
OpenJDK Runtime Environment (Zulu 8.90.0.19-CA-linux64) (build 1.8.0_472-b08)
OpenJDK 64-Bit Server VM (Zulu 8.90.0.19-CA-linux64) (build 25.472-b08, mixed mode)
```
Also, set your JAVA_HOME correctly. Mine is 
```
JAVA_HOME=/usr/lib/jvm/zulu8-ca-amd64
```
checkout the project in your folder
```
git clone https://github.com/alexandru-htc/sparkling.git
```
assuming that sparkling is the folder where the project is located (for instance where the file pyproject.toml exists), open a command promt there.
Create the virtual environment and install the project
```
python -m venv .venv
# ensure that your virtual environment is activated  
# (depending on VSCODE, it can be, that the environment  
# will be automically activated)! If not  
source ./.venv/bin/activate
```
Now, the command prompt shall begin with something like ((.venv)) your_username: ....
```
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
```




