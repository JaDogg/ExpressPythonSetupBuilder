@ECHO OFF
CLS
ECHO -------------------------------------------------
ECHO Express Python Compiler
ECHO --Created by Bhathiya Perera
ECHO -------------------------------------------------
REM
REM Set Paths, Change these accordingly
REM
SET STATIC_QT_BIN=C:\Qt\Static\5.3.2\bin\
SET MINGW_BIN=C:\Qt\Qt5.3.2\Tools\mingw482_32\bin\
SET PYTHON_LOCATION=C:\Python34
SET BUILD_PATH=%~dp0
MKDIR %BUILD_PATH%expressPythonRelease > NUL 2>&1
SET RELEASE_LOCATION=%BUILD_PATH%expressPythonRelease
SET SOURCE_LOCATION=%BUILD_PATH%expressPython
REM
REM Goto Release Location
REM
IF EXIST %PYTHON_LOCATION% GOTO PYTHON_INSTALLED
CD %BUILD_PATH%
msiexec /i %BUILD_PATH%packs\python-3.4.2.msi /qr
:PYTHON_INSTALLED
CD %RELEASE_LOCATION%
SET PATH=%STATIC_QT_BIN%;%MINGW_BIN%;%PATH%
%STATIC_QT_BIN%qmake.exe -spec win32-g++ CONFIG+=release -o Makefile %SOURCE_LOCATION%\PyRun.pro
%MINGW_BIN%mingw32-make -f Makefile.Release clean
%MINGW_BIN%mingw32-make -f Makefile.Release