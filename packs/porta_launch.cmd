REM --------------------------------
REM Launch Express Python
REM 	- Bhathiya Perera
REM --------------------------------
@echo off
SET MYPATH=%CW_EXE_PATH%
SET PYTHONAT=%MYPATH%\Python36
REM Current Dir Should be Python path
CD %PYTHONAT%
SET PATH=%MYPATH%;%PYTHONAT%;%PYTHONAT%\Scripts;%PATH%
start expressPython.exe