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
