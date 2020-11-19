@echo off
title random game
color 0A
if "%1" neq "" ( goto %1)

:Menu
cls
echo 1. Start
echo 2. Credits
echo 3. Exit
set /p answer=Type the number of your option and press enter : 
if %answer%==1 goto Start_1
if %answer%==2 goto Credits
if %answer%==3 goto Exit

:Exit
cls
echo Thanks for playing!
pause
exit /b

:Credits
cls
echo Credits
echo.
echo copy pasted from internet
pause
goto Menu

:Start_1
cls
set /p player=Enter username:
cls
echo Hello %player%
echo Let's begin!
goto Start_2

:Start_2
echo Oh, no! You're surrounded by enemies.
echo There are five of them, and they're all armed.
echo If you fight them, you have a chance of surviving!
echo.
set /p answer=Would you like to fight or run?
if %answer%==fight goto Fight_1
if %answer%==run goto Run_1

pause

:Run_1
cls
echo You ran away like a coward and died. jk you live to see another day
pause
goto Start_2

:Fight_1
echo Prepare to fight.
echo The enemies suddenly rush you all at once.
echo.
goto Fight_1_Loop

:Fight_1_Loop
set /a num=%random%
echo %num%
if ((num%%4==0)) then goto Lose_Fight
goto Win_Fight

:Lose_Fight
echo You were defeated. Play again?
pause
goto Menu

:Win_Fight
cls
echo You are victorious!
set /p answer=Would you like to play again? [y/n]
if %answer%=='y' goto Start_2
if %answer%=='n' goto 'Exit'
:Save
goto Start_2