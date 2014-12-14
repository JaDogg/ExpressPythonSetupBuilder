REM --------------------------------
REM Launch Express Python
REM 	- Bhathiya Perera
REM --------------------------------
@ECHO OFF
SET MYPATH=%CW_EXE_PATH%
SET PYTHONAT=C:\Python34
IF EXIST %PYTHONAT% GOTO PYTHON_INSTALLED
REM Install Python34
start /wait msiexec /i %MYPATH%\python-3.4.2.msi /qr
:PYTHON_INSTALLED
REM Current Dir Should be Python path
CD %PYTHONAT%
SET PATH=%MYPATH%;%PYTHONAT%;%PYTHONAT%\Scripts;%PATH%
start %MYPATH%\expressPython.exe