echo off
setlocal enableextensions disabledelayedexpansion
color a
REM Debug mode enabled for developer :)
set compdiff==0
set debugvar==1
set displaysecrets==0
title Andy Batch v0.0.7
set tm=%time%
rem v0.0.7
cls
echo If you're running windows 10 and the text is small
echo You can change it by right-clicking the bar and
echo going to properties then font to change the font size
pause
rem Making a batch file with the ability to do what my other batch files do
:MAIN
cls
echo What would you like to do?
if %debugvar%==1 echo %tm%
if %debugvar%==1 echo %Date%

REM All credit for this peice of code goes to http://www.robvanderwoude.com/
REM FOR %%A IN (%Date%) DO SET Today=%%A
REM SET Now=%Time%
REM ECHO It's %Today% today
REM ECHO It's %Now% now

echo ...............................................
echo TYPE 1-20 to select your task
echo This batch file is made by Joshua Bennett!
echo ...............................................
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
echo 9 - Help!
echo 10 - Mini-Game!
echo 11 - Ping!
echo 12 - Route Table!
echo 90 - Settings!
if %displaysecrets%==1 echo 420 - Dank M8
if %displaysecrets%==1 echo 421 - Uber Elite Haxor
set /p m=Type 1-20 then press enter:
if %m%==1 goto DisplayIP
if %m%==2 goto AutoPing
if %m%==3 goto DNS
if %m%==4 goto DNSShow
if %m%==5 goto Taskkiller
if %m%==6 goto IPRenewal
if %m%==7 goto PCConnected
if %m%==8 goto ChangeColor
if %m%==9 goto help
REM if %m%==10 goto gamemain
if %m%==10 goto play
if %m%==11 goto pinger
if %m%==12 goto routetable
if %m%==420 goto blazeit
if %m%==421 goto matrix
if %m%==90 goto settings
:routetable
cls
netstat -r
pause
goto MAIN
:settings
cls
echo -
echo ----------------------------
echo Welcome to the Settings Menu
echo ----------------------------
echo -
echo 1 - DisplayIP Settings
echo 2 - Debug Settings
echo 3 - Hidden Secrets
echo 4 - Minigame Difficulty
echo 10 - Return to Main Menu
set /p s=Please enter here:
if %s%==1 goto DisplayIPSettings
if %s%==2 goto debug
if %s%==3 goto HiddenSecrets
if %s%==4 goto difffromsettings
if %s%==10 goto MAIN
:DisplayIPSettings
cls
echo -
echo ----------------------------------
echo Welcome to the DisplayIP Settings!
echo ----------------------------------
echo -
echo 1 - Display IPv6
echo 2 - Disable Display of IPv6
echo 10 - Return to Settings Menu
set /p lp=Please enter here:
cls
if %lp%==1 set displayipv6=IP.*
if %lp%==1 echo Now displaying IPv6 addresses!
if %lp%==1 if %debugvar%==1 echo #DEBUG# - %displayipv6% - #DEBUG#
if %lp%==2 set displayipv6=IPv4.*
if %lp%==2 echo Disabled displaying of IPv6 addresses!
if %lp%==2 if %debugvar%==1 echo #DEBUG# - %displayipv6% - #DEBUG#
if %lp%==10 goto settings
pause
goto DisplayIPSettings
:HiddenSecrets
cls
echo Do you wish to reveal the hidden secrets! (Yes or No)
set /p gt=Please enter here:
if %gt%==yes set displaysecrets=1
if %gt%==Yes set displaysecrets=1
if %gt%==no set displaysecrets=0
if %gt%==No set displaysecrets=0
cls
if %displaysecrets%==1 echo Successfully displaying secrets in main menu!
if %displaysecrets%==0 echo Successfully disabled displaying secrets in main menu!
pause
cls
echo Would you like to return to the settings menu or main menu? (1=Settings 2=Main)
set /p op=Please enter here:
if %op%==1 goto settings
if %op%==2 goto MAIN
goto settings
:debug
cls
echo Would you like to enable or disable debug?
set /p tyu=Please enter 1 or 0 here:
if %tyu%==1 set debugvar==1
if %tyu%==1 echo Debug enabled!
if %tyu%==0 set debugvar==0
if %tyu%==0 echo Debug Disabled!
pause
goto MAIN
:DisplayIP
cls
echo Displaying IP information
ipconfig | findstr /R /C:"%displayipv6% Address"
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
echo *WARNING* This well disconnect you from the internet temporary!
echo Type 1 if you are sure you want to continue or type 2 if you want to return to Main Menu!
set /p h=Please enter here:
%h%==2 goto MAIN
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
REM :gamemain
REM cls
REM echo -
REM echo --------------------------------------
REM echo Welcome to the Computer Guessing Game!
REM echo Please enter 1, 2, or 3 Below!
REM echo --------------------------------------
REM echo -
REM echo 1 - Play!
REM echo 2 - How to play!
REM echo 3 - Return to Main Menu!
REM set /p m=Please enter one here!
REM if %m%==1 goto play
REM if %m%==2 goto howtoplay
REM if %m%==3 goto quit
:play
cls
echo If you want to change your difficulty
echo Please go to the settings menu for now
pause
if %compdiff%==0 (
	goto diff
)
:playcont
cls
echo Welcome to the Computer Guessing Game
if %compdiff%==1 set randgen=%%100+1
if %compdiff%==2 set randgen=%%1000+1
if %compdiff%==3 set randgen=%%10000+1
if %compdiff%==4 set randgen=%%30000+1
if %compdiff%==1 set diff=Easy
if %compdiff%==1 set numrange=1-100
if %compdiff%==2 set diff=Medium
if %compdiff%==2 set numrange=1-1000
if %compdiff%==3 set diff=Hard
if %compdiff%==3 set numrange=1-10000
if %compdiff%==4 set diff=Insane
if %compdiff%==4 set numrange=1-30000
if %debugvar%==1 echo #DEBUG# - %compdiff% %randgen% %diff% %numrange% - #DEBUG#
echo You've selected %diff% and the number range is %numrange%!
pause
set /p q=Please enter your number here:
if %q% GTR 100 if %compdiff%==1 (
	cls
	echo You can only enter number 1 - 100
	pause
	goto play
)
if %q% GTR 1000 if %compdiff%==2 (
	cls
	echo You can only enter number 1 - 1000
	pause
	goto play
)
if %q% GTR 10000 if %compdiff%==3 (
	cls
	echo You can only enter number 1 - 10000
	pause
	goto play
)
if %q% GTR 30000 if %compdiff%==4 (
	cls
	echo You can only enter number 1 - 30000
	pause
	goto play
)
set /a computernumb=%random%%randgen%
if %debugvar%==1 echo #DEBUG# - Computers Random Number - %computernumb% - #DEBUG#
if %q% GTR %computernumb% (
	echo Player wins! %q% bigger than %computernumb%
) else (
	echo Computer Wins! %computernumb% bigger than %q%
)
pause
cls
echo Would you like to return to the main menu?
echo Yes
echo No
set /p ui=Please enter here:
if %ui%==Yes goto MAIN
if %ui%==yes goto MAIN
if %ui%==No goto play
if %ui%==no goto play
pause
:diff
cls
echo -
echo ---------------------------------
if %debugvar%==1 echo #DEBUG# - Computer Diff is %compdiff% - #DEBUG#
echo Please select a difficulty below
echo ---------------------------------
echo -
echo Easy
echo Medium
echo Hard
echo Insane
set /p h=Please enter here:
if %h%==Easy set compdiff=1
if %h%==Medium set compdiff=2
if %h%==Hard set compdiff=3
if %h%==Insane set compdiff=4
if %h%==easy set compdiff=1
if %h%==medium set compdiff=2
if %h%==hard set compdiff=3
if %h%==insane set compdiff=4
if %debugvar%==1 echo #DEBUG# - Computer diff now set to %compdiff% - #DEBUG#
pause
goto playcont
:difffromsettings
cls
echo -
echo ---------------------------------
if %debugvar%==1 echo #DEBUG# - Computer Diff is %compdiff% - #DEBUG#
echo Please select a difficulty below
echo ---------------------------------
echo -
echo Easy
echo Medium
echo Hard
echo Insane
set /p h=Please enter here:
if %h%==Easy set compdiff=1
if %h%==Medium set compdiff=2
if %h%==Hard set compdiff=3
if %h%==Insane set compdiff=4
if %h%==easy set compdiff=1
if %h%==medium set compdiff=2
if %h%==hard set compdiff=3
if %h%==insane set compdiff=4
if %debugvar%==1 echo #DEBUG# - Computer diff now set to %compdiff% - #DEBUG#
pause
goto settings
:quit
goto MAIN
:ChangeColor
cls
echo Please select a color!
echo Preset modes! (Don't put spaces inbetween words)
echo --------------------------------------------------------------------
echo LightGreen, LightRed, LightYellow, Black, Green, Red, Yellow
echo Gray, LightAqua, LightPurple, BrightWhite, Blue, Aqua, Purple, White
echo --------------------------------------------------------------------
set /p color=Please enter here:
if %color%==LightGreen set color=a
if %color%==lightgreen set color=a
if %color%==LightRed set color=c
if %color%==lightred set color=c
if %color%==LightYellow set color=e
if %color%==lightyellow set color=e
if %color%==Black set color=0
if %color%==black set color=0
if %color%==Green set color=2
if %color%==green set color=2
if %color%==Red set color=4
if %color%==red set color=4
if %color%==Yellow set color=6
if %color%==Gray set color=8
if %color%==LightAqua set color=b
if %color%==LightPurple set color=d
if %color%==BrightWhite set color=f
if %color%==Blue set color=1
if %color%==Aqua set color=3
if %color%==Purple set color=5
if %color%==White set color=7
color %color%
cls
echo Color Set!
echo Would you like to return to the color menu or return to the main menu?
echo 1 - Color
echo 2 - Main
set /p pipi=Please enter here:
if %pipi%==1 goto changecolor
if %pipi%==2 goto MAIN
pause
:matrix
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
echo 10 - Return to Main Menu
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
if %helped%==10 goto MAIN
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
if %l%==help goto help
if %l%==Main goto MAIN
if %l%==main goto MAIN
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
if %l%==help goto help
if %l%==Main goto MAIN
if %l%==main goto MAIN
pause
:pinger
cls
echo Welcome to the Pinger!
echo Please enter a ip or site name to ping!
set /p u=Please enter here:
if %debugvar%==1 echo #NOTE# - Not letting them ping over 100 times - #NOTE#
echo How many times would you like to ping?
set /p c=Please enter here:
if %c% gtr 100 (
	cls
	echo ERROR: Can't ping over 100!
	pause
	goto pinger
)
ping %u% -n %c%
if %debugvar%==1 echo #DEBUG# - Pinging - %u% Amount - %c% - #DEBUG#
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