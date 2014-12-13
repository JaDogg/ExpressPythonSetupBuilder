REM --------------------------------
REM Launch Express Python
REM 	- Bhathiya Perera
REM --------------------------------
@echo off
SET MYPATH=%CW_EXE_PATH%
SET PYTHONAT=%MYPATH%\Python34
REM Current Dir Should be Python path
CD %PYTHONAT%
SET PATH=%PATH%;%MYPATH%;%PYTHONAT%;%PYTHONAT%\Scripts
start expressPython.exe