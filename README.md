# AutoParameters
A common difficulty with parameters is that you can only have up to 9 parameters without using the shift command (which replaces the initial ones).

This function replaces `%1` and `%~1` variables with %F1% and %F1Q% variables. This allows you to handle an infinite amount of parameters. For example, the 20th paramater would be `%F20%`. The script also allows you to easily check how many paramaters there are with the `%ParamCount%` variable.

# How to use

The simple 10 lines of code must be placed at the top of your script (after `@echo off` if you have it). It can also be put inside a function to handle it's parameters, but note that this means you cannot call it from the top of your file.

This will work:
```
@echo off
::ITCMD Parameter Reader
set ParamCount=0
:FunctionLoop
if "%~1"=="" goto EndFunction
set /a ParamCount+=1
set F%ParamCount%=%1
Set F%ParamCount%Q=%~1
shift
goto Functionloop
:EndFunction

::The Rest of your code::
echo %F1% is the first Parameter
pause exit /b
```
This will not:

```
@echo off
call :ParamReader

::The Rest of your code::
echo %F1% is the first Parameter
pause
exit /b

:ParamReader
::ITCMD Parameter Reader
set ParamCount=0
:FunctionLoop
if "%~1"=="" goto EndFunction
set /a ParamCount+=1
set F%ParamCount%=%1
Set F%ParamCount%Q=%~1
shift
goto Functionloop
:EndFunction


```
It will not work because when you call a function in your script it can have its own variables.
