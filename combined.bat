echo off
rem v0.0.4
cls
rem Making a batch file with the ability to do what my other batch files do
:MAIN
cls
echo What would you like to do?
echo ...............................................
echo TYPE 1-20 to select your task
echo This batch file is made by Joshua Bennett!
echo ................................................
echo.
echo 1 - Display IP Information
rem Just pings google, yahoo, and youtube
echo 2 - Do a automated ping test
echo 3 - DNS Record Lookup
rem Still working on it (still don't know exactly how I want it to work)
echo 4 - DNS Show
echo 5 - Taskkiller
echo 6 - IP Renewal
echo 7 - Who's connected to my PC?
echo 8 - Change text color
rem I don't think I'll leave this in!
echo 9 - Uber Elite Haxor
echo 10 - Help!
echo 11 - Mini-Game!
echo 12 - Ping!
set /p m=Type 1-20 then press enter:
if %m%==1 goto DisplayIP
if %m%==2 goto AutoPing
if %m%==3 goto DNS
if %m%==4 goto DNSShow
if %m%==5 goto Taskkiller
if %m%==6 goto IPRenewal
if %m%==7 goto PCConnected
if %m%==8 goto ChangeColor
if %m%==9 goto matrix
if %m%==10 goto help
if %m%==11 goto minigame
if %m%==12 goto pinger
if %m%==420 goto blazeit
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
if errorlevel 1 (
	cls
	echo Returning to main menu!
	pause
	goto MAIN
)
echo %killtask% has been killed!
pause
goto MAIN
:DNSShow
cls
echo Showing your DNS records!
ipconfig /displaydns | findstr /R /C:"Record Name"
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
:minigame
cls
echo Please enter a number below!
set /p playergiven=
set computergiven=%random%
if %playergiven% GTR %computergiven% (
	echo Player wins! %playergiven% bigger than %computergiven%
) else (
	echo Computer Wins! %computergiven% bigger than %playergiven%
)
pause
cls
echo Would you like to play again? (1 for yes, 2 for no)!
set /p yu=Please enter here:
if %yu%==1 goto minigame
if %yu%==2 goto MAIN
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
echo Please select a color!
echo Preset modes!
echo Haxor
set /p color=Please enter here:
if %color%==Haxor set color=a
color %color%
cls
echo Color Set!
pause
goto MAIN
:matrix
cls
color a
echo %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% 
goto matrix
:help
cls
echo Welcome to the Help Section!
echo This help menu is still a WIP
echo What would you like help with?
echo --------------------------------------------------
echo 1 - Color Changing
echo 2 - Display IP
echo 3 - AutoPing
echo 4 - DNS Lookup
echo 5 - DNS Show
echo 6 - Taskkiller
set /p helped=Please enter one of the above numbers!
if errorlevel 1 (
	cls
	echo You've enter a invalid number!
	pause
	goto help
)
if %helped%==1 goto ColorHelp
if %helped%==2 goto DisplayIP
if %helped%==3 goto AutoPingHelp
:ColorHelp
cls
echo Welcome to Color Guide
echo Here's all the color codes you'll need!
echo a = Light Green		b = Light Aqua
echo c = Light Red	    	d = Light Purple
echo e = Light Yellow	f = Bright White
echo 0 = Black	        1 = Blue
echo 2 = Green	        3 = Aqua
echo 4 = Red	        	5 = Purple
echo 6 = Yellow	        7 = White
echo 8 = Gray
pause
cls
echo Do you want to return to the help menu or main menu?
set /p l=Please type either Help or Main!
if %l%==Help goto help
if %l%==Main goto MAIN
pause
:DisplayIP
cls
echo Welcome to the Display IP Guide
echo What does display ip do?
echo Display IP shows you your current IPv4 and IPv6 addresses!
echo it also displays your current default gateway!
pause
cls
echo Do you want to return to the help menu or main menu?
set /p l=Please type either Help or Main!
if %l%==Help goto help
if %l%==Main goto MAIN
pause
:AutoPingHelp
cls
echo Welcome to the Auto Ping Help!
echo What does Auto Ping do?
echo Auto Ping pings Google, Yahoo, and Youtube to check your connectivity to the internet!
pause
cls
echo Do you want to return to the help menu or main menu?
set /p l=Please type either Help or Main!
if %l%==Help goto help
if %l%==Main goto MAIN
pause
:pinger
cls
echo Welcome to the Pinger!
echo Please enter a ip or site name to ping!
set /p u=Please enter here:
echo How many times would you like to ping?
set /p c=Please enter here:
if %c% gtr 100 (
	cls
	echo ERROR: Can't ping over 100!
	pause
	goto pinger
)
ping %u% -n %c%
if errorlevel 1 (
	echo Ping to %u% unsuccessful!
	pause
	echo Returning to Ping Test Menu!
	goto pinger
) else (
	echo You've successfully pinged %u% %c% times!
)
pause
cls
echo Would like to return to the Ping Menu(1) or Main menu(0)?
set /p y=Please enter either 1 or 0 here:
if %y%==1 goto pinger
if %y%==0 goto MAIN
:blazeit
cls
echo BLAZEEEEE IT!!
start https://www.youtube.com/watch?v=53tdy3hCxMc
pause
goto MAIN