@echo off

sc stop "1C:Enterprise 8.3 Server Agent (x86-64)"
TIMEOUT 30

FOR /D %%i in ("C:\Program Files\1cv8\srvinfo\reg_1541\*") do rmdir /S /Q "%%i"

TIMEOUT 30
sc start "1C:Enterprise 8.3 Server Agent (x86-64)"