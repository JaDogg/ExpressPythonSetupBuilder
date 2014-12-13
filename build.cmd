@ECHO OFF
CLS
ECHO -------------------------------------------------
ECHO Express Python Setup Builder
ECHO --Created by Bhathiya Perera
ECHO -------------------------------------------------
REM
REM Set Paths
REM
SET BUILD_PATH=%~dp0
ECHO Build Path is: %BUILD_PATH% 
CD %BUILD_PATH%
SET Z_PATH=%BUILD_PATH%7z\
SET WORKAT=%BUILD_PATH%ExpressPython\
SET PACKSAT=%BUILD_PATH%packs\
SET OUTPUTAT=%BUILD_PATH%output\
SET EXPRESS_7Z_OUT=ExpressPython.7z
SET EXPRESS_EXE_OUT=ExpressPythonSetup.exe
MKDIR %BUILD_PATH%ExpressPython > NUL 2>&1
MKDIR %BUILD_PATH%output > NUL 2>&1
REM
REM
REM Full path to compiled Express Python, Modify this accordingly
SET EXPRESS=D:\PPRJ\QT\build-PyRun-Desktop_Qt_5_3_2_MinGW_32bit_static-Release\release\expressPython.exe
SET PATH=%PATH%;%Z_PATH%
REM
REM Extract compilers if we don't have them
REM
IF EXIST %BUILD_PATH%compilers GOTO COMPILERS_AVAILABLE
MKDIR %BUILD_PATH%compilers > NUL 2>&1
7z x -y -o%BUILD_PATH%compilers %PACKSAT%FreeBASIC-1.00.0-win32.7z
7z x -y -o%BUILD_PATH%compilers %PACKSAT%NSIS.7z
:COMPILERS_AVAILABLE
SET PATH=%PATH%;%BUILD_PATH%compilers\FreeBASIC-1.00.0-win32\;%BUILD_PATH%compilers\NSIS\
REM
REM Create Launcher
REM
ECHO Building cmdStub
CD %BUILD_PATH%cmdStub
fbc -s gui "cmdStub.bas" "cmdStub.rc"
MOVE /Y cmdStub.exe %WORKAT% > NUL 2>&1
CD %BUILD_PATH%
ECHO Creating expressPython launcher
COPY /B /Y %WORKAT%cmdStub.exe + %PACKSAT%OPTIONS + %PACKSAT%launch.cmd %WORKAT%launch.exe > NUL 2>&1
DEL /F /Q %WORKAT%cmdStub.exe > NUL 2>&1
REM
REM Copy expressPython.exe
REM
COPY /Y %EXPRESS% %WORKAT% > NUL 2>&1
REM
REM Copy Snippets
REM
COPY /Y %PACKSAT%snippets.dat %WORKAT% > NUL 2>&1
ECHO Extracting Python...
IF EXIST %WORKAT%Python34 GOTO PYTHON_EXTRACTED
7z x -y -o%WORKAT% %PACKSAT%Python34.7z
:PYTHON_EXTRACTED
ECHO Extracting Completed
ECHO Creating %EXPRESS_7Z_OUT% ...
7z a -y ExpressPython.7z ExpressPython\ -mx9
CLS
ECHO Success
MOVE /Y %EXPRESS_7Z_OUT% %OUTPUTAT% > NUL 2>&1
ECHO Creating ExpressPythonSetup.exe ...
makensisw Setup.nsi
ECHO Success
MOVE /Y %EXPRESS_EXE_OUT% %OUTPUTAT% > NUL 2>&1
START %OUTPUTAT%
PAUSE
