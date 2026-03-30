## What we need to run the project
(info for the windows users only!)

For Databricks Runtime 16.4 see the branch [DBKS_RUNTIME_16_4](https://github.com/alexandru-htc/sparkling/tree/DBKS_RUNTIME_16_4)
If you plan to use also Runtime 17.3, you will need another java version,  see the branch [DBKS_RUNTIME_17_3](https://github.com/alexandru-htc/sparkling/tree/DBKS_17_3_TY_RUFF)

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
# pylint Information
in this project pylint is still installed. You can run, for reference, the pre-commit hook using `pre-commit run --hook-stage manual` or manualy using `pylint .`




