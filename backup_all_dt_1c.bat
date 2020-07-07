ECHO OFF
CLS

REM Устанавливаем переменные
set server_name=1c-vsrv
set login=admin
set password=YOUR_PASSWORD

setlocal enabledelayedexpansion

REM Если дата на пк формата dd.mm.yyyy
REM set DateNow=!DATE:~6,4!-!DATE:~3,2!-!DATE:~0,2!
REM set TimeNow=!TIME:~0,2!-!TIME:~3,2!-!TIME:~6,2!

REM Если дата на пк формата yyyy-mm-dd
set DateNow=!DATE:~0,4!-!DATE:~5,2!-!DATE:~8,2!
set TimeNow=!TIME:~0,2!-!TIME:~3,2!-!TIME:~6,2!
set TimeNow=!TimeNow: =0!

SET BACKUPFOLDER=\\gv01-srv\1c_backup_dt\!DateNow!\

REM Для имен в файле SQLDataBaseList.log лежащем в текущей папке
FOR /F "tokens=1,2" %%I IN (%~dp0SQLDataBaseList.log) DO (

REM Если дата на пк формата dd.mm.yyyy
REM set DateNow=!DATE:~6,4!-!DATE:~3,2!-!DATE:~0,2!
REM set TimeNow=!TIME:~0,2!-!TIME:~3,2!-!TIME:~6,2!

REM Если дата на пк формата yyyy-mm-dd
set DateNow=!DATE:~0,4!-!DATE:~5,2!-!DATE:~8,2!
set TimeNow=!TIME:~0,2!-!TIME:~3,2!-!TIME:~6,2!
set TimeNow=!TimeNow: =0!

ECHO "Backup %%I"
REM Если папка не существует создаем папку
IF NOT EXIST "!BACKUPFOLDER!" MD "!BACKUPFOLDER!"
REM Весь цимус скрипта
"C:\Program Files\1cv8\common\1cestart.exe" CONFIG /S"!server_name!\%%I" /N"!login!" /P"!password!" /Out"!BACKUPFOLDER!\%%I_!DateNow!_!TimeNow!.log" /DumpIB"!BACKUPFOLDER!\%%I_!DateNow!_!TimeNow!.dt"
timeout 100
)