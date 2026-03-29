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

For Databricks Runtime 16..3 see the branch [DBKS_RUNTIME_16_4]https://github.com/alexandru-htc/sparkling/tree/DBKS_RUNTIME_16_4

[Install Python](https://www.python.org/downloads/latest/python3.12/) if not already installed

pip shall now be installed togheter with python.  
[Install pipx](https://pipx.pypa.io/stable/installation/). Is needed for poetry  
[Install pyenv](https://github.com/pyenv/pyenv) Will be used if we want more than one python version locally available. Be aware, you will have to change your ~/.bashrc

[Install poetry](https://python-poetry.org/docs/#installation), needed for project install

[install SDKMAN](https://sdkman.io/), zip and unzip are prerequisites!
```
curl -s "https://get.sdkman.io" | bash
# install java:
sdk install java 17.0.18-zulu
# set home:
sdk default java 17.0.18-zulu
# kill terminal / restart
java --version
openjdk 17.0.18 2026-01-20 LTS
OpenJDK Runtime Environment Zulu17.64+15-CA (build 17.0.18+8-LTS)
```
Clone the project
```
git clone https://github.com/alexandru-htc/sparkling.git
```
go to branch DBKS_17_3_TY_RUFF usimg vscode IDE or `git switch DBKS_17_3_TY_RUFF`

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
```





