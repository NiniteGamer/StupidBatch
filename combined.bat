echo off
cls
rem Making a batch file with the ability to do what my other batch files do
:MAIN
cls
echo What would you like to do?
echo ...............................................
echo PRESS 1, 2 OR 3 to select your task, or 4 to EXIT.
echo ...............................................
echo.
echo 1 - Display IP Information
rem Just pings google, yahoo, and youtube
echo 2 - Do a automated ping test
echo 3 - DNS (Features missing still wip)
echo 4 - Taskkiller
set /p m=Type 1, 2, 3, or 4 then press enter:
if %m%==1 goto DisplayIP
if %m%==2 goto AutoPing
if %m%==3 goto DNS
if %m%==4 goto Taskkiller
:DisplayIP
cls
echo Displaying IP information
ipconfig | findstr /R /C:"IP.* Address"
echo --------------------------------------------
echo Default Gateway Information
ipconfig | findstr /R /C:"Default"
echo --------------------------------------------
pause
goto MAIN
:AutoPing
cls
Set IPAddress=www.google.com
PING %IPAddress% -n 4
if errorlevel 1 (
	echo Ping to www.google.com unsuccessful!
) else (
	echo Ping to www.google.com successful!
)
Set IPAddress=www.yahoo.com
PING %IPAddress% -n 4
if errorlevel 1 (
	echo Ping to wwww.yahoo.com unsuccessful!
) else (
	echo Ping to www.yahoo.com successful!
)
Set IPAddress=www.youtube.com
PING %IPAddress% -n 4
if errorlevel 1 (
	echo Ping to www.youtube.com unsuccessful!
) else (
	echo Ping to www.youtube.com successful!
)
pause
goto MAIN
:DNS
cls
echo Please enter a dns name please format it as this www.google.com!
set /p dnsname=
ipconfig /displaydns | findstr /R /C:"%dnsname%"
if errorlevel 1 (
	echo Could not find DNS record!
) else (
	echo DNS Record found
)
pause
goto MAIN
:Taskkiller
cls
tasklist
echo What task would you like to kill?
set /p killtask=
taskkill /IM %killtask% /F
echo %killtask% has been killed!
pause
goto MAIN