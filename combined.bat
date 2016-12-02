echo off
cls
rem Making a batch file with the ability to do what my other batch files do
:MAIN
cls
echo What would you like to do?
echo ...............................................
echo PRESS 1, 2 3, 4, 5, 6, 7, 8, 9, or 10 to select your task
echo ................................................
echo.
echo 1 - Display IP Information
rem Just pings google, yahoo, and youtube
echo 2 - Do a automated ping test
echo 3 - DNS Record Lookup
echo 4 - DNS Show
echo 5 - Taskkiller
echo 6 - IP Renewal
echo 7 - Who's connected to my PC?
echo 8 - Change text color
echo 9 - Uber Elite Haxor
set /p m=Type 1, 2, 3, or 4 then press enter:
if %m%==1 goto DisplayIP
if %m%==2 goto AutoPing
if %m%==3 goto DNS
if %m%==4 goto DNSShow
if %m%==5 goto Taskkiller
if %m%==6 goto IPRenewal
if %m%==7 goto PCConnected
if %m%==8 goto ChangeColor
if %m%==9 goto matrix
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
:DNSShow
cls
echo Showing your DNS records!
ipconfig /displaydns
pause
goto MAIN
:IPRenewal
cls
echo Releasing your current IP
ipconfig /release
ipconfig /release6
echo Retreiving you a IP Address
echo NOTE ---- This most likely well not change your IP
ipconfig /renew
ipconfig /renew6
cls
echo IP Renewal completed!
pause
goto MAIN
:PCConnected
cls
echo Finding who's connected to your PC!
cls
netstat
echo Found all the IPs currently communicating to your machine!
pause
goto MAIN
:ChangeColor
cls
echo Please select a color (a is green)!
set /p color=
color %color%
cls
echo Color Set!
pause
goto MAIN
:matrix
echo %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% 
goto matrix