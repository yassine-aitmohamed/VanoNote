@echo off
cd /d "%~dp0"
if exist ".venv\Scripts\python.exe" (".venv\Scripts\python.exe" vanonote.py & goto :eof)
where py >nul 2>nul && (py -3 vanonote.py) || (python vanonote.py)
