REM https://infostart.ru/public/104654/
ECHO OFF
CLS

REM ������������� ����������
set server_name=1c-vsrv
set login=admin
set password=YOUR_PASSWORD

setlocal enabledelayedexpansion

REM ��� ���� � ����� SQLDataBaseList.log ������� � ������� �����
FOR /F "tokens=1,2" %%I IN (%~dp0SQLDataBaseList.log) DO (

ECHO "Open %%I"
REM ���� ����� �������
"C:\Program Files\1cv8\common\1cestart.exe" CONFIG /S"!server_name!\%%I" /N"!login!" /P"!password!"
timeout 10
)